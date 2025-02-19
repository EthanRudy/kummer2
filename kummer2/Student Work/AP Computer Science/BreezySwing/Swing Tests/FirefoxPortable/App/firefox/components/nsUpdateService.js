//@line 42 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"

const PREF_APP_UPDATE_ENABLED             = "app.update.enabled";
const PREF_APP_UPDATE_AUTO                = "app.update.auto";
const PREF_APP_UPDATE_MODE                = "app.update.mode";
const PREF_APP_UPDATE_SILENT              = "app.update.silent";
const PREF_APP_UPDATE_INTERVAL            = "app.update.interval";
const PREF_APP_UPDATE_TIMER               = "app.update.timer";
const PREF_APP_UPDATE_LOG_BRANCH          = "app.update.log.";
const PREF_APP_UPDATE_URL                 = "app.update.url";
const PREF_APP_UPDATE_URL_OVERRIDE        = "app.update.url.override";
const PREF_APP_UPDATE_URL_DETAILS         = "app.update.url.details";
const PREF_APP_UPDATE_CHANNEL             = "app.update.channel";
const PREF_APP_UPDATE_SHOW_INSTALLED_UI   = "app.update.showInstalledUI";
const PREF_APP_UPDATE_LASTUPDATETIME_FMT  = "app.update.lastUpdateTime.%ID%";
const PREF_APP_EXTENSIONS_VERSION         = "app.extensions.version";
const PREF_GENERAL_USERAGENT_LOCALE       = "general.useragent.locale";
const PREF_APP_UPDATE_INCOMPATIBLE_MODE   = "app.update.incompatible.mode";
const PREF_UPDATE_NEVER_BRANCH            = "app.update.never."
const PREF_PARTNER_BRANCH                 = "app.partner.";

const URI_UPDATE_PROMPT_DIALOG  = "chrome://mozapps/content/update/updates.xul";
const URI_UPDATE_HISTORY_DIALOG = "chrome://mozapps/content/update/history.xul";
const URI_BRAND_PROPERTIES      = "chrome://branding/locale/brand.properties";
const URI_UPDATES_PROPERTIES    = "chrome://mozapps/locale/update/updates.properties";
const URI_UPDATE_NS             = "http://www.mozilla.org/2005/app-update";

const KEY_APPDIR          = "XCurProcD";
//@line 70 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
const KEY_UPDROOT         = "UpdRootD";
const KEY_UAPPDATA        = "UAppData";
//@line 73 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"

const DIR_UPDATES         = "updates";
const FILE_UPDATE_STATUS  = "update.status";
const FILE_UPDATE_ARCHIVE = "update.mar";
const FILE_UPDATE_LOG     = "update.log"
const FILE_UPDATES_DB     = "updates.xml";
const FILE_UPDATE_ACTIVE  = "active-update.xml";
const FILE_PERMS_TEST     = "update.test";
const FILE_LAST_LOG       = "last-update.log";

const MODE_RDONLY   = 0x01;
const MODE_WRONLY   = 0x02;
const MODE_CREATE   = 0x08;
const MODE_APPEND   = 0x10;
const MODE_TRUNCATE = 0x20;

const PERMS_FILE      = 0644;
const PERMS_DIRECTORY = 0755;

const STATE_NONE            = "null";
const STATE_DOWNLOADING     = "downloading";
const STATE_PENDING         = "pending";
const STATE_APPLYING        = "applying";
const STATE_SUCCEEDED       = "succeeded";
const STATE_DOWNLOAD_FAILED = "download-failed";
const STATE_FAILED          = "failed";

// From updater/errors.h:
const WRITE_ERROR = 7;

const DOWNLOAD_CHUNK_SIZE           = 300000; // bytes
const DOWNLOAD_BACKGROUND_INTERVAL  = 600;    // seconds
const DOWNLOAD_FOREGROUND_INTERVAL  = 0;

// Values for the PREF_APP_UPDATE_INCOMPATIBLE_MODE pref. See documentation in
// code below. 
const INCOMPATIBLE_MODE_NEWVERSIONS   = 0;
const INCOMPATIBLE_MODE_NONEWVERSIONS = 1;

const POST_UPDATE_CONTRACTID = "@mozilla.org/updates/post-update;1";

const nsILocalFile            = Components.interfaces.nsILocalFile;
const nsIUpdateService        = Components.interfaces.nsIUpdateService;
const nsIUpdateItem           = Components.interfaces.nsIUpdateItem;
const nsIPrefLocalizedString  = Components.interfaces.nsIPrefLocalizedString;
const nsIIncrementalDownload  = Components.interfaces.nsIIncrementalDownload;
const nsIFileInputStream      = Components.interfaces.nsIFileInputStream;
const nsIFileOutputStream     = Components.interfaces.nsIFileOutputStream;
const nsICryptoHash           = Components.interfaces.nsICryptoHash;

const Node = Components.interfaces.nsIDOMNode;

var gApp        = null;
var gPref       = null;
var gABI        = null;
var gOSVersion  = null;
var gConsole    = null;
var gLogEnabled = { };

// shared code for suppressing bad cert dialogs
//@line 40 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/../../shared/src/badCertHandler.js"

/**
 * Only allow built-in certs for HTTPS connections.  See bug 340198.
 */
function checkCert(channel) {
  if (!channel.originalURI.schemeIs("https"))  // bypass
    return;

  const Ci = Components.interfaces;  
  var cert =
      channel.securityInfo.QueryInterface(Ci.nsISSLStatusProvider).
      SSLStatus.QueryInterface(Ci.nsISSLStatus).serverCert;

  var issuer = cert.issuer;
  while (issuer && !cert.equals(issuer)) {
    cert = issuer;
    issuer = cert.issuer;
  }

  if (!issuer || issuer.tokenName != "Builtin Object Token")
    throw "cert issuer is not built-in";
}

/**
 * This class implements nsIBadCertListener.  It's job is to prevent "bad cert"
 * security dialogs from being shown to the user.  It is better to simply fail
 * if the certificate is bad. See bug 304286.
 */
function BadCertHandler() {
}
BadCertHandler.prototype = {

  // nsIBadCertListener
  confirmUnknownIssuer: function(socketInfo, cert, certAddType) {
    LOG("EM BadCertHandler: Unknown issuer");
    return false;
  },

  confirmMismatchDomain: function(socketInfo, targetURL, cert) {
    LOG("EM BadCertHandler: Mismatched domain");
    return false;
  },

  confirmCertExpired: function(socketInfo, cert) {
    LOG("EM BadCertHandler: Expired certificate");
    return false;
  },

  notifyCrlNextupdate: function(socketInfo, targetURL, cert) {
  },

  // nsIChannelEventSink
  onChannelRedirect: function(oldChannel, newChannel, flags) {
    // make sure the certificate of the old channel checks out before we follow
    // a redirect from it.  See bug 340198.
    checkCert(oldChannel);
  },

  // nsIInterfaceRequestor
  getInterface: function(iid) {
    if (iid.equals(Components.interfaces.nsIBadCertListener) ||
        iid.equals(Components.interfaces.nsIChannelEventSink))
      return this;

    Components.returnCode = Components.results.NS_ERROR_NO_INTERFACE;
    return null;
  },

  // nsISupports
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIBadCertListener) &&
        !iid.equals(Components.interfaces.nsIChannelEventSink) &&
        !iid.equals(Components.interfaces.nsIInterfaceRequestor) &&
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};
//@line 134 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"

/**
 * Logs a string to the error console. 
 * @param   string
 *          The string to write to the error console..
 */  
function LOG(module, string) {
  if (module in gLogEnabled) {
    dump("*** " + module + ": " + string + "\n");
    gConsole.logStringMessage(string);
  }
}

/**
 * Convert a string containing binary values to hex.
 */
function binaryToHex(input) {
  var result = "";
  for (var i = 0; i < input.length; ++i) {
    var hex = input.charCodeAt(i).toString(16);
    if (hex.length == 1)
      hex = "0" + hex;
    result += hex;
  }
  return result;
}

/**
 * Gets a File URL spec for a nsIFile
 * @param   file
 *          The file to get a file URL spec to
 * @returns The file URL spec to the file
 */
function getURLSpecFromFile(file) {
  var ioServ = Components.classes["@mozilla.org/network/io-service;1"]
                         .getService(Components.interfaces.nsIIOService);
  var fph = ioServ.getProtocolHandler("file")
                  .QueryInterface(Components.interfaces.nsIFileProtocolHandler);
  return fph.getURLSpecFromFile(file);
}

/**
 * Gets the specified directory at the specified hierarchy under a 
 * Directory Service key. 
 * @param   key
 *          The Directory Service Key to start from
 * @param   pathArray
 *          An array of path components to locate beneath the directory 
 *          specified by |key|
 * @return  nsIFile object for the location specified. If the directory
 *          requested does not exist, it is created, along with any
 *          parent directories that need to be created.
 */
function getDir(key, pathArray) {
  return getDirInternal(key, pathArray, true, false);
}

/**
 * Gets the specified directory at the speciifed hierarchy under a 
 * Directory Service key. 
 * @param   key
 *          The Directory Service Key to start from
 * @param   pathArray
 *          An array of path components to locate beneath the directory 
 *          specified by |key|
 * @return  nsIFile object for the location specified. If the directory
 *          requested does not exist, it is NOT created.
 */
function getDirNoCreate(key, pathArray) {
  return getDirInternal(key, pathArray, false, false);
}

/**
 * Gets the specified directory at the specified hierarchy under the 
 * update root directory.
 * @param   pathArray
 *          An array of path components to locate beneath the directory 
 *          specified by |key|
 * @return  nsIFile object for the location specified. If the directory
 *          requested does not exist, it is created, along with any
 *          parent directories that need to be created.
 */
function getUpdateDir(pathArray) {
  return getDirInternal(KEY_APPDIR, pathArray, true, true);
}

/**
 * Gets the specified directory at the speciifed hierarchy under a 
 * Directory Service key. 
 * @param   key
 *          The Directory Service Key to start from
 * @param   pathArray
 *          An array of path components to locate beneath the directory 
 *          specified by |key|
 * @param   shouldCreate
 *          true if the directory hierarchy specified in |pathArray|
 *          should be created if it does not exist,
 *          false otherwise.
 * @param   update
 *          true if finding the update directory,
 *          false otherwise.
 * @return  nsIFile object for the location specified. 
 */
function getDirInternal(key, pathArray, shouldCreate, update) {
  var fileLocator = Components.classes["@mozilla.org/file/directory_service;1"]
                              .getService(Components.interfaces.nsIProperties);
  var dir = fileLocator.get(key, Components.interfaces.nsIFile);
//@line 242 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
  if (update) {
    try {
      dir = fileLocator.get(KEY_UPDROOT, Components.interfaces.nsIFile);
    } catch (e) {
    }
  }
//@line 249 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
  for (var i = 0; i < pathArray.length; ++i) {
    dir.append(pathArray[i]);
    if (shouldCreate && !dir.exists())
      dir.create(nsILocalFile.DIRECTORY_TYPE, PERMS_DIRECTORY);
  }
  return dir;
}

/**
 * Gets the file at the speciifed hierarchy under a Directory Service key.
 * @param   key
 *          The Directory Service Key to start from
 * @param   pathArray
 *          An array of path components to locate beneath the directory 
 *          specified by |key|. The last item in this array must be the
 *          leaf name of a file.
 * @return  nsIFile object for the file specified. The file is NOT created
 *          if it does not exist, however all required directories along 
 *          the way are.
 */
function getFile(key, pathArray) {
  var file = getDir(key, pathArray.slice(0, -1));
  file.append(pathArray[pathArray.length - 1]);
  return file;
}

/**
 * Gets the file at the speciifed hierarchy under the update root directory.
 * @param   pathArray
 *          An array of path components to locate beneath the directory 
 *          specified by |key|. The last item in this array must be the
 *          leaf name of a file.
 * @return  nsIFile object for the file specified. The file is NOT created
 *          if it does not exist, however all required directories along 
 *          the way are.
 */
