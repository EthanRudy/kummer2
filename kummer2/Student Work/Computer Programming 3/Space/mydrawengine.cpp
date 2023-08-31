// mydrawengine.cpp		Version 7		8/12/03
// The definition file for the methods in MyDrawEngine - declared in mydrawengine.h


#include "mydrawengine.h"


// Constructor ********************************************************


MyDrawEngine::MyDrawEngine(int width, int height, int bitsPerPixel, HWND hwnd)
{
	DDSCAPS ddsCaps;			// Generic surface capabilities struct
	LPDIRECTDRAWSURFACE tempprimarysurface;

	colourDepth = bitsPerPixel;

	// to do: add defensive programming

	LPDIRECTDRAW lpdd1 = NULL; // used to get directdraw1

	// create IDirectDrawdirectdraw version 1
	DirectDrawCreate(NULL,&lpdd1,NULL);

	// use it to get version 2 
	lpdd1->QueryInterface(IID_IDirectDraw2,(LPVOID *)&lpdd);

	// set cooperation level 
	lpdd->SetCooperativeLevel(hwnd,
			  DDSCL_ALLOWMODEX | DDSCL_FULLSCREEN | 
			  DDSCL_EXCLUSIVE | DDSCL_ALLOWREBOOT);

	// set display mode
	lpdd->SetDisplayMode(width,height,colourDepth,0,0);

	// set class attributes
	screenHeight = height;
	screenHeight = width;

	// Create the primary surface

	// First, make out an "order form" for the surface
	memset(&ddsd,0,sizeof(ddsd));
	ddsd.dwSize = sizeof(ddsd);
	ddsd.dwFlags = DDSD_CAPS | DDSD_BACKBUFFERCOUNT;

	ddsd.ddsCaps.dwCaps = DDSCAPS_PRIMARYSURFACE | DDSCAPS_FLIP | DDSCAPS_COMPLEX;

	ddsd.dwBackBufferCount = 1;

	// Now get the primarySurface
	lpdd->CreateSurface(&ddsd,&tempprimarysurface,NULL);
	tempprimarysurface->QueryInterface(IID_IDirectDrawSurface2,(LPVOID*)&lpPrimarySurface);

	// Now get the buffer
	ddsCaps.dwCaps = DDSCAPS_BACKBUFFER;
	lpPrimarySurface->GetAttachedSurface(&ddsCaps,&lpBackBuffer);

	// clear primary and secondary surfaces
	ClearBackBuffer();
	Flip();
	ClearBackBuffer();

	// Make video address null

	videoAddress=NULL;
	memoryPitch=0;

	numClipRects=0;								// No clipping rectangles yet
	memset(&clipRect[0],0,sizeof(clipRect));	// Initialise the rectangles
}

// *******************************************************************

MyDrawEngine::~MyDrawEngine()
{
	// Just make damn sure that directx is released

	Release();
}

// *******************************************************************

ErrorType MyDrawEngine::ClearBackBuffer()
{
	DDBLTFX ddbltfx; // FX order form

	// clear out the structure and set the size field 
	memset(&ddbltfx,0,sizeof(ddbltfx));
	ddbltfx.dwSize=sizeof(ddbltfx);

	// Put colour wanted in order form
	ddbltfx.dwFillColor = 0; 


	if (FAILED (lpBackBuffer->Blt(NULL,			// no destination - all
			   NULL,							// no source           
			   NULL,							// no source
			   DDBLT_COLORFILL | DDBLT_WAIT,	// fill and wait                   
			   &ddbltfx)))						// order form
			   return FAILURE;

	return SUCCESS;
}



// *****************************************************************

ErrorType MyDrawEngine::Flip()
{
	// To do - defensive programming
	// flip pages
	while(FAILED(lpPrimarySurface->Flip(NULL, DDFLIP_WAIT)));

	return SUCCESS;

}

// ******************************************************************

