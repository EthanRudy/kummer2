from pydevd_constants import * #@UnusedWildImport

try:
    import cStringIO as StringIO #may not alway be available @UnusedImport
except:
    import StringIO #@Reimport

import threading
import sys
import traceback

class TracingFunctionHolder:
    '''This class exists just to keep some variables (so that we don't keep them in the global namespace). 
    '''
    _original_tracing = None
    _warn = True
    _lock = threading.Lock()
    _traceback_limit = 1
    _warnings_shown = {}
 
 
def GetExceptionTracebackStr():
    exc_info = sys.exc_info()
    s = StringIO.StringIO()
    traceback.print_exception(exc_info[0], exc_info[1], exc_info[2], file = s)
    return s.getvalue()

def _GetStackStr(frame):
    
    msg = '\nIf this is needed, please check: '+\
          '\nhttp://pydev.blogspot.com/2007/06/why-cant-pydev-debugger-work-with.html'+\
          '\nto see how to restore the debug tracing back correctly.\n' 
          
    if TracingFunctionHolder._traceback_limit:
        s = StringIO.StringIO()
        print >> s, 'Call Location:'
        traceback.print_stack(f=frame, limit=TracingFunctionHolder._traceback_limit, file = s)
        msg = msg+s.getvalue()
    
    return msg

def _InternalSetTrace(tracing_func):
    if TracingFunctionHolder._warn:
        frame = sys._getframe()
        if not frame.f_back.f_code.co_filename.lower().endswith('threading.py'):
            
            message = \
            '\nPYDEV DEBUGGER WARNING:'+\
            '\nsys.settrace() should not be used when the debugger is being used.'+\
            '\nThis may cause the debugger to stop working correctly.'+\
            '%s' % _GetStackStr(frame.f_back)
            
            if message not in TracingFunctionHolder._warnings_shown:
                #only warn about each message once...
                TracingFunctionHolder._warnings_shown[message] = 1
                print >> sys.stderr, message
            
    TracingFunctionHolder._original_tracing(tracing_func)

def SetTrace(tracing_func):
    TracingFunctionHolder._lock.acquire()
    try:
        TracingFunctionHolder._warn = False
        _InternalSetTrace(tracing_func)
        TracingFunctionHolder._warn = True
    finally:
        TracingFunctionHolder._lock.release()
        
    
def ReplaceSysSetTraceFunc():
    if TracingFunctionHolder._original_tracing is None:
        TracingFunctionHolder._original_tracing = sys.settrace
        sys.settrace = _InternalSetTrace
    