function getUpdateFile(pathArray) {
  var file = getUpdateDir(pathArray.slice(0, -1));
  file.append(pathArray[pathArray.length - 1]);
  return file;
}

/**
 * Closes a Safe Output Stream
 * @param   fos
 *          The Safe Output Stream to close
 */
function closeSafeOutputStream(fos) {
  if (fos instanceof Components.interfaces.nsISafeOutputStream) {
    try {
      fos.finish();
    }
    catch (e) {
      fos.close();
    }
  }
  else
    fos.close();
}

/**
 * Returns human readable status text from the updates.properties bundle
 * based on an error code
 * @param   code
 *          The error code to look up human readable status text for
 * @param   defaultCode
 *          The default code to look up should human readable status text
 *          not exist for |code|
 * @returns A human readable status text string
 */
function getStatusTextFromCode(code, defaultCode) {
  var sbs = 
      Components.classes["@mozilla.org/intl/stringbundle;1"].
      getService(Components.interfaces.nsIStringBundleService);
  var updateBundle = sbs.createBundle(URI_UPDATES_PROPERTIES);
  var reason = updateBundle.GetStringFromName("checker_error-" + defaultCode);
  try {
    reason = updateBundle.GetStringFromName("checker_error-" + code);
    LOG("General", "Transfer Error: " + reason + ", code: " + code);
  }
  catch (e) {
    // Use the default reason
    LOG("General", "Transfer Error: " + reason + ", code: " + defaultCode);
  }
  return reason;
}

/**
 * Get the Active Updates directory
 * @param   key
 *          The Directory Service Key (optional).
 *          If used, don't search local appdata on Win32 and don't create dir.
 * @returns The active updates directory, as a nsIFile object
 */
function getUpdatesDir(key) {
  // Right now, we only support downloading one patch at a time, so we always
  // use the same target directory.
  var fileLocator =
      Components.classes["@mozilla.org/file/directory_service;1"].
      getService(Components.interfaces.nsIProperties);
  var appDir;
  if (key)
    appDir = fileLocator.get(key, Components.interfaces.nsIFile);
  else {
    appDir = fileLocator.get(KEY_APPDIR, Components.interfaces.nsIFile);
//@line 355 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
    try {
      appDir = fileLocator.get(KEY_UPDROOT, Components.interfaces.nsIFile);
    } catch (e) {
    }
//@line 360 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
  }
  appDir.append(DIR_UPDATES);
  appDir.append("0");
  if (!appDir.exists() && !key)
    appDir.create(nsILocalFile.DIRECTORY_TYPE, PERMS_DIRECTORY);
  return appDir;
}

/**
 * Reads the update state from the update.status file in the specified
 * directory.
 * @param   dir
 *          The dir to look for an update.status file in
 * @returns The status value of the update.
 */
function readStatusFile(dir) {
  var statusFile = dir.clone();
  statusFile.append(FILE_UPDATE_STATUS);
  LOG("General", "Reading Status File: " + statusFile.path);
  return readStringFromFile(statusFile) || STATE_NONE;
}

/**
 * Writes the current update operation/state to a file in the patch 
 * directory, indicating to the patching system that operations need
 * to be performed.
 * @param   dir
 *          The patch directory where the update.status file should be 
 *          written.
 * @param   state
 *          The state value to write.
 */
function writeStatusFile(dir, state) {
  var statusFile = dir.clone();
  statusFile.append(FILE_UPDATE_STATUS);
  writeStringToFile(statusFile, state);
}

/**
 * Removes the Updates Directory
 * @param   key
 *          The Directory Service Key under which update directory resides
 *          (optional).
 */
function cleanUpUpdatesDir(key) {
  // Bail out if we don't have appropriate permissions
  var updateDir;
  try {
    updateDir = getUpdatesDir(key);
  }
  catch (e) {
    return;
  }

  var e = updateDir.directoryEntries;
  while (e.hasMoreElements()) {
    var f = e.getNext().QueryInterface(Components.interfaces.nsIFile);
    // Preserve the last update log file for debugging purposes
    if (f.leafName == FILE_UPDATE_LOG) {
      try {
        var dir = f.parent.parent;
        var logFile = dir.clone();
        logFile.append(FILE_LAST_LOG);
        if (logFile.exists())
          logFile.remove(false);
        f.copyTo(dir, FILE_LAST_LOG);
      }
      catch (e) {
        LOG("General", "Failed to copy file: " + f.path);
      }
    }
    // Now, recursively remove this file.  The recusive removal is really
    // only needed on Mac OSX because this directory will contain a copy of
    // updater.app, which is itself a directory.
    try {
      f.remove(true);
    }
    catch (e) {
      LOG("General", "Failed to remove file: " + f.path);
    }
  }
  try {
    updateDir.remove(false);
  } catch (e) {
    LOG("General", "Failed to remove update directory: " + updateDir.path + 
        " - This is almost always bad. Exception = " + e);
    throw e;
  }
}

/**
 * Clean up updates list and the updates directory.
 * @param   key
 *          The Directory Service Key under which update directory resides
 *          (optional).
 */
function cleanupActiveUpdate(key) {
  // Move the update from the Active Update list into the Past Updates list.
  var um = 
      Components.classes["@mozilla.org/updates/update-manager;1"].
      getService(Components.interfaces.nsIUpdateManager);
  um.activeUpdate = null;
  um.saveUpdates();

  // Now trash the updates directory, since we're done with it
  cleanUpUpdatesDir(key);
}

/**
 * Gets a preference value, handling the case where there is no default.
 * @param   func
 *          The name of the preference function to call, on nsIPrefBranch
 * @param   preference
 *          The name of the preference
 * @param   defaultValue
 *          The default value to return in the event the preference has 
 *          no setting
 * @returns The value of the preference, or undefined if there was no
 *          user or default value.
 */
function getPref(func, preference, defaultValue) {
  try {
    return gPref[func](preference);
  }
  catch (e) {
  }
  return defaultValue;
}

/**
 * Gets the current value of the locale.  It's possible for this preference to
 * be localized, so we have to do a little extra work here.  Similar code
 * exists in nsHttpHandler.cpp when building the UA string.
 */
function getLocale() {
  try {
    return gPref.getComplexValue(PREF_GENERAL_USERAGENT_LOCALE,
                                 nsIPrefLocalizedString).data;
  } catch (e) {}

  return gPref.getCharPref(PREF_GENERAL_USERAGENT_LOCALE);
}

/**
 * Read the update channel from defaults only.  We do this to ensure that
 * the channel is tightly coupled with the application and does not apply
 * to other instances of the application that may use the same profile.
 */
function getUpdateChannel() {
  var channel = "default";
  var prefName;
  var prefValue;

  var defaults =
      gPref.QueryInterface(Components.interfaces.nsIPrefService).
      getDefaultBranch(null);
  try {
    channel = defaults.getCharPref(PREF_APP_UPDATE_CHANNEL);
  } catch (e) {
    // use default when pref not found
  }

  try {
    var partners = gPref.getChildList(PREF_PARTNER_BRANCH, { });
    if (partners.length) {
      channel += "-cck";
      partners.sort();

      for each (prefName in partners) {
        prefValue = gPref.getCharPref(prefName);
        channel += "-" + prefValue;
      }
    }
  }
  catch (e) {
    Components.utils.reportError(e);
  }

  return channel;
}

/**
 * An enumeration of items in a JS array.
 * @constructor
 */
function ArrayEnumerator(aItems) {
  this._index = 0;
  if (aItems) {
    for (var i = 0; i < aItems.length; ++i) {
      if (!aItems[i])
        aItems.splice(i, 1);      
    }
  }
  this._contents = aItems;
}

ArrayEnumerator.prototype = {
  _index: 0,
  _contents: [],
  
  hasMoreElements: function() {
    return this._index < this._contents.length;
  },
  
  getNext: function() {
    return this._contents[this._index++];      
  }
};

/**
 * Trims a prefix from a string.
 * @param   string
 *          The source string
 * @param   prefix
 *          The prefix to remove.
 * @returns The suffix (string - prefix)
 */
function stripPrefix(string, prefix) {
  return string.substr(prefix.length);
}

/**
 * Writes a string of text to a file.  A newline will be appended to the data
 * written to the file.  This function only works with ASCII text.
 */
function writeStringToFile(file, text) {
  var fos =
      Components.classes["@mozilla.org/network/safe-file-output-stream;1"].
      createInstance(nsIFileOutputStream);
  var modeFlags = MODE_WRONLY | MODE_CREATE | MODE_TRUNCATE;
  if (!file.exists()) 
    file.create(nsILocalFile.NORMAL_FILE_TYPE, PERMS_FILE);
  fos.init(file, modeFlags, PERMS_FILE, 0);
  text += "\n";
  fos.write(text, text.length);    
  closeSafeOutputStream(fos);
}

/**
 * Reads a string of text from a file.  A trailing newline will be removed
 * before the result is returned.  This function only works with ASCII text.
 */
function readStringFromFile(file) {
  var fis =
      Components.classes["@mozilla.org/network/file-input-stream;1"].
      createInstance(nsIFileInputStream);
  var modeFlags = MODE_RDONLY;
  if (!file.exists())
    return null;
  fis.init(file, modeFlags, PERMS_FILE, 0);
  var sis =
      Components.classes["@mozilla.org/scriptableinputstream;1"].
      createInstance(Components.interfaces.nsIScriptableInputStream);
  sis.init(fis);
  var text = sis.read(sis.available());
  sis.close();
  if (text[text.length - 1] == "\n")
    text = text.slice(0, -1);
  return text;
}

function getObserverService()
{
  return Components.classes["@mozilla.org/observer-service;1"]
                   .getService(Components.interfaces.nsIObserverService);
}

/**
 * Update Patch
 * @param   patch
 *          A <patch> element to initialize this object with
 * @throws if patch has a size of 0
 * @constructor
 */
function UpdatePatch(patch) {
  this._properties = {};
  for (var i = 0; i < patch.attributes.length; ++i) {
    var attr = patch.attributes.item(i);
    attr.QueryInterface(Components.interfaces.nsIDOMAttr);
    switch (attr.name) {
    case "selected":
      this.selected = attr.value == "true";
      break;
    case "size":
      if (0 == parseInt(attr.value)) {
        LOG("UpdatePatch", "0-sized patch!");
        throw Components.results.NS_ERROR_ILLEGAL_VALUE;
      }
    default:
      this[attr.name] = attr.value;
      break;
    };
  }
}
UpdatePatch.prototype = {
  /**
   * See nsIUpdateService.idl
   */
  serialize: function(updates) {
    var patch = updates.createElementNS(URI_UPDATE_NS, "patch");
    patch.setAttribute("type", this.type);
    patch.setAttribute("URL", this.URL);
    patch.setAttribute("hashFunction", this.hashFunction);
    patch.setAttribute("hashValue", this.hashValue);
    patch.setAttribute("size", this.size);
    patch.setAttribute("selected", this.selected);
    patch.setAttribute("state", this.state);
    
    for (var p in this._properties) {
      if (this._properties[p].present)
        patch.setAttribute(p, this._properties[p].data);
    }
    
    return patch; 
  },
  
  /**
   * A hash of custom properties
   */
  _properties: null,
  
  /**
   * See nsIWritablePropertyBag.idl
   */
  setProperty: function(name, value) {
    this._properties[name] = { data: value, present: true };
  },
  
  /**
   * See nsIWritablePropertyBag.idl
   */
  deleteProperty: function(name) {
    if (name in this._properties)
      this._properties[name].present = false;
    else
      throw Components.results.NS_ERROR_FAILURE;
  },
  
  /**
   * See nsIPropertyBag.idl
   */
  get enumerator() {
    var properties = [];
    for (var p in this._properties)
      properties.push(this._properties[p].data);
    return new ArrayEnumerator(properties);
  },
  
  /**
   * See nsIPropertyBag.idl
   */
  getProperty: function(name) {
    if (name in this._properties &&
        this._properties[name].present)
      return this._properties[name].data;
    throw Components.results.NS_ERROR_FAILURE;
  },
  
  /**
   * Returns whether or not the update.status file for this patch exists at the 
   * appropriate location. 
   */
  get statusFileExists() {
    var statusFile = getUpdatesDir();
    statusFile.append(FILE_UPDATE_STATUS);
    return statusFile.exists();
  },
  
  /**
   * See nsIUpdateService.idl
   */
  get state() {
    if (!this.statusFileExists)
      return STATE_NONE;
    return this._properties.state;
  },
  set state(val) {
    this._properties.state = val;
  },
  
  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIUpdatePatch) &&
        !iid.equals(Components.interfaces.nsIPropertyBag) && 
        !iid.equals(Components.interfaces.nsIWritablePropertyBag) && 
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};

