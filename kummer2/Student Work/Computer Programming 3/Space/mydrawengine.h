// MyDraw.h - Header file for MyDraw object

// version 4 6/2/02

// Inline functions corrected
// Blit and FillRect changed to pass-by-reference
// _RGB15BIT macro fixed



#ifndef mydraw_h
#define mydraw_h

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
#include "errortype.h"		// Error definitions

#include "mypicture.h"

// Macros ***************************************************
#define MAX_CLIP_RECTS 10

#define _RGB565(r,g,b)  ((((b>>3)%32)) + (((g>>4)%64)<<6) + (((r>>3)%32)<<11))

// The class spec *******************************************

// This class provides a simple set of graphics functions that
// use directX for a computer game, using 16-bit graphics.
// The functions are organised in a class for convenience, rather
// than for OO principles.
// Only one instance of this class should appear in your code - otherwise
// you will be trying to have two Direct Draws running - each with their 
// own primary and secondary surface.
// Good OO should have this implemented as a singleton class, but I want
// to keep things simple, so I am just going to trust you not to
// try to create two MyScreens.

class MyDrawEngine
{
private:
	USHORT *videoAddress;				// Pointer to start of video buffer,

public:
	// Public attributes ************************************
	//   Lots of public attributes - it means this object is
	//   less encapsulated, but this works faster. OO principles
	//   are a lot less important than speed in a computer game.
	int screenWidth;
	int screenHeight;
	int colourDepth;
	int memoryPitch;
	LPDIRECTDRAWSURFACE lpPrimarySurface;
	LPDIRECTDRAWSURFACE lpBackBuffer;
	DDSURFACEDESC ddsd;					// Surface "order form"
	RECT clipRect[MAX_CLIP_RECTS];		// The clipper rectangles
	int numClipRects;					// The number of clipper rects
	IDirectDraw2* lpdd;					// Pointer to direct draw
										// when the surface was last locked.
	
	// Public methods ***************************************
	// Yes, that's right - I've made nearly everything public
	// We are games programmers - we need speed, and we trust ourselves.

public:
	MyDrawEngine(int width, int height, int depth, HWND hwnd);
		// Precondition:	A window for the application has been created
		//					DirectDraw has not already been initialised.
		// Postcondition:	A DirectDraw2 interface has been created.
		//					The screen has been put into full-screen, exclusive mode.
		//					The primary surface and the back buffer have been initialised and cleared.
		// Parameters:
		//		width		The pixel width of the screen (in UNN NT labs, you are restricted to 800)
		//		height		The pixel height of the screen (in UNN NT labs, you are restricted to 600)
		//		depth		The colour depth of the screen (bits per pixel - in NT labs, use 16)
		//		hwnd		The handle to the application's window.

	~MyDrawEngine();

	ErrorType Flip();
		// Precondition:	shutdown() has not been called
		//					Neither primary nor buffer is locked.
		// Postcondition:	Primary surface and the back buffer have been flipped.
		//					(function will wait until flip is possible)
		// Returns:			SUCCESS

	ErrorType Release();
		// Postcondition:	The primary surface, the buffer, the clipper and DirectDraw have been released.
		// Returns:			SUCCESS
	

	ErrorType Blit(RECT& destinationRect, RECT& sourceRect, MyPicture *thePicture);
		// Preconditions	thePicture has been initialised to contain an image
		//					destinationRect and sourceRect are valid structures
		//					with values that have been initialised
		// Postcondition	A part of the image in theSurface will be placed
		//					on the back buffer. (Subject to clipping.)
		//					The part of the image in "theSurface" is specified by
		//					sourceRect. If the values of sourceRect extend beyond the
		//					edges of the image in theSurface, the sourceRect will be clipped
		//					to the edges of the image. The location of the destination of the image
		//					is specified by destinationRect. The image will be stretched and scaled
		//					to fit into the destinationRect.
		//	Returns			SUCCESS if blit successful. FAILURE otherwise.

	ErrorType DrawAt(int x, int y, MyPicture *thePicture);
		// Preconditions	thePicture has been initialised to contain an image
		// Postcondition	The whole image in theSurface will be placed
		//					on the back buffer. (Subject to clipping.)
		//					The top left of the image will be placed at the x,y coordinates specified
		//	Returns			SUCCESS if blit successful. FAILURE otherwise.