ErrorType MyDrawEngine::LockBackSurface()
{

	if (!lpBackBuffer)
	   return FAILURE;

	// lock the surface
	memset(&ddsd,0,sizeof(ddsd));
	ddsd.dwSize=sizeof(ddsd);

	if FAILED(lpBackBuffer->Lock(NULL,&ddsd,DDLOCK_WAIT | DDLOCK_SURFACEMEMORYPTR,NULL))
		return FAILURE;

	videoAddress = (USHORT*)ddsd.lpSurface;
	memoryPitch = ddsd.lPitch>>1;
	
	return SUCCESS;
}

// ********************************************************************

ErrorType MyDrawEngine::Release()
{

// release the secondary surface
if (lpBackBuffer)
    lpBackBuffer->Release();

// release the primary surface
if (lpPrimarySurface)
   lpPrimarySurface->Release();

// finally, the main dd object
if (lpdd)
    lpdd->Release();

// return success
return SUCCESS;
}

// ****************************************************************


ErrorType MyDrawEngine::UnlockBackSurface()
{

	// check actually exists
	if (!lpBackBuffer)
	   return FAILURE;

	// unlock it
	if FAILED(lpBackBuffer->Unlock(NULL))
		return FAILURE;

	// return success
	return SUCCESS;
}

// ****************************************************************


ErrorType MyDrawEngine::Validate()
{
	if (FAILED(lpPrimarySurface->IsLost()))		// See if primary surface is lost
	{	
		if(FAILED(lpPrimarySurface->Restore()))	// Try to reaquire
			return FAILURE;						// If it is still postal
		else
			return SUCCESS;						// If it recovered
	}
	return SUCCESS;								// If it never went away
}


// ***************************************************************

ErrorType MyDrawEngine::SetClipper(int numRects, LPRECT clipList)
{
	int i;								// For loops
	LPDIRECTDRAWCLIPPER theDDClipper;	// The DirectDraw clipper
	LPRGNDATA regionData;				// Pointer to region data

	// Create the clipper, and if it fails, return zero
	if (FAILED(lpdd->CreateClipper(0,&theDDClipper,NULL)))
		return FAILURE;

	// Allocate some memory for the region data, and store location in regionData
	regionData = (LPRGNDATA)malloc(sizeof(RGNDATAHEADER)+numRects*sizeof(RECT));

	// Copy the rects into that memory area
	memcpy(regionData->Buffer, clipList, sizeof(RECT)*numRects);

	// Set up the header data in the regionData
	regionData->rdh.dwSize = sizeof(RGNDATAHEADER); // Set the size of the header
	regionData->rdh.iType  = RDH_RECTANGLES;		// Region stores data about rectangles
	regionData->rdh.nCount = numRects;				// Set number of regions
	regionData->rdh.nRgnSize = numRects*sizeof(RECT);	// Storing the size of the region data

	// Set some impossible bounding values for the regionData's bounding box
	regionData->rdh.rcBound.left   =  50000;
	regionData->rdh.rcBound.right  = -50000;
	regionData->rdh.rcBound.top	   =  50000;
	regionData->rdh.rcBound.bottom = -50000;

	// Now cycle through the rects sent to refine these values, so that they
	//  specify a box that surrounds all the individual rects
	for (i=0;i<numRects;i++)
	{
		if (clipList[i].left < regionData->rdh.rcBound.left)
			regionData->rdh.rcBound.left = clipList[i].left;
		if (clipList[i].right > regionData->rdh.rcBound.right)
			regionData->rdh.rcBound.right = clipList[i].right;
		if (clipList[i].top < regionData->rdh.rcBound.top)
			regionData->rdh.rcBound.top = clipList[i].top;
		if (clipList[i].bottom > regionData->rdh.rcBound.bottom)
			regionData->rdh.rcBound.bottom = clipList[i].bottom;
	}

	// Set the clip list (and return error if failed)
	if FAILED(theDDClipper->SetClipList(regionData,0))
	{
		free(regionData);
		return FAILURE;
	}

	// Attach clipper to the surface
	if FAILED(lpBackBuffer->SetClipper(theDDClipper))
	{
		free(regionData);
		return FAILURE;
	}

	// All done
	free(regionData);
	return SUCCESS;
}	

// ****************************************************************