/**
 * Update
 * Implements nsIUpdate
 * @param   update
 *          An <update> element to initialize this object with
 * @throws if the update contains no patches
 * @constructor
 */
function Update(update) {
  this._properties = {};
  this._patches = [];
  this.installDate = 0;
  this.isCompleteUpdate = false;
  this.channel = "default";

  // Null <update>, assume this is a message container and do no 
  // further initialization
  if (!update)
    return;
    
  for (var i = 0; i < update.childNodes.length; ++i) {
    var patchElement = update.childNodes.item(i);
    if (patchElement.nodeType != Node.ELEMENT_NODE ||
        patchElement.localName != "patch")
      continue;

    patchElement.QueryInterface(Components.interfaces.nsIDOMElement);
    try {
      var patch = new UpdatePatch(patchElement);
    } catch (e) {
      continue;
    }
    this._patches.push(patch);
  }
  
  if (0 == this._patches.length)
    throw Components.results.NS_ERROR_ILLEGAL_VALUE;

  for (var i = 0; i < update.attributes.length; ++i) {
    var attr = update.attributes.item(i);
    attr.QueryInterface(Components.interfaces.nsIDOMAttr);
    if (attr.name == "installDate" && attr.value) 
      this.installDate = parseInt(attr.value);
    else if (attr.name == "isCompleteUpdate")
      this.isCompleteUpdate = attr.value == "true";
    else if (attr.name == "isSecurityUpdate")
      this.isSecurityUpdate = attr.value == "true";
    else if (attr.name == "detailsURL")
      this._detailsURL = attr.value;
    else if (attr.name == "channel")
      this.channel = attr.value;
    else
      this[attr.name] = attr.value;
  }
  
  // The Update Name is either the string provided by the <update> element, or
  // the string: "<App Name> <Update App Version>"
  var name = "";
  if (update.hasAttribute("name"))
    name = update.getAttribute("name");
  else {
    var sbs = Components.classes["@mozilla.org/intl/stringbundle;1"]
                        .getService(Components.interfaces.nsIStringBundleService);
    var brandBundle = sbs.createBundle(URI_BRAND_PROPERTIES);
    var updateBundle = sbs.createBundle(URI_UPDATES_PROPERTIES);
    var appName = brandBundle.GetStringFromName("brandShortName");
    name = updateBundle.formatStringFromName("updateName", 
                                             [appName, this.version], 2);
  }
  this.name = name;
}
Update.prototype = {
  /**
   * See nsIUpdateService.idl
   */
  get patchCount() {
    return this._patches.length;
  },
  
  /**
   * See nsIUpdateService.idl
   */
  getPatchAt: function(index) {
    return this._patches[index];
  },

  /**
   * See nsIUpdateService.idl
   * 
   * We use a copy of the state cached on this object in |_state| only when 
   * there is no selected patch, i.e. in the case when we could not load 
   * |.activeUpdate| from the update manager for some reason but still have
   * the update.status file to work with. 
   */
  _state: "",
  set state(state) {
    if (this.selectedPatch)
      this.selectedPatch.state = state;
    this._state = state;
    return state;
  },
  get state() {
    if (this.selectedPatch)
      return this.selectedPatch.state;
    return this._state;
  },

  /**
   * See nsIUpdateService.idl
   */
  errorCode: 0,
    
  /**
   * See nsIUpdateService.idl
   */
  get selectedPatch() {
    for (var i = 0; i < this.patchCount; ++i) {
      if (this._patches[i].selected)
        return this._patches[i];
    }
    return null;
  },
  
  /**
   * See nsIUpdateService.idl
   */
  get detailsURL() {
    if (!this._detailsURL) {
      try {
        // Try using a default details URL supplied by the distribution
        // if the update XML does not supply one.
        var formatter = Components.classes["@mozilla.org/toolkit/URLFormatterService;1"]
                                  .getService(Components.interfaces.nsIURLFormatter);
        return formatter.formatURLPref(PREF_APP_UPDATE_URL_DETAILS);
      }
      catch (e) {
      }
    }
    return this._detailsURL || "";
  },
  
  /**
   * See nsIUpdateService.idl
   */
  serialize: function(updates) {
    var update = updates.createElementNS(URI_UPDATE_NS, "update");
    update.setAttribute("type", this.type);
    update.setAttribute("name", this.name);
    update.setAttribute("version", this.version);
    update.setAttribute("extensionVersion", this.extensionVersion);
    update.setAttribute("detailsURL", this.detailsURL);
    update.setAttribute("licenseURL", this.licenseURL);
    update.setAttribute("serviceURL", this.serviceURL);
    update.setAttribute("installDate", this.installDate);
    update.setAttribute("statusText", this.statusText);
    update.setAttribute("buildID", this.buildID);
    update.setAttribute("isCompleteUpdate", this.isCompleteUpdate);
    update.setAttribute("channel", this.channel);
    updates.documentElement.appendChild(update);
    
    for (var p in this._properties) {
      if (this._properties[p].present)
        update.setAttribute(p, this._properties[p].data);
    }
    
    for (var i = 0; i < this.patchCount; ++i)
      update.appendChild(this.getPatchAt(i).serialize(updates));
    
    return update;
  },
   
  /**
   * A hash of custom properties
   */
  _properties: null,
  
  /**
   * See nsIWritablePropertyBag.idl
   */
  setProperty: function(name, value) {
    this._properties[name] = { data: value, present: true };
  },
  
  /**
   * See nsIWritablePropertyBag.idl
   */
  deleteProperty: function(name) {
    if (name in this._properties)
      this._properties[name].present = false;
    else
      throw Components.results.NS_ERROR_FAILURE;
  },
  
  /**
   * See nsIPropertyBag.idl
   */
  get enumerator() {
    var properties = [];
    for (var p in this._properties)
      properties.push(this._properties[p].data);
    return new ArrayEnumerator(properties);
  },
  
  /**
   * See nsIPropertyBag.idl
   */
  getProperty: function(name) {
    if (name in this._properties &&
        this._properties[name].present)
      return this._properties[name].data;
    throw Components.results.NS_ERROR_FAILURE;
  },
  
  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIUpdate_MOZILLA_1_8_BRANCH) &&
        !iid.equals(Components.interfaces.nsIUpdate) &&
        !iid.equals(Components.interfaces.nsIPropertyBag) &&
        !iid.equals(Components.interfaces.nsIWritablePropertyBag) &&
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
}; 
 
/**
 * UpdateService
 * A Service for managing the discovery and installation of software updates.
 * @constructor
 */
function UpdateService() {
  gApp  = Components.classes["@mozilla.org/xre/app-info;1"]
                    .getService(Components.interfaces.nsIXULAppInfo)
                    .QueryInterface(Components.interfaces.nsIXULRuntime);
  gPref = Components.classes["@mozilla.org/preferences-service;1"]
                    .getService(Components.interfaces.nsIPrefBranch2);
  gConsole = Components.classes["@mozilla.org/consoleservice;1"]
                       .getService(Components.interfaces.nsIConsoleService);  

  // Not all builds have a known ABI
  try {
    gABI = gApp.XPCOMABI;
  }
  catch (e) {
    LOG("UpdateService", "XPCOM ABI unknown: updates are not possible.");
  }

  try {
    var sysInfo = 
      Components.classes["@mozilla.org/system-info;1"]
                .getService(Components.interfaces.nsIPropertyBag2);

    gOSVersion = encodeURIComponent(sysInfo.getProperty("name") + " " +  
                                    sysInfo.getProperty("version"));
  }
  catch (e) {
    LOG("UpdateService", "OS Version unknown: updates are not possible.");
  }

//@line 1023 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"

  // Start the update timer only after a profile has been selected so that the
  // appropriate values for the update check are read from the user's profile.  
  var os = getObserverService();

  os.addObserver(this, "profile-after-change", false);

  // Observe xpcom-shutdown to unhook pref branch observers above to avoid 
  // shutdown leaks.
  os.addObserver(this, "xpcom-shutdown", false);
}

