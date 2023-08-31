/* 
See "CMUgraphics.h" for version info and copyright information
This file was last modified on 06.12.2000
*/

#include <CMUgraphics.h>

extern "C" {
DWORD STDCALL timeGetTime(VOID); 
}

// Pause for iTime milliseconds
void Pause(const unsigned long ulTime) {
	Sleep(ulTime);
}

// Return the number of milliseconds since Windows was started
unsigned long CurrentTime() {
	return timeGetTime();
}

// Return true if iInterval milliseconds have elapsed since
// the last time ElapsedTime was called.  Returns false on the 
// first call
bool ElapsedTime(const unsigned long ulInterval) {
	static unsigned long ulLastTime = timeGetTime();
	unsigned long ulCurrentTime;

	ulCurrentTime = timeGetTime();
	if((ulCurrentTime - ulLastTime) >= ulInterval) {
		ulLastTime = ulCurrentTime;
		return true;
	}
	return false;
}
