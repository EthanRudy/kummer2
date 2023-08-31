// MySurface.h Specification for the class MySurface

// Chris Rook

// version 3 4/2/02

// Inline functions corrected
// Blit and FillRect changed to pass-by-reference

#ifndef mypicture_h
#define mypicture_h

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
#include "errortype.h"

class MyDrawEngine;


// Macros ****************************************************

// Class Spec ************************************************

class MyPicture
{
	friend MyDrawEngine;				// So that MyDrawEngine can access the lpTheSurface attribute

private:
	IDirectDraw2* lpdd;
	LPDIRECTDRAWSURFACE lpTheSurface;	// The surface that MyPicture encapsulates

public:

// Public attributes
	int width;				// The width of the image (after loading)
	int height;				// The height of the image (after loading)

// Public methods

	MyPicture(MyDrawEngine* theDrawEngine);
	// Precondition:
	//	lpdd points to an initialised instance of Direct Draw
	//  DirectX version 4.0 or above is installed on the computer
	// Postcondition
	//  A secondary surface is created. lpTheSurface points to it.


	~MyPicture();

	ErrorType LoadBitmap(char* pszFilename, int flags=NULL);
	// Loads a bitmap with the specified filename into the MyPicture
	// Preconditions:
	//	If the MyPicture already holds an image, or a blank image, the dimesions
	//  of both the existing image and the image to be loaded must match.
	// Postcondition:
	//  The image in the file is loaded into the MyPicture object or FAILURE will have been returned
	// Parameters:
	//	pszFilename - a string containing the filename of the bitmap to be loaded
	//  flags - any flags that you wish to pass onto the directDrawSurfaceDescriptor.
	//		Normally leave blank for defaults. Use "DDSCAPS_SYSTEMMEMORY to specify creation in system memory
	//		Use "DDSCAPS_VIDEOMEMORY" to insist on creation in video memory.
	// Returns:
	//  SUCCESS if file loaded successfully
	//  FAILURE if file failed to load (file not found, file wrong format)

	ErrorType MakeBlank(int width, int height, int flags=NULL);

	// Loads the MyPicture with a blank image of the size specified.
	// The image will be entirely of colour zero.
	// Preconditions:
	//	If the MyPicture already holds an image, or a blank image, the dimesions
	//  of both the existing image and the blank image to be created must match.
	// Postcondition:
	//  A blank (0) image of the specified dimensions has been created in the MyPicture or
	//	FAILURE will have been returned
	// Parameters:
	//	width - the width of the image to be created, in pixels
	//	height - the height of the image to be created, in pixels
	//  flags - any flags that you wish to pass onto the directDrawSurfaceDescriptor.
	//		Normally leave blank for defaults. Use "DDSCAPS_SYSTEMMEMORY to specify creation in system memory
	//		Use "DDSCAPS_VIDEOMEMORY" to insist on creation in video memory.
	// Returns:
	//  SUCCESS if blank image created successfully
	//  FAILURE if failed to create blank image

	ErrorType Blit(RECT& destinationRect, RECT& sourceRect, MyPicture *sourcePicture);
	// Draws another MyPicture onto this MyPicture
	// Preconditions:
	//	Not fully tested. Not sure how it will behave if the destinationRect goes off
	//	the edge of the current picture.
	//	The MyPicture and the sourcePicture must contain an image, either using MakeBlank,
	//	or LoadBitmap.
	// Postconditions:
	//  The image from sourcePicture will be drawn onto this MyPicture using the specified
	//	destinationRect and sourceRect  or FAILURE will have been returned.
	// Parameters:
	//	destinationRect - The rectangle describing where to blit to.
	//	sourceRect - The rectangle describing where to blit from on the sourcePicture
	//  sourcePicture - The MyPicture to copy the image from
	// Returns:
	//  SUCCESS if blit performed successfully
	//  FAILURE if blit failed

	ErrorType FillRect(RECT& destinationRect, int colour);
	// Draws a rectangle of the specified colour onto this MyPicture
	// Preconditions:
	//	Not fully tested. Not sure how it will behave if the destinationRect goes off
	//	the edge of the current picture.
	//	The MyPicture must contain an image, either using MakeBlank,
	//	or LoadBitmap.
	// Postconditions:
	//  A rectangle will be drawn onto this MyPicture using the specified
	//	destinationRect and colour or FAILURE will have been returned.
	// Parameters:
	//	destinationRect - The rectangle describing where to blit to.
	//  colour - the colour in 565 RGB format of the rectangle to be drawn.
	// Returns:
	//  SUCCESS if blit performed successfully
	//  FAILURE if blit failed

	void Release();
	// Postcondition
	//  Releases memory and the DirectX surface
	//  lpdd set to NULL
	//  lpTheSurface set to NULL
	//	height an width are set to 0.
	// Returns:
	//  SUCCESS if lpTheSurface was previously initialised
	//  FAILURE if lpTheSurface was not previously initialised

};




#endif