UpdateService.prototype = {
  /**
   * The downloader we are using to download updates. There is only ever one of
   * these.
   */
  _downloader: null,

  /**
   * Handle Observer Service notifications
   * @param   subject
   *          The subject of the notification
   * @param   topic
   *          The notification name
   * @param   data
   *          Additional data
   */
  observe: function(subject, topic, data) {
    var os = getObserverService();

    switch (topic) {
    case "profile-after-change":
      os.removeObserver(this, "profile-after-change");
      this._start();
      break;
    case "xpcom-shutdown":
      os.removeObserver(this, "xpcom-shutdown");
      
      // Release Services
      gApp      = null;
      gPref     = null;
      gConsole  = null;
      break;
    }
  },
  
  /**
   * Start the Update Service
   */
  _start: function() {
    // Start logging
    this._initLoggingPrefs();
    
    // Clean up any extant updates
    this._postUpdateProcessing();

    // Register a background update check timer
    var tm = 
        Components.classes["@mozilla.org/updates/timer-manager;1"]
                  .getService(Components.interfaces.nsIUpdateTimerManager);
    var interval = getPref("getIntPref", PREF_APP_UPDATE_INTERVAL, 86400);
    tm.registerTimer("background-update-timer", this, interval);

    // Resume fetching...
    var um = Components.classes["@mozilla.org/updates/update-manager;1"]
                        .getService(Components.interfaces.nsIUpdateManager);
    var activeUpdate = um.activeUpdate;
    if (activeUpdate) {
      var status = this.downloadUpdate(activeUpdate, true);
      if (status == STATE_NONE)
        cleanupActiveUpdate();
    }
  },
  
  /**
   * Perform post-processing on updates lingering in the updates directory
   * from a previous browser session - either report install failures (and
   * optionally attempt to fetch a different version if appropriate) or 
   * notify the user of install success.
   */
  _postUpdateProcessing: function() {
    // Detect installation failures and notify
    
    // Bail out if we don't have appropriate permissions
    if (!this.canUpdate)
      return;
      
    var status = readStatusFile(getUpdatesDir()); 

    // Make sure to cleanup after an update that failed for an unknown reason
    if (status == "null")
      status = null;

    var updRootKey = null;
//@line 1119 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
    function findPreviousUpdate(key) {
      var updateDir = getUpdatesDir(key);
      if (updateDir.exists()) {
        status = readStatusFile(updateDir);
        // Previous download should succeed. Otherwise, we will not be here!
        if (status == STATE_SUCCEEDED)
          updRootKey = key;
        else
          status = null;
      }
    }

    // required when updating from Fx 2.0.0.1 to 2.0.0.3 (or later)
    // on Windows Vista.
    if (status == null)
      findPreviousUpdate(KEY_UAPPDATA);

    // required to migrate from older versions.
    if (status == null)
      findPreviousUpdate(KEY_APPDIR);
//@line 1140 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"

    if (status == STATE_DOWNLOADING) {
      LOG("UpdateService", "_postUpdateProcessing: Downloading patch, resuming...");
    }
    else if (status != null) {
      // null status means the update.status file is not present, because either:
      // 1) no update was performed, and so there's no UI to show
      // 2) an update was attempted but failed during checking, transfer or 
      //    verification, and was cleaned up at that point, and UI notifying of
      //    that error was shown at that stage. 
      var um = 
          Components.classes["@mozilla.org/updates/update-manager;1"].
          getService(Components.interfaces.nsIUpdateManager);
      var prompter = 
          Components.classes["@mozilla.org/updates/update-prompt;1"].
          createInstance(Components.interfaces.nsIUpdatePrompt);

      var shouldCleanup = true;
      var update = um.activeUpdate;
      if (!update) {
        update = new Update(null);
      }
      update.state = status;
      var sbs = 
          Components.classes["@mozilla.org/intl/stringbundle;1"].
          getService(Components.interfaces.nsIStringBundleService);
      var bundle = sbs.createBundle(URI_UPDATES_PROPERTIES);
      if (status == STATE_SUCCEEDED) {
        update.statusText = bundle.GetStringFromName("installSuccess");
        
        // Dig through the update history to find the patch that was just
        // installed and update its metadata.
        for (var i = 0; i < um.updateCount; ++i) {
          var umUpdate = um.getUpdateAt(i);
          if (umUpdate && umUpdate.version == update.version &&
                          umUpdate.buildID == update.buildID) {
            umUpdate.statusText = update.statusText;
            break;
          }
        }

        LOG("UpdateService", "_postUpdateProcessing: Install Succeeded, Showing UI");
        prompter.showUpdateInstalled(update);
//@line 1187 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
        // Perform platform-specific post-update processing.
        if (POST_UPDATE_CONTRACTID in Components.classes) {
          Components.classes[POST_UPDATE_CONTRACTID].
              createInstance(Components.interfaces.nsIRunnable).run();
        }
//@line 1193 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"

        // Done with this update. Clean it up.
        cleanupActiveUpdate(updRootKey);
      }
      else {
        // If we hit an error, then the error code will be included in the
        // status string following a colon.  If we had an I/O error, then we
        // assume that the patch is not invalid, and we restage the patch so
        // that it can be attempted again the next time we restart.
        var ary = status.split(": ");
        update.state = ary[0];
        if (update.state == STATE_FAILED && ary[1]) {
          update.errorCode = ary[1];
          if (update.errorCode == WRITE_ERROR) {
            prompter.showUpdateError(update);
            writeStatusFile(getUpdatesDir(), update.state = STATE_PENDING);
            return;
          }
        }

        // Something went wrong with the patch application process.
        cleanupActiveUpdate();

        update.statusText = bundle.GetStringFromName("patchApplyFailure");
        var oldType = update.selectedPatch ? update.selectedPatch.type 
                                           : "complete";
        if (update.selectedPatch && oldType == "partial") {
          // Partial patch application failed, try downloading the complete
          // update in the background instead.
          LOG("UpdateService", "_postUpdateProcessing: Install of Partial Patch " + 
              "failed, downloading Complete Patch and maybe showing UI");
          var status = this.downloadUpdate(update, true);
          if (status == STATE_NONE)
            cleanupActiveUpdate();
        }
        else {
          LOG("UpdateService", "_postUpdateProcessing: Install of Complete or " + 
              "only patch failed. Showing error.");
        }
        update.QueryInterface(Components.interfaces.nsIWritablePropertyBag);
        update.setProperty("patchingFailed", oldType);
        prompter.showUpdateError(update);
      }
    }
    else {
      LOG("UpdateService", "_postUpdateProcessing: No Status, No Update");
    }
  },

  /**
   * Initialize Logging preferences, formatted like so:
   *  app.update.log.<moduleName> = <true|false>
   */
  _initLoggingPrefs: function() {
    try {
      var ps = Components.classes["@mozilla.org/preferences-service;1"]
                        .getService(Components.interfaces.nsIPrefService);
      var logBranch = ps.getBranch(PREF_APP_UPDATE_LOG_BRANCH);
      var modules = logBranch.getChildList("", { value: 0 });

      for (var i = 0; i < modules.length; ++i) {
        if (logBranch.prefHasUserValue(modules[i]))
          gLogEnabled[modules[i]] = logBranch.getBoolPref(modules[i]);
      }
    }
    catch (e) {
    }
  },
  
  /**
   *
   */
  _needsToPromptForUpdate: function(updates) {
    // First, check for Extension incompatibilities. These trump any preference
    // settings.
    var em = Components.classes["@mozilla.org/extensions/manager;1"]
                       .getService(Components.interfaces.nsIExtensionManager);
    var incompatibleList = { };
    for (var i = 0; i < updates.length; ++i) {
      var count = {};
      em.getIncompatibleItemList(gApp.ID, updates[i].extensionVersion,
                                 nsIUpdateItem.TYPE_ADDON, false, count);
      if (count.value > 0)
        return true;
    }

    // Now, inspect user preferences.
    
    // No prompt necessary, silently update...
    return false;
  },
  
  /**
   * Notified when a timer fires
   * @param   timer
   *          The timer that fired
   */
  notify: function(timer) {
    // If a download is in progress, then do nothing.
    if (this.isDownloading || this._downloader && this._downloader.patchIsStaged)
      return;

    var self = this;
    var listener = {
      /**
       * See nsIUpdateService.idl
       */
      onProgress: function(request, position, totalSize) { 
      },
      
      /**
       * See nsIUpdateService.idl
       */
      onCheckComplete: function(request, updates, updateCount) {
        self._selectAndInstallUpdate(updates);
      },

      /**
       * See nsIUpdateService.idl
       */
      onError: function(request, update) { 
        LOG("Checker", "Error during background update: " + update.statusText);
      },
    }
    this.backgroundChecker.checkForUpdates(listener, false);
  },
  
  /**
   * Determine whether or not an update requires user confirmation before it
   * can be installed.
   * @param   update
   *          The update to be installed
   * @returns true if a prompt UI should be shown asking the user if they want
   *          to install the update, false if the update should just be 
   *          silently downloaded and installed.
   */
  _shouldPrompt: function(update) {
    // There are two possible outcomes here:
    // 1. download and install the update automatically
    // 2. alert the user about the presence of an update before doing anything
    //
    // The outcome we follow is determined as follows:
    // 
    // Note:  all Major updates require notification and confirmation
    // 
    // Update Type      Mode      Incompatible    Outcome
    // Major            0         Yes or No       Notify and Confirm
    // Major            1         No              Notify and Confirm
    // Major            1         Yes             Notify and Confirm
    // Major            2         Yes or No       Notify and Confirm
    // Minor            0         Yes or No       Auto Install
    // Minor            1         No              Auto Install
    // Minor            1         Yes             Notify and Confirm
    // Minor            2         No              Auto Install
    // Minor            2         Yes             Notify and Confirm
    //
    // In addition, if there is a license associated with an update, regardless
    // of type it must be agreed to. 
    //
    // If app.update.enabled is set to false, an update check is not performed
    // at all, and so none of the decision making above is entered into.
    //
    if (update.type == "major") {
      LOG("Checker", "_shouldPrompt: Prompting because it is a major update");
      return true;
    }

    update.QueryInterface(Components.interfaces.nsIPropertyBag);
    try {
      var licenseAccepted = update.getProperty("licenseAccepted") == "true";
    }
    catch (e) {
      licenseAccepted = false;
    }

    var updateEnabled = getPref("getBoolPref", PREF_APP_UPDATE_ENABLED, true);
    if (!updateEnabled) {
      LOG("Checker", "_shouldPrompt: Not prompting because update is " + 
          "disabled");
      return false;
    }
    
    // User has turned off automatic download and install
    var autoEnabled = getPref("getBoolPref", PREF_APP_UPDATE_AUTO, true);
    if (!autoEnabled) {
      LOG("Checker", "_shouldPrompt: Prompting because auto install is disabled");
      return true;
    }
    
    switch (getPref("getIntPref", PREF_APP_UPDATE_MODE, 1)) {
    case 1:
      // Mode 1 is do not prompt only if there are no incompatibilities
      // releases
      LOG("Checker", "_shouldPrompt: Prompting if there are incompatibilities");
      return !isCompatible(update);
    case 2:
      // Mode 2 is do not prompt only if there are no incompatibilities
      LOG("Checker", "_shouldPrompt: Prompting if there are incompatibilities");
      return !isCompatible(update);
    }
    // Mode 0 is do not prompt regardless of incompatibilities
    LOG("Checker", "_shouldPrompt: Not prompting the user - they choose to " +
        "ignore incompatibilities");
    return false;
  },
  
  /**
   * Determine which of the specified updates should be installed.
   * @param   updates
   *          An array of available updates
   */
  selectUpdate: function(updates) {
    if (updates.length == 0)
      return null;
    
    // Choose the newest of the available minor and major updates. 
    var majorUpdate = null, minorUpdate = null;
    var newestMinor = updates[0], newestMajor = updates[0];

    var vc = Components.classes["@mozilla.org/xpcom/version-comparator;1"]
                       .getService(Components.interfaces.nsIVersionComparator);
    for (var i = 0; i < updates.length; ++i) {
      if (updates[i].type == "major" && 
          vc.compare(newestMajor.version, updates[i].version) <= 0)
        majorUpdate = newestMajor = updates[i];
      if (updates[i].type == "minor" && 
          vc.compare(newestMinor.version, updates[i].version) <= 0)
        minorUpdate = newestMinor = updates[i];
    }

    // IMPORTANT
    // If there's a minor update, always try and fetch that one first, 
    // otherwise use the newest major update.
    // selectUpdate() only returns one update.
    // if major were to trump minor, and we said "never" to the major
    // we'd never get the minor update, since selectUpdate()
    // would return the major update that the user said "never" to
    // (shadowing the important minor update with security fixes)
    return minorUpdate || majorUpdate;
  },
  
  /**
   * Determine which of the specified updates should be installed and
   * begin the download/installation process, optionally prompting the
   * user for permission if required.
   * @param   updates
   *          An array of available updates
   */
  _selectAndInstallUpdate: function(updates) {
    // Don't prompt if there's an active update - the user is already 
    // aware and is downloading, or performed some user action to prevent
    // notification.
    var um = Components.classes["@mozilla.org/updates/update-manager;1"]
                       .getService(Components.interfaces.nsIUpdateManager);
    if (um.activeUpdate)
      return;
    
    var update = this.selectUpdate(updates, updates.length);
    if (!update)
      return;

    // check if the user said "never" to this version
    // this check is done here, and not in selectUpdate() so that
    // the user can get an upgrade they said "never" to if they
    // manually do "Check for Updates..."
    // note, selectUpdate() only returns one update.
    // but in selectUpdate(), minor updates trump major updates
    // if major trumps minor, and we said "never" to the major
    // we'd never see the minor update.
    // 
    // note, the never decision should only apply to major updates
    // see bug #350636 for a scenario where this could potentially
    // be an issue
    var neverPrefName = PREF_UPDATE_NEVER_BRANCH + update.version;
    var never = getPref("getBoolPref", neverPrefName, false);
    if (never && update.type == "major")
      return;

    if (this._shouldPrompt(update))
      showPromptIfNoIncompatibilities(update);
    else {
      LOG("UpdateService", "_selectAndInstallUpdate: No need to show prompt, just download update");
      var status = this.downloadUpdate(update, true);
      if (status == STATE_NONE)
        cleanupActiveUpdate();
    }
  },

  /**
   * The Checker used for background update checks.
   */
  _backgroundChecker: null,
  
  /**
   * See nsIUpdateService.idl
   */
  get backgroundChecker() {
    if (!this._backgroundChecker) 
      this._backgroundChecker = new Checker();
    return this._backgroundChecker;
  },
  
  /**
   * See nsIUpdateService.idl
   */
  get canUpdate() {
    try {
      var appDirFile = getUpdateFile([FILE_PERMS_TEST]);
      if (!appDirFile.exists()) {
        appDirFile.create(nsILocalFile.NORMAL_FILE_TYPE, PERMS_FILE);
        appDirFile.remove(false);
      }
      var updateDir = getUpdatesDir();
      var upDirFile = updateDir.clone();
      upDirFile.append(FILE_PERMS_TEST);
      if (!upDirFile.exists()) {
        upDirFile.create(nsILocalFile.NORMAL_FILE_TYPE, PERMS_FILE);
        upDirFile.remove(false);
      }
    }
    catch (e) {
      // No write privileges to install directory
      return false;
    }
    // If the administrator has locked the app update functionality 
    // OFF - this is not just a user setting, so disable the manual
    // UI too.
    var enabled = getPref("getBoolPref", PREF_APP_UPDATE_ENABLED, true);
    if (!enabled && gPref.prefIsLocked(PREF_APP_UPDATE_ENABLED))
      return false;

    // If we don't know the binary platform we're updating, we can't update.
    if (!gABI)
      return false;

    // If we don't know the OS version we're updating, we can't update.
    if (!gOSVersion)
      return false;

    return true;
  },
  
  /**
   * See nsIUpdateService.idl
   */
  addDownloadListener: function(listener) {
    if (!this._downloader) {
      LOG("UpdateService", "addDownloadListener: no downloader!\n");
      return;
    }
    this._downloader.addDownloadListener(listener);
  },
  
  /**
   * See nsIUpdateService.idl
   */
  removeDownloadListener: function(listener) {
    if (!this._downloader) {
      LOG("UpdateService", "removeDownloadListener: no downloader!\n");
      return;
    }
    this._downloader.removeDownloadListener(listener);
  },
  
  /**
   * See nsIUpdateService.idl
   */
  downloadUpdate: function(update, background) {
    if (!update)
      throw Components.results.NS_ERROR_NULL_POINTER;
    if (this.isDownloading) {
      if (update.isCompleteUpdate == this._downloader.isCompleteUpdate &&
          background == this._downloader.background) {
        LOG("UpdateService", "no support for downloading more than one update at a time");
        return readStatusFile(getUpdatesDir());
      }
      this._downloader.cancel();
    }
    this._downloader = new Downloader(background);
    return this._downloader.downloadUpdate(update);
  },
  
  /**
   * See nsIUpdateService.idl
   */
  pauseDownload: function() {
    if (this.isDownloading)
      this._downloader.cancel();
  },
  
  /**
   * See nsIUpdateService.idl
   */
  get isDownloading() {
    return this._downloader && this._downloader.isBusy;
  },
  
  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIApplicationUpdateService) &&
        !iid.equals(Components.interfaces.nsITimerCallback) && 
        !iid.equals(Components.interfaces.nsIObserver) && 
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};

