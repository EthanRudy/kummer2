// MyPlayer.h

// Chris Rook

// version 2 29/1/02

// Inline functions corrected

#include <dsound.h>		// directX draw
#include <ddraw.h>		// directX draw
#include <mmsystem.h>	// Multimedia stuff
#include <iostream.h>	// In/out stuff
#include <conio.h>		// In/out stuff
#include <stdlib.h>		// Standard tools
#include <malloc.h>		// Memory allocation tools
#include <memory.h>		// Memory management tools
#include <string.h>		// Strings - old style
#include <stdarg.h>		// #########################
#include <stdio.h>		// Yet more in/out
#include <math.h>		// Maths tools
#include <io.h>			// Yet more in/out
#include <fcntl.h>		// Function control tools

#include "mysound.h"
#include "errortype.h"

#ifndef MYPLAYER_H
#define MYPLAYER_H

//#define FAILURE -1
//#define SUCCESS 0

class MySoundEngine
{

public:
	IDirectSound *lpds;


	MySoundEngine(HWND hwnd);
	// Simply creates a MyInstrument
	// hwnd is the handle of the main window
	// Precondition:
	//	DirectSound is installed on the computer

	~MySoundEngine();
	// The destructor for the MyInstrument. Calls Release().

	ErrorType Release();
	// Releases the memory and COM objects=. Needs to be called
	// before closing the program. (Gets called by the constructor,
	// but best to call it explicitly as well.)
	// Returns FAILURE if the COM object was not NULL already
	// Returns SUCCESS otherwise
};



#endif