	ErrorType FillRect(RECT& destinationRect, int colour);
		// Postcondition	A rectangle in the back buffer will be filled with the specified
		//					colour. (Subject to clipping.) x1 and y1 specify the top left
		//					corner of the rectangle on the back buffer to be filled. x2 and
		//					y2 specify the bottom right corner of the rectangle.
		// Returns			SUCCESS if fill successful. FAILURE otherwise

	ErrorType SetClipper(int numRects, LPRECT clipList);
		// Precondition		clipList points to an array of rects, and
		//					numRects is the number of elements of the array
		// Postcondition	The back buffer's clip list will be set to match
		//					the rectangles sent to this method. The previous
		//					clip list will be cleared.
		// Returns			SUCCESS if clip list accepted. FAILURE otherwise

	ErrorType LockBackSurface();
		// Postcondition	The back buffer is locked, to allow direct 
		//					manipulation of the surface.
		// Returns			SUCCESS if lock successful. FAILURE otherwise

	ErrorType UnlockBackSurface();
		// Postcondition	The back buffer is unlocked, to return control
		//					of the surface to directX
		// Returns			SUCCESS if unlock successful. FAILURE otherwise

	inline ErrorType DrawPoint(int x1, int y1, int colour);
		// Precondition		The back buffer is locked.
		//					x1 and y1 specify a point on the screen
		// Postcondition	A point of the specified colour has been
		//					plotted at x1,y1 on the back buffer.
		// Returns			SUCCESS
		// Notes			This function will crash your computer into
		//					next week if the surface is not locked,
		//					and (x1,y1) is not on screen.

	ErrorType ClearBackBuffer();
		// Postcondition	The back buffer is cleared (all black)
		// Returns			SUCCESS if successful FAILURE otherwise.

	ErrorType Validate();
		// Returns			SUCCESS if the device is still valid or if it was successfully reaquired
		//					FAILURE if the screen is unavailable

	// Private methods **************************************
private:

};	// End of class definition


inline ErrorType MyDrawEngine::FillRect(RECT& destinationRect, int colour)
{

	DDBLTFX ddbltfx;	// FX order form

	memset(&ddbltfx,0,sizeof(ddbltfx));
	ddbltfx.dwSize=sizeof(ddbltfx);


	// set FX to the colour requested
	ddbltfx.dwFillColor = colour; 


	// Fill in the surface
	lpBackBuffer->Blt(&destinationRect, 
			   NULL,							// nothing to copy from            
			   NULL,							// nothing to copy from
			   DDBLT_COLORFILL | DDBLT_WAIT,	// fill and wait for complete
			   &ddbltfx);						// the order form

	return SUCCESS;
}

inline ErrorType MyDrawEngine::Blit(RECT& destinationRect, RECT& sourceRect, MyPicture *thePicture)
{
	if (FAILED(lpBackBuffer->Blt(&destinationRect, thePicture->lpTheSurface, &sourceRect, (DDBLT_WAIT | DDBLT_KEYSRC),NULL)))
	{
		  OutputDebugString("Blit failed\n");
		  return FAILURE;
	}

	return SUCCESS;
}

inline ErrorType MyDrawEngine::DrawAt(int x, int y, MyPicture *thePicture)
{
	RECT destinationRect;
	destinationRect.left=x;
	destinationRect.top=y;
	destinationRect.right=x+thePicture->width;
	destinationRect.top=y+thePicture->height;
	RECT sourceRect;
	sourceRect.left=0;
	sourceRect.top=0;
	sourceRect.right=thePicture->width-1;
	sourceRect.top=thePicture->height-1;


	if (FAILED(lpBackBuffer->Blt(&destinationRect, thePicture->lpTheSurface, &sourceRect, (DDBLT_WAIT | DDBLT_KEYSRC),NULL)))
	{
		  OutputDebugString("Blit failed\n");
		  return FAILURE;
	}

	return SUCCESS;
}


// **************************************************************

inline ErrorType MyDrawEngine::DrawPoint(int x1, int y1, int colour)
{
	videoAddress[x1+y1*memoryPitch]=colour;
	return SUCCESS;
}


#endif