/**
 * A service to manage active and past updates.
 * @constructor
 */
function UpdateManager() {
  // Ensure the Active Update file is loaded
  var updates = this._loadXMLFileIntoArray(getUpdateFile([FILE_UPDATE_ACTIVE]));
  if (updates.length > 0)
    this._activeUpdate = updates[0];
}
UpdateManager.prototype = {
  /**
   * All previously downloaded and installed updates, as an array of nsIUpdate
   * objects.
   */
  _updates: null,
  
  /**
   * The current actively downloading/installing update, as a nsIUpdate object.
   */
  _activeUpdate: null,
  
  /**
   * Loads an updates.xml formatted file into an array of nsIUpdate items.
   * @param   file
   *          A nsIFile for the updates.xml file
   * @returns The array of nsIUpdate items held in the file.
   */
  _loadXMLFileIntoArray: function(file) {
    if (!file.exists()) {
      LOG("UpdateManager", "_loadXMLFileIntoArray: XML File does not exist");
      return [];
    }

    var result = [];
    var fileStream = Components.classes["@mozilla.org/network/file-input-stream;1"]
                               .createInstance(Components.interfaces.nsIFileInputStream);
    fileStream.init(file, MODE_RDONLY, PERMS_FILE, 0);
    try {
      var parser = Components.classes["@mozilla.org/xmlextras/domparser;1"]
                            .createInstance(Components.interfaces.nsIDOMParser);
      var doc = parser.parseFromStream(fileStream, "UTF-8", fileStream.available(), "text/xml");
      
      var updateCount = doc.documentElement.childNodes.length;
      for (var i = 0; i < updateCount; ++i) {
        var updateElement = doc.documentElement.childNodes.item(i);
        if (updateElement.nodeType != Node.ELEMENT_NODE ||
            updateElement.localName != "update")
          continue;

        updateElement.QueryInterface(Components.interfaces.nsIDOMElement);
        try {
          var update = new Update(updateElement);
        } catch (e) {
          LOG("UpdateManager", "_loadXMLFileIntoArray: invalid update");
          continue;
        }
        result.push(new Update(updateElement));
      }
    }
    catch (e) {
      LOG("UpdateManager", "_loadXMLFileIntoArray: Error constructing update list " + 
          e);
    }
    fileStream.close();
    return result;
  },
  
  /**
   * Load the update manager, initializing state from state files.
   */
  _ensureUpdates: function() {
    if (!this._updates) {
      this._updates = this._loadXMLFileIntoArray(getUpdateFile(
                        [FILE_UPDATES_DB]));

      // Make sure that any active update is part of our updates list
      var active = this.activeUpdate;
      if (active)
        this._addUpdate(active);
    }
  },

  /**
   * See nsIUpdateService.idl
   */
  getUpdateAt: function(index) {
    this._ensureUpdates();
    return this._updates[index];
  },
  
  /**
   * See nsIUpdateService.idl
   */
  get updateCount() {
    this._ensureUpdates();
    return this._updates.length;
  },
  
  /**
   * See nsIUpdateService.idl
   */
  get activeUpdate() {
    if (this._activeUpdate) {
      this._activeUpdate.QueryInterface(Components.interfaces.nsIUpdate_MOZILLA_1_8_BRANCH);
      if (this._activeUpdate.channel != getUpdateChannel()) {
        // User switched channels, clear out any old active updates and remove
        // partial downloads
        this._activeUpdate = null;
      
        // Destroy the updates directory, since we're done with it.
        cleanUpUpdatesDir();
      }
    }
    return this._activeUpdate;
  },
  set activeUpdate(activeUpdate) {
    this._addUpdate(activeUpdate);
    this._activeUpdate = activeUpdate;
    if (!activeUpdate) {
      // If |activeUpdate| is null, we have updated both lists - the active list
      // and the history list, so we want to write both files.
      this.saveUpdates();
    }
    else
      this._writeUpdatesToXMLFile([this._activeUpdate], 
                                  getUpdateFile([FILE_UPDATE_ACTIVE]));
    return activeUpdate;
  },
  
  /**
   * Add an update to the Updates list. If the item already exists in the list,
   * replace the existing value with the new value.
   * @param   update
   *          The nsIUpdate object to add.
   */
  _addUpdate: function(update) {
    if (!update)
      return;
    this._ensureUpdates();
    if (this._updates) {
      for (var i = 0; i < this._updates.length; ++i) {
        if (this._updates[i] &&
            this._updates[i].version == update.version &&
            this._updates[i].buildID == update.buildID) {
          // Replace the existing entry with the new value, updating
          // all metadata.
          this._updates[i] = update;
          return;
        }
      }
    }
    // Otherwise add it to the front of the list.
    if (update) 
      this._updates = [update].concat(this._updates);
  },
  
  /**
   * Serializes an array of updates to an XML file
   * @param   updates
   *          An array of nsIUpdate objects
   * @param   file
   *          The nsIFile object to serialize to
   */
  _writeUpdatesToXMLFile: function(updates, file) {
    var fos = Components.classes["@mozilla.org/network/safe-file-output-stream;1"]
                        .createInstance(Components.interfaces.nsIFileOutputStream);
    var modeFlags = MODE_WRONLY | MODE_CREATE | MODE_TRUNCATE;
    if (!file.exists()) 
      file.create(nsILocalFile.NORMAL_FILE_TYPE, PERMS_FILE);
    fos.init(file, modeFlags, PERMS_FILE, 0);
    
    try {
      var parser = Components.classes["@mozilla.org/xmlextras/domparser;1"]
                            .createInstance(Components.interfaces.nsIDOMParser);
      const EMPTY_UPDATES_DOCUMENT = "<?xml version=\"1.0\"?><updates xmlns=\"http://www.mozilla.org/2005/app-update\"></updates>";
      var doc = parser.parseFromString(EMPTY_UPDATES_DOCUMENT, "text/xml");

      for (var i = 0; i < updates.length; ++i) {
        if (updates[i])
          doc.documentElement.appendChild(updates[i].serialize(doc));
      }

      var serializer = Components.classes["@mozilla.org/xmlextras/xmlserializer;1"]
                                .createInstance(Components.interfaces.nsIDOMSerializer);
      serializer.serializeToStream(doc.documentElement, fos, null);
    }
    catch (e) {
    }
    
    closeSafeOutputStream(fos);
  },

  /**
   * See nsIUpdateService.idl
   */
  saveUpdates: function() {
    this._writeUpdatesToXMLFile([this._activeUpdate], 
                                getUpdateFile([FILE_UPDATE_ACTIVE]));
    if (this._updates) {
      this._writeUpdatesToXMLFile(this._updates, 
                                  getUpdateFile([FILE_UPDATES_DB]));
    }
  },
  
  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIUpdateManager) &&
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};


/**
 * Checker
 * Checks for new Updates
 * @constructor
 */
