/* 
See "CMUgraphics.h" for version info and copyright information
This file was last modified on 09.09.2000
*/

#include <iostream>
#include <CMUgraphics.h>

using namespace std;

//typedef ios ios_base;

errorreporting error::method = LOG;
fstream error::errorlog;

error::error(errortype et, string message) : 
	etInfo(et), strMessage(message) {

	switch(method) {
		case CERR:
			cerr << etToString(et) << ": " << strMessage << endl;
			break;
			
		case LOG:
		    if(!LogOpen()) 
		    	OpenLog();
            errorlog << etToString(et) << ": " << strMessage << endl;		
            CloseLog();
            break;
            
		case EXCEPTION:
			throw *this;	
			break;
	}

}

error::error(error& e) : etInfo(e.etInfo), strMessage(e.strMessage) {

}

error& error::operator=(error& e) {
  etInfo = e.etInfo;
  strMessage = e.strMessage;
  return *this;
}

string error::etToString(errortype et) {
  switch(et) {
  	case OUT_OF_MEMORY:
    	return "OUT OF MEMORY";
    case FILE_NOT_FOUND:
    	return "FILE NOT FOUND";
    case SYSTEM:
    	return "SYSTEM";
    case USER:
    	return "USER";
    default:
    	return "UNKNOWN ERROR";
    	
  }
}

bool error::LogOpen() {
	return errorlog.is_open();
}

void error::OpenLog() {
	errorlog.open("CMUgraphics-error-log.txt", ios_base::out | ios_base::app);
}

void error::CloseLog() {
	errorlog.close();
}

string error::GetMessage() const {
	return strMessage;
}

errortype error::GetErrorType() const {
	return etInfo;
}

errorreporting error::SetMethod(const errorreporting erMethod) {
	errorreporting temp = method;
	method = erMethod;
	return temp;
}