function Checker() {
}
Checker.prototype = {
  /**
   * The XMLHttpRequest object that performs the connection.
   */
  _request  : null,
  
  /**
   * The nsIUpdateCheckListener callback
   */
  _callback : null,
 
  /**
   * The URL of the update service XML file to connect to that contains details
   * about available updates.
   */
  getUpdateURL: function(force) {
    this._forced = force;

    var defaults =
        gPref.QueryInterface(Components.interfaces.nsIPrefService).
        getDefaultBranch(null);

    // Use the override URL if specified.
    var url = getPref("getCharPref", PREF_APP_UPDATE_URL_OVERRIDE, null);

    // Otherwise, construct the update URL from component parts.
    if (!url) {
      try {
        url = defaults.getCharPref(PREF_APP_UPDATE_URL);
      } catch (e) {
      }
    }

    if (!url || url == "") {
      LOG("Checker", "Update URL not defined");
      return null;
    }

    url = url.replace(/%PRODUCT%/g, gApp.name);
    url = url.replace(/%VERSION%/g, gApp.version);
    url = url.replace(/%BUILD_ID%/g, gApp.appBuildID);
    url = url.replace(/%BUILD_TARGET%/g, gApp.OS + "_" + gABI);
    url = url.replace(/%OS_VERSION%/g, gOSVersion);
    url = url.replace(/%LOCALE%/g, getLocale());
    url = url.replace(/%CHANNEL%/g, getUpdateChannel());
    url = url.replace(/\+/g, "%2B");

    if (force)
	url += "?force=1"

    LOG("Checker", "update url: " + url);
    return url;
  },
  
  /**
   * See nsIUpdateService.idl
   */
  checkForUpdates: function(listener, force) {
    if (!listener)
      throw Components.results.NS_ERROR_NULL_POINTER;
    
    if (!this.getUpdateURL(force) || (!this.enabled && !force))
      return;
      
    this._request = 
      Components.classes["@mozilla.org/xmlextras/xmlhttprequest;1"].
      createInstance(Components.interfaces.nsIXMLHttpRequest);
    this._request.open("GET", this.getUpdateURL(force), true);
    this._request.channel.notificationCallbacks = new BadCertHandler();
    this._request.overrideMimeType("text/xml");
    this._request.setRequestHeader("Cache-Control", "no-cache");
    
    var self = this;
    this._request.onerror     = function(event) { self.onError(event);    };
    this._request.onload      = function(event) { self.onLoad(event);     };
    this._request.onprogress  = function(event) { self.onProgress(event); };

    LOG("Checker", "checkForUpdates: sending request to " + this.getUpdateURL(force));
    this._request.send(null);
    
    this._callback = listener;
  },
  
  /**
   * When progress associated with the XMLHttpRequest is received.
   * @param   event
   *          The nsIDOMLSProgressEvent for the load.
   */
  onProgress: function(event) {
    LOG("Checker", "onProgress: " + event.position + "/" + event.totalSize);
    this._callback.onProgress(event.target, event.position, event.totalSize);
  },
  
  /**
   * Returns an array of nsIUpdate objects discovered by the update check.
   */
  get _updates() {
    var updatesElement = this._request.responseXML.documentElement;
    if (!updatesElement) {
      LOG("Checker", "get_updates: empty updates document?!");
      return [];
    }

    if (updatesElement.nodeName != "updates") {
      LOG("Checker", "get_updates: unexpected node name!");
      throw "";
    }
    
    var updates = [];
    for (var i = 0; i < updatesElement.childNodes.length; ++i) {
      var updateElement = updatesElement.childNodes.item(i);
      if (updateElement.nodeType != Node.ELEMENT_NODE ||
          updateElement.localName != "update")
        continue;

      updateElement.QueryInterface(Components.interfaces.nsIDOMElement);
      try {
        var update = new Update(updateElement);
      } catch (e) {
        LOG("Checker", "Invalid <update/>, ignoring...");
        continue;
      }
      update.serviceURL = this.getUpdateURL(this._forced);
      update.channel = getUpdateChannel();
      updates.push(update);
    }

    return updates;
  },
  
  /**
   * The XMLHttpRequest succeeded and the document was loaded.
   * @param   event
   *          The nsIDOMLSEvent for the load
   */
  onLoad: function(event) {
    LOG("Checker", "onLoad: request completed downloading document");
    
    try {
      checkCert(this._request.channel);

      // Analyze the resulting DOM and determine the set of updates to install
      var updates = this._updates;
      
      LOG("Checker", "Updates available: " + updates.length);
      
      // ... and tell the Update Service about what we discovered.
      this._callback.onCheckComplete(event.target, updates, updates.length);
    }
    catch (e) {
      LOG("Checker", "There was a problem with the update service URL specified, " + 
          "either the XML file was malformed or it does not exist at the location " + 
          "specified. Exception: " + e);
      var update = new Update(null);
      update.statusText = getStatusTextFromCode(404, 404);
      this._callback.onError(event.target, update);
    }

    this._request = null;
  },
  
  /**
   * There was an error of some kind during the XMLHttpRequest
   * @param   event
   *          The nsIDOMLSEvent for the load
   */
  onError: function(event) {
    LOG("Checker", "onError: error during load");
    
    var request = event.target;
    try {
      var status = request.status;
    }
    catch (e) {
      var req = request.channel.QueryInterface(Components.interfaces.nsIRequest);
      status = req.status;
    }
    
    // If we can't find an error string specific to this status code, 
    // just use the 200 message from above, which means everything 
    // "looks" fine but there was probably an XML error or a bogus file.
    var update = new Update(null);
    update.statusText = getStatusTextFromCode(status, 200);
    this._callback.onError(request, update);

    this._request = null;
  },
  
  /**
   * Whether or not we are allowed to do update checking.
   */
  _enabled: true,
  
  /**
   * See nsIUpdateService.idl
   */
  get enabled() {
    var aus = 
        Components.classes["@mozilla.org/updates/update-service;1"].
        getService(Components.interfaces.nsIApplicationUpdateService);
    var enabled = getPref("getBoolPref", PREF_APP_UPDATE_ENABLED, true) && 
                  aus.canUpdate && this._enabled;
    return enabled;
  },
  
  /**
   * See nsIUpdateService.idl
   */
  stopChecking: function(duration) {
    // Always stop the current check
    if (this._request)
      this._request.abort();
    
    const nsIUpdateChecker = Components.interfaces.nsIUpdateChecker;
    switch (duration) {
    case nsIUpdateChecker.CURRENT_SESSION:
      this._enabled = false;
      break;
    case nsIUpdateChecker.ANY_CHECKS:
      this._enabled = false;
      gPref.setBoolPref(PREF_APP_UPDATE_ENABLED, this._enabled);
      break;
    }
  },
  
  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIUpdateChecker) &&
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};

/**
 * Manages the download of updates
 * @param   background
 *          Whether or not this downloader is operating in background
 *          update mode. 
 * @constructor
 */
function Downloader(background) {
  this.background = background;
}
Downloader.prototype = {
  /**
   * The nsIUpdatePatch that we are downloading
   */
  _patch: null,
  
  /**
   * The nsIUpdate that we are downloading
   */
  _update: null,
  
  /**
   * The nsIIncrementalDownload object handling the download
   */
  _request: null,

  /**
   * Whether or not the update being downloaded is a complete replacement of
   * the user's existing installation or a patch representing the difference
   * between the new version and the previous version.
   */
  isCompleteUpdate: null,

  /**
   * Cancels the active download.
   */  
  cancel: function() {
    if (this._request && 
        this._request instanceof Components.interfaces.nsIRequest) {
      const NS_BINDING_ABORTED = 0x804b0002;
      this._request.cancel(NS_BINDING_ABORTED);
    }
  },

  /**
   * Whether or not a patch has been downloaded and staged for installation.
   */
  get patchIsStaged() {
    return readStatusFile(getUpdatesDir()) == STATE_PENDING;
  },

  /**
   * Verify the downloaded file.  We assume that the download is complete at
   * this point.
   */
  _verifyDownload: function() {
    if (!this._request)
      return false;

    var destination = this._request.destination;

    // Ensure that the file size matches the expected file size.
    if (destination.fileSize != this._patch.size)
      return false;

    var fileStream = Components.classes["@mozilla.org/network/file-input-stream;1"].
        createInstance(nsIFileInputStream);
    fileStream.init(destination, MODE_RDONLY, PERMS_FILE, 0);

    try {
      var hash = Components.classes["@mozilla.org/security/hash;1"].
          createInstance(nsICryptoHash);
      var hashFunction = nsICryptoHash[this._patch.hashFunction.toUpperCase()];
      if (hashFunction == undefined)
        throw Components.results.NS_ERROR_UNEXPECTED;
      hash.init(hashFunction);
      hash.updateFromStream(fileStream, -1);
      // NOTE: For now, we assume that the format of _patch.hashValue is hex
      // encoded binary (such as what is typically output by programs like
      // sha1sum).  In the future, this may change to base64 depending on how
      // we choose to compute these hashes.
      digest = binaryToHex(hash.finish(false));
    } catch (e) {
      LOG("Downloader", "failed to compute hash of downloaded update archive");
      digest = "";
    }

    fileStream.close();

    return digest == this._patch.hashValue.toLowerCase();
  },

  /**
   * Select the patch to use given the current state of updateDir and the given
   * set of update patches.
   * @param   update
   *          A nsIUpdate object to select a patch from
   * @param   updateDir
   *          A nsIFile representing the update directory
   * @returns A nsIUpdatePatch object to download
   */
  _selectPatch: function(update, updateDir) {
    // Given an update to download, we will always try to download the patch
    // for a partial update over the patch for a full update.

    /**
     * Return the first UpdatePatch with the given type.
     * @param   type
     *          The type of the patch ("complete" or "partial")
     * @returns A nsIUpdatePatch object matching the type specified
     */
    function getPatchOfType(type) {
      for (var i = 0; i < update.patchCount; ++i) {
        var patch = update.getPatchAt(i);
        if (patch && patch.type == type)
          return patch;
      }
      return null;
    }

    // Look to see if any of the patches in the Update object has been
    // pre-selected for download, otherwise we must figure out which one
    // to select ourselves. 
    var selectedPatch = update.selectedPatch;
    
    var state = readStatusFile(updateDir)

    // If this is a patch that we know about, then select it.  If it is a patch
    // that we do not know about, then remove it and use our default logic.
    var useComplete = false;
    if (selectedPatch) {
      LOG("Downloader", "found existing patch [state="+state+"]");
      switch (state) {
      case STATE_DOWNLOADING: 
        LOG("Downloader", "resuming download");
        return selectedPatch;
      case STATE_PENDING:
        LOG("Downloader", "already downloaded and staged");
        return null;
      default:
        // Something went wrong when we tried to apply the previous patch.
        // Try the complete patch next time.
        if (update && selectedPatch.type == "partial") {
          useComplete = true;
        } else {
          // This is a pretty fatal error.  Just bail.
          LOG("Downloader", "failed to apply complete patch!");
          writeStatusFile(updateDir, STATE_NONE);
          return null;
        }
      }

      selectedPatch = null;
    }
    
    // If we were not able to discover an update from a previous download, we 
    // select the best patch from the given set.
    var partialPatch = getPatchOfType("partial");
    if (!useComplete)
      selectedPatch = partialPatch;
    if (!selectedPatch) {
      if (partialPatch)
        partialPatch.selected = false;
      selectedPatch = getPatchOfType("complete");
    }

    // Restore the updateDir since we may have deleted it.
    updateDir = getUpdatesDir();

    // if update only contains a partial patch, selectedPatch == null here if
    // the partial patch has been attempted and fails and we're trying to get a
    // complete patch
    if (selectedPatch)    
      selectedPatch.selected = true;

    update.isCompleteUpdate = useComplete;
    
    // Reset the Active Update object on the Update Manager and flush the
    // Active Update DB. 
    var um = Components.classes["@mozilla.org/updates/update-manager;1"]
                       .getService(Components.interfaces.nsIUpdateManager);
    um.activeUpdate = update;

    return selectedPatch;
  },

  /**
   * Whether or not we are currently downloading something.
   */
  get isBusy() {
    return this._request != null;
  },
  
  /**
   * Download and stage the given update.
   * @param   update
   *          A nsIUpdate object to download a patch for. Cannot be null.
   */
  downloadUpdate: function(update) {
    if (!update)
      throw Components.results.NS_ERROR_NULL_POINTER;
    
    var updateDir = getUpdatesDir();

    this._update = update;

    // This function may return null, which indicates that there are no patches
    // to download.
    this._patch = this._selectPatch(update, updateDir);
    if (!this._patch) {
      LOG("Downloader", "no patch to download");
      return readStatusFile(updateDir);
    }
    this.isCompleteUpdate = this._patch.type == "complete";

    var patchFile = updateDir.clone();
    patchFile.append(FILE_UPDATE_ARCHIVE);

    var ios = Components.classes["@mozilla.org/network/io-service;1"].
        getService(Components.interfaces.nsIIOService);
    var uri = ios.newURI(this._patch.URL, null, null);

    this._request =
        Components.classes["@mozilla.org/network/incremental-download;1"].
        createInstance(nsIIncrementalDownload);

    LOG("Downloader", "downloadUpdate: Downloading from " + uri.spec + " to " + 
        patchFile.path);

    var interval = this.background ? DOWNLOAD_BACKGROUND_INTERVAL
                                   : DOWNLOAD_FOREGROUND_INTERVAL;
    this._request.init(uri, patchFile, DOWNLOAD_CHUNK_SIZE, interval);
    this._request.start(this, null);

    writeStatusFile(updateDir, STATE_DOWNLOADING);
    this._patch.QueryInterface(Components.interfaces.nsIWritablePropertyBag);
    this._patch.state = STATE_DOWNLOADING;
    var um = Components.classes["@mozilla.org/updates/update-manager;1"]
                       .getService(Components.interfaces.nsIUpdateManager);
    um.saveUpdates();
    return STATE_DOWNLOADING;
  },
  
  /**
   * An array of download listeners to notify when we receive 
   * nsIRequestObserver or nsIProgressEventSink method calls.
   */
  _listeners: [],

  /** 
   * Adds a listener to the download process
   * @param   listener
   *          A download listener, implementing nsIRequestObserver and
   *          nsIProgressEventSink
   */
  addDownloadListener: function(listener) {
    for (var i = 0; i < this._listeners.length; ++i) {
      if (this._listeners[i] == listener)
        return;
    }
    this._listeners.push(listener);
  },
  
  /** 
   * Removes a download listener
   * @param   listener
   *          The listener to remove.
   */
  removeDownloadListener: function(listener) {
    for (var i = 0; i < this._listeners.length; ++i) {
      if (this._listeners[i] == listener) {
        this._listeners.splice(i, 1);
        return;
      }
    }
  },
  
  /**
   * When the async request begins
   * @param   request
   *          The nsIRequest object for the transfer
   * @param   context
   *          Additional data
   */
  onStartRequest: function(request, context) {
    request.QueryInterface(nsIIncrementalDownload);
    LOG("Downloader", "onStartRequest: " + request.URI.spec);
    
    var listenerCount = this._listeners.length;
    for (var i = 0; i < listenerCount; ++i)
      this._listeners[i].onStartRequest(request, context);
  },
  
  /** 
   * When new data has been downloaded
   * @param   request
   *          The nsIRequest object for the transfer
   * @param   context
   *          Additional data
   * @param   progress
   *          The current number of bytes transferred
   * @param   maxProgress
   *          The total number of bytes that must be transferred
   */
  onProgress: function(request, context, progress, maxProgress) {
    request.QueryInterface(nsIIncrementalDownload);
    LOG("Downloader.onProgress", "onProgress: " + request.URI.spec + ", " + progress + "/" + maxProgress);
    
    var listenerCount = this._listeners.length;
    for (var i = 0; i < listenerCount; ++i) {
      var listener = this._listeners[i];
      if (listener instanceof Components.interfaces.nsIProgressEventSink)
        listener.onProgress(request, context, progress, maxProgress);
    }
  },
  
  /** 
   * When we have new status text
   * @param   request
   *          The nsIRequest object for the transfer
   * @param   context
   *          Additional data
   * @param   status
   *          A status code
   * @param   statusText
   *          Human readable version of |status|
   */
  onStatus: function(request, context, status, statusText) {
    request.QueryInterface(nsIIncrementalDownload);
    LOG("Downloader", "onStatus: " + request.URI.spec + " status = " + status + ", text = " + statusText);
    var listenerCount = this._listeners.length;
    for (var i = 0; i < listenerCount; ++i) {
      var listener = this._listeners[i];
      if (listener instanceof Components.interfaces.nsIProgressEventSink)
        listener.onStatus(request, context, status, statusText);
    }
  },
  
  /** 
   * When data transfer ceases
   * @param   request
   *          The nsIRequest object for the transfer
   * @param   context
   *          Additional data
   * @param   status
   *          Status code containing the reason for the cessation.
   */
  onStopRequest: function(request, context, status) {
    request.QueryInterface(nsIIncrementalDownload);
    LOG("Downloader", "onStopRequest: " + request.URI.spec + ", status = " + status);

    var state = this._patch.state;
    var shouldShowPrompt = false;
    var deleteActiveUpdate = false;
    const NS_BINDING_ABORTED = 0x804b0002;
    const NS_ERROR_ABORT = 0x80004004;
    if (Components.isSuccessCode(status)) {
      var sbs = 
          Components.classes["@mozilla.org/intl/stringbundle;1"].
          getService(Components.interfaces.nsIStringBundleService);
      var updateStrings = sbs.createBundle(URI_UPDATES_PROPERTIES);
      if (this._verifyDownload()) {
        state = STATE_PENDING;
        
        // We only need to explicitly show the prompt if this is a backround
        // download, since otherwise some kind of UI is already visible and 
        // that UI will notify. 
        if (this.background)
          shouldShowPrompt = true;
        
        // Tell the updater.exe we're ready to apply.
        writeStatusFile(getUpdatesDir(), state);
        this._update.installDate = (new Date()).getTime();
        this._update.statusText = updateStrings.
          GetStringFromName("installPending");
      } else {
        LOG("Downloader", "onStopRequest: download verification failed");
        state = STATE_DOWNLOAD_FAILED;
        
        var brandStrings = sbs.createBundle(URI_BRAND_PROPERTIES);
        var brandShortName = brandStrings.GetStringFromName("brandShortName");
        this._update.statusText = updateStrings.
          formatStringFromName("verificationError", [brandShortName], 1);
        
        // TODO: use more informative error code here
        status = Components.results.NS_ERROR_UNEXPECTED;
        
        var message = getStatusTextFromCode("verification_failed", 
          "verification_failed");
        this._update.statusText = message;
        
        if (this._update.isCompleteUpdate)
          deleteActiveUpdate = true;

        // Destroy the updates directory, since we're done with it.
        cleanUpUpdatesDir();
      }
    }
    else if (status != NS_BINDING_ABORTED &&
             status != NS_ERROR_ABORT) {
      LOG("Downloader", "onStopRequest: Non-verification failure");
      // Some sort of other failure, log this in the |statusText| property
      state = STATE_DOWNLOAD_FAILED;
      
      // XXXben - if |request| (The Incremental Download) provided a means
      // for accessing the http channel we could do more here.
      
      const NS_BINDING_FAILED = 2152398849;
      this._update.statusText = getStatusTextFromCode(status, 
        NS_BINDING_FAILED);
      
      // Destroy the updates directory, since we're done with it.
      cleanUpUpdatesDir();
      
      deleteActiveUpdate = true;
    }
    LOG("Downloader", "Setting state to: " + state);
    this._patch.state = state;
    var um = 
        Components.classes["@mozilla.org/updates/update-manager;1"].
        getService(Components.interfaces.nsIUpdateManager);
    if (deleteActiveUpdate) {
      this._update.installDate = (new Date()).getTime();
      um.activeUpdate = null;
    }
    um.saveUpdates();
    
    var listenerCount = this._listeners.length;
    for (var i = 0; i < listenerCount; ++i)
      this._listeners[i].onStopRequest(request, context, status);

    this._request = null;
    
    if (state == STATE_DOWNLOAD_FAILED) {
      if (!this._update.isCompleteUpdate) {
        var allFailed = true;
  
        // If we were downloading a patch and the patch verification phase 
        // failed, log this and then commence downloading the complete update.
        LOG("Downloader", "onStopRequest: Verification of patch failed, downloading complete update");
        this._update.isCompleteUpdate = true;
        var status = this.downloadUpdate(this._update);

        if (status == STATE_NONE) {
          cleanupActiveUpdate();
        } else {
          allFailed = false;
        }
        // This will reset the |.state| property on this._update if a new 
        // download initiates.
      }
    
      // if we still fail after trying a complete download, give up completely
      if (allFailed) {
        // In all other failure cases, i.e. we're S.O.L. - no more failing over
        // ...
        
        // If this was ever a foreground download, and now there is no UI active
        // (e.g. because the user closed the download window) and there was an
        // error, we must notify now. Otherwise we can keep the failure to 
        // ourselves since the user won't be expecting it. 
        try {
          this._update.QueryInterface(Components.interfaces.nsIWritablePropertyBag);
          var fgdl = this._update.getProperty("foregroundDownload");
        }
        catch (e) {
        }
      
        if (fgdl == "true") {
          var prompter = 
              Components.classes["@mozilla.org/updates/update-prompt;1"].
              createInstance(Components.interfaces.nsIUpdatePrompt);
          this._update.QueryInterface(Components.interfaces.nsIWritablePropertyBag);
          this._update.setProperty("downloadFailed", "true");
          prompter.showUpdateError(this._update);
        }
      }

      // the complete download succeeded or total failure was handled, so exit
      return;
    }

    // Do this after *everything* else, since it will likely cause the app 
    // to shut down. 
    if (shouldShowPrompt) {
      // Notify the user that an update has been downloaded and is ready for 
      // installation (i.e. that they should restart the application). We do
      // not notify on failed update attempts.
      var prompter = 
          Components.classes["@mozilla.org/updates/update-prompt;1"].
          createInstance(Components.interfaces.nsIUpdatePrompt);
      prompter.showUpdateDownloaded(this._update);
    }
  },

  /**
   * See nsIInterfaceRequestor.idl
   */
  getInterface: function(iid) {
    // The network request may require proxy authentication, so provide the
    // default nsIAuthPrompt if requested.
    if (iid.equals(Components.interfaces.nsIAuthPrompt)) {
      var prompt =
          Components.classes["@mozilla.org/network/default-auth-prompt;1"].
          createInstance();
      return prompt.QueryInterface(iid);
    }
    Components.returnCode = Components.results.NS_ERROR_NO_INTERFACE;
    return null;
  },
   
  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIRequestObserver) &&
        !iid.equals(Components.interfaces.nsIProgressEventSink) &&
        !iid.equals(Components.interfaces.nsIInterfaceRequestor) &&
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};

/**
 * A manager for update check timers. Manages timers that fire over long 
 * periods of time (e.g. days, weeks).
 * @constructor
 */
function TimerManager() {
  getObserverService().addObserver(this, "xpcom-shutdown", false);

  const nsITimer = Components.interfaces.nsITimer;
  this._timer = Components.classes["@mozilla.org/timer;1"]
                          .createInstance(nsITimer);
  var timerInterval = getPref("getIntPref", PREF_APP_UPDATE_TIMER, 600000);
  this._timer.initWithCallback(this, timerInterval, 
                               nsITimer.TYPE_REPEATING_SLACK);
}
TimerManager.prototype = {
  /**
   * See nsIObserver.idl
   */
  observe: function(subject, topic, data) {
    if (topic == "xpcom-shutdown") {
     getObserverService().removeObserver(this, "xpcom-shutdown");

      // Release everything we hold onto. 
      for (var timerID in this._timers)
        delete this._timers[timerID];
      this._timer = null;
      this._timers = null;
    }
  },

  /**
   * The Checker Timer
   */
  _timer: null,
  
  /**
   * The set of registered timers.
   */
  _timers: { },
  
  /**
   * Called when the checking timer fires.
   * @param   timer
   *          The checking timer that fired. 
   */
  notify: function(timer) {
    for (var timerID in this._timers) {
      var timerData = this._timers[timerID];
      var lastUpdateTime = timerData.lastUpdateTime;
      var now = Math.round(Date.now() / 1000);
    
      // Fudge the lastUpdateTime by some random increment of the update 
      // check interval (e.g. some random slice of 10 minutes) so that when
      // the time comes to check, we offset each client request by a random
      // amount so they don't all hit at once. app.update.timer is in milliseconds,
      // whereas app.update.lastUpdateTime is in seconds
      var timerInterval = getPref("getIntPref", PREF_APP_UPDATE_TIMER, 600000);
      lastUpdateTime += Math.round(Math.random() * timerInterval / 1000);

      if ((now - lastUpdateTime) > timerData.interval &&
          timerData.callback instanceof Components.interfaces.nsITimerCallback) {
        timerData.callback.notify(timer);
        timerData.lastUpdateTime = now;
        var preference = PREF_APP_UPDATE_LASTUPDATETIME_FMT.replace(/%ID%/, timerID);
        gPref.setIntPref(preference, now);
      }
    }
  },
  
  /**
   * See nsIUpdateService.idl
   */
  registerTimer: function(id, callback, interval) {
    var preference = PREF_APP_UPDATE_LASTUPDATETIME_FMT.replace(/%ID%/, id);
    var now = Math.round(Date.now() / 1000);
    var lastUpdateTime = null;
    if (gPref.prefHasUserValue(preference)) {
      lastUpdateTime = gPref.getIntPref(preference);
    } else {
      gPref.setIntPref(preference, now);
      lastUpdateTime = now;
    }
    this._timers[id] = { callback       : callback, 
                         interval       : interval,
                         lastUpdateTime : lastUpdateTime }; 
  },

  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIUpdateTimerManager) &&
        !iid.equals(Components.interfaces.nsITimerCallback) &&
        !iid.equals(Components.interfaces.nsIObserver) &&
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};

//@line 2689 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
/**
 * UpdatePrompt
 * An object which can prompt the user with information about updates, request
 * action, etc. Embedding clients can override this component with one that 
 * invokes a native front end. 
 * @constructor
 */
function UpdatePrompt() {
}
UpdatePrompt.prototype = {
  /**
   * See nsIUpdateService.idl
   */
  checkForUpdates: function() {
    this._showUI(null, URI_UPDATE_PROMPT_DIALOG, null, "Update:Wizard", 
                 null, null);
  },
    
  /**
   * See nsIUpdateService.idl
   */
  showUpdateAvailable: function(update) {
    if (this._enabled) {
      this._showUI(null, URI_UPDATE_PROMPT_DIALOG, null, "Update:Wizard", 
                   "updatesavailable", update);
    }
  },
  
  /**
   * See nsIUpdateService.idl
   */
  showUpdateDownloaded: function(update) {
    if (this._enabled) {
      this._showUI(null, URI_UPDATE_PROMPT_DIALOG, null, "Update:Wizard", 
                   "finishedBackground", update);
    }
  },
  
  /**
   * See nsIUpdateService.idl
   */
  showUpdateInstalled: function(update) {
    var showUpdateInstalledUI = getPref("getBoolPref", 
      PREF_APP_UPDATE_SHOW_INSTALLED_UI, true);
    if (this._enabled && showUpdateInstalledUI) {
      this._showUI(null, URI_UPDATE_PROMPT_DIALOG, null, "Update:Wizard", 
                   "installed", update);
    }
  },
  
  /**
   * See nsIUpdateService.idl
   */
  showUpdateError: function(update) {
    if (this._enabled) {
      // In some cases, we want to just show a simple alert dialog:
      if (update.state == STATE_FAILED && update.errorCode == WRITE_ERROR) {
        var sbs = 
            Components.classes["@mozilla.org/intl/stringbundle;1"].
            getService(Components.interfaces.nsIStringBundleService);
        var updateBundle = sbs.createBundle(URI_UPDATES_PROPERTIES);
        var title = updateBundle.GetStringFromName("updaterIOErrorTitle");
        var text = updateBundle.formatStringFromName("updaterIOErrorText",
                                                     [gApp.name], 1);
        var ww =
            Components.classes["@mozilla.org/embedcomp/window-watcher;1"].
            getService(Components.interfaces.nsIWindowWatcher);
        ww.getNewPrompter(null).alert(title, text);
      } else {
        this._showUI(null, URI_UPDATE_PROMPT_DIALOG, null, "Update:Wizard", 
                     "errors", update);
      }
    }
  },
  
  /**
   * See nsIUpdateService.idl
   */
  showUpdateHistory: function(parent) {
    this._showUI(parent, URI_UPDATE_HISTORY_DIALOG, "modal,dialog=yes", "Update:History", 
                 null, null);
  },
  
  /**
   * Whether or not we are enabled (i.e. not in Silent mode)
   */
  get _enabled() {
    return !getPref("getBoolPref", PREF_APP_UPDATE_SILENT, false);
  },
  
  /**
   * Show the Update Checking UI
   * @param   parent
   *          A parent window, can be null
   * @param   uri
   *          The URI string of the dialog to show
   * @param   name
   *          The Window Name of the dialog to show, in case it is already open
   *          and can merely be focused
   * @param   page
   *          The page of the wizard to be displayed, if one is already open.
   * @param   update
   *          An update to pass to the UI in the window arguments. 
   *          Can be null
   */
  _showUI: function(parent, uri, features, name, page, update) {
    var ary = null;
    if (update) {
      ary = Components.classes["@mozilla.org/supports-array;1"]
                      .createInstance(Components.interfaces.nsISupportsArray);
      ary.AppendElement(update);
    }
      
    var wm = Components.classes["@mozilla.org/appshell/window-mediator;1"]
                       .getService(Components.interfaces.nsIWindowMediator);
    var win = wm.getMostRecentWindow(name);
    if (win) {
      if (page && "setCurrentPage" in win)
        win.setCurrentPage(page);
      win.focus();
    }
    else {
      var openFeatures = "chrome,centerscreen,dialog=no,resizable=no,titlebar,toolbar=no";
      if (features)
        openFeatures += "," + features;
      var ww = Components.classes["@mozilla.org/embedcomp/window-watcher;1"]
                         .getService(Components.interfaces.nsIWindowWatcher);
      ww.openWindow(parent, uri, "", openFeatures, ary);
    }
  },
  
  /**
   * See nsISupports.idl
   */
  QueryInterface: function(iid) {
    if (!iid.equals(Components.interfaces.nsIUpdatePrompt) &&
        !iid.equals(Components.interfaces.nsISupports))
      throw Components.results.NS_ERROR_NO_INTERFACE;
    return this;
  }
};
//@line 2831 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"

var gModule = {
  registerSelf: function(componentManager, fileSpec, location, type) {
    componentManager = componentManager.QueryInterface(Components.interfaces.nsIComponentRegistrar);
    
    for (var key in this._objects) {
      var obj = this._objects[key];
      componentManager.registerFactoryLocation(obj.CID, obj.className, obj.contractID,
                                               fileSpec, location, type);
    }

    // Make the Update Service a startup observer
    var categoryManager = Components.classes["@mozilla.org/categorymanager;1"]
                                    .getService(Components.interfaces.nsICategoryManager);
    categoryManager.addCategoryEntry("app-startup", this._objects.service.className,
                                     "service," + this._objects.service.contractID, 
                                     true, true, null);
  },
  
  getClassObject: function(componentManager, cid, iid) {
    if (!iid.equals(Components.interfaces.nsIFactory))
      throw Components.results.NS_ERROR_NOT_IMPLEMENTED;

    for (var key in this._objects) {
      if (cid.equals(this._objects[key].CID))
        return this._objects[key].factory;
    }
    
    throw Components.results.NS_ERROR_NO_INTERFACE;
  },
  
  _objects: {
    service: { CID        : Components.ID("{B3C290A6-3943-4B89-8BBE-C01EB7B3B311}"),
               contractID : "@mozilla.org/updates/update-service;1",
               className  : "Update Service",
               factory    : makeFactory(UpdateService)
             },
    checker: { CID        : Components.ID("{898CDC9B-E43F-422F-9CC4-2F6291B415A3}"),
               contractID : "@mozilla.org/updates/update-checker;1",
               className  : "Update Checker",
               factory    : makeFactory(Checker)
             },
//@line 2874 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
    prompt:  { CID        : Components.ID("{27ABA825-35B5-4018-9FDD-F99250A0E722}"),
               contractID : "@mozilla.org/updates/update-prompt;1",
               className  : "Update Prompt",
               factory    : makeFactory(UpdatePrompt)
             },
//@line 2880 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
    timers:  { CID        : Components.ID("{B322A5C0-A419-484E-96BA-D7182163899F}"),
               contractID : "@mozilla.org/updates/timer-manager;1",
               className  : "Timer Manager",
               factory    : makeFactory(TimerManager)
             },
    manager: { CID        : Components.ID("{093C2356-4843-4C65-8709-D7DBCBBE7DFB}"),
               contractID : "@mozilla.org/updates/update-manager;1",
               className  : "Update Manager",
               factory    : makeFactory(UpdateManager)
             },
  },
  
  canUnload: function(componentManager) {
    return true;
  }
};

/**
 * Creates a factory for instances of an object created using the passed-in
 * constructor.
 */
function makeFactory(ctor) {
  function ci(outer, iid) {
    if (outer != null)
      throw Components.results.NS_ERROR_NO_AGGREGATION;
    return (new ctor()).QueryInterface(iid);
  } 
  return { createInstance: ci };
}
  
function NSGetModule(compMgr, fileSpec) {
  return gModule;
}

/**
 * Determines whether or there are installed addons which are incompatible 
 * with this update.
 * @param   update
 *          The update to check compatibility against
 * @returns true if there are no addons installed that are incompatible with
 *          the specified update, false otherwise.
 */
function isCompatible(update) {
//@line 2924 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
  var em = 
      Components.classes["@mozilla.org/extensions/manager;1"].
      getService(Components.interfaces.nsIExtensionManager);
  var items = em.getIncompatibleItemList("", update.extensionVersion,
    nsIUpdateItem.TYPE_ADDON, false, { });
  return items.length == 0;
//@line 2933 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
}

/**
 * Shows a prompt for an update, provided there are no incompatible addons.
 * If there are, kick off an update check and see if updates are available
 * that will resolve the incompatibilities.
 * @param   update
 *          The available update to show
 */
function showPromptIfNoIncompatibilities(update) {
  function showPrompt(update) {
    LOG("UpdateService", "_selectAndInstallUpdate: need to prompt user before continuing...");
    var prompter = 
        Components.classes["@mozilla.org/updates/update-prompt;1"].
        createInstance(Components.interfaces.nsIUpdatePrompt);
    prompter.showUpdateAvailable(update);
  }

//@line 2952 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
  /**
   * Determines if an addon is compatible with a particular update.
   * @param   addon
   *          The addon to check
   * @param   version
   *          The extensionVersion of the update to check for compatibility 
   *          against.
   * @returns true if the addon is compatible, false otherwise
   */
  function addonIsCompatible(addon, version) {
    var vc = 
        Components.classes["@mozilla.org/xpcom/version-comparator;1"].
        getService(Components.interfaces.nsIVersionComparator);
    return (vc.compare(version, addon.minAppVersion) >= 0) &&
          (vc.compare(version, addon.maxAppVersion) <= 0);
  }

  /**
   * An object implementing nsIAddonUpdateCheckListener that looks for 
   * available updates to addons and if updates are found that will make the 
   * user's installed addon set compatible with the update, suppresses the
   * prompt that would otherwise be shown.
   * @param   addons
   *          An array of incompatible addons that are installed.
   * @constructor
   */
  function Listener(addons) {
    this._addons = addons;
  }
  Listener.prototype = {
    _addons: null,
    
    /**
     * See nsIUpdateService.idl
     */
    onUpdateStarted: function() { 
    },
    onUpdateEnded: function() {
      // There are still incompatibilities, even after an extension update 
      // check to see if there were newer, compatible versions available, so
      // we have to prompt. 
      // 
      // PREF_APP_UPDATE_INCOMPATIBLE_MODE controls the mode in which we 
      // handle incompatibilities:
      // 0    We count both VersionInfo updates _and_ NewerVersion updates
      //      against the list of incompatible addons installed - i.e. if
      //      Foo 1.2 is installed and it is incompatible with the update, and
      //      we find Foo 2.0 which is but which is not yet downloaded or 
      //      installed, then we do NOT prompt because the user can download
      //      Foo 2.0 when they restart after the update during the mismatch
      //      checking UI. This is the default, since it suppresses most 
      //      prompt dialogs. 
      // 1    We count only VersionInfo updates against the list of 
      //      incompatible addons installed - i.e. if the situation above
      //      with Foo 1.2 and available update to 2.0 applies, we DO show
      //      the prompt since a download operation will be required after
      //      the update. This is not the default and is supplied only as
      //      a hidden option for those that want it. 
      var mode = getPref("getIntPref", PREF_APP_UPDATE_INCOMPATIBLE_MODE, 
                         INCOMPATIBLE_MODE_NEWVERSIONS);
      if ((mode == 0 && this._addons.length) || !isCompatible(update))
        showPrompt(update);
    },
    onAddonUpdateStarted: function(addon) {
    },
    onAddonUpdateEnded: function(addon, status) {
      if (status == Components.interfaces.nsIAddonUpdateCheckListener.STATUS_UPDATE &&
          addonIsCompatible(addon, update.extensionVersion)) {
        for (var i = 0; i < this._addons.length; ++i) {
          if (this._addons[i] == addon) {
            this._addons.splice(i, 1);
            break;
          }
        }
      }
    },
    /**
     * See nsISupports.idl
     */
    QueryInterface: function(iid) {
      if (!iid.equals(Components.interfaces.nsIAddonUpdateCheckListener) &&
          !iid.equals(Components.interfaces.nsISupports))
        throw Components.results.NS_ERROR_NO_INTERFACE;
      return this;
    }
  };
  
  if (!isCompatible(update)) {
    var em = 
        Components.classes["@mozilla.org/extensions/manager;1"].
        getService(Components.interfaces.nsIExtensionManager);
    var listener = new Listener(em.getIncompatibleItemList("", 
      update.extensionVersion, nsIUpdateItem.TYPE_ADDON, false, { }));
    // See documentation on |mode| above. 
    var mode = getPref("getIntPref", PREF_APP_UPDATE_INCOMPATIBLE_MODE, 
                       INCOMPATIBLE_MODE_NEWVERSIONS);
    em.update([], 0, mode != 0, listener);
  }
  else
//@line 3052 "/cygdrive/c/builds/tinderbox/Fx-Mozilla1.8-release/WINNT_5.2_Depend/mozilla/toolkit/mozapps/update/src/nsUpdateService.js.in"
    showPrompt(update);
}
