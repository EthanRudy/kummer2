// mypicture.cpp	Version 7		8/12/03
// The definition file for the methods in MyPicture, declared in mypicture.h


#include "Mypicture.h"
#include "mydrawengine.h"

#define BITMAP_ID 0x4D42
#define MAX_COLORS_PALETTE 256

// *****************************************************************

MyPicture::MyPicture(MyDrawEngine* theDrawEngine)
{	
	lpTheSurface=NULL;
	this->lpdd=theDrawEngine->lpdd;
}

MyPicture::~MyPicture()
{
	// Make sure memory and ddraw have been released
	if (lpTheSurface)
	{
		lpTheSurface->Release();
	}
}

void MyPicture::Release()
{ 
	// Set everything to zero or null
	height=0;
	width=0;
	lpdd=NULL;

	// If it is still valid, release the surface
	if (lpTheSurface)
	{
		lpTheSurface->Release();
		lpTheSurface=NULL;
	}
}

ErrorType MyPicture::LoadBitmap(char *pszFilename, int flags)
{
	HBITMAP hbm;
	BITMAP bmInfo;
	DDSURFACEDESC ddsd;
	HDC hdcImage = NULL;
	HDC surfaceDC = NULL;

	flags=0;

	// Load an image from file to a bitmap handle
	hbm = (HBITMAP)LoadImage(GetModuleHandle(NULL), pszFilename, IMAGE_BITMAP, 0,0, LR_LOADFROMFILE|LR_CREATEDIBSECTION);

	// If it didn't load, bug out.
	if (hbm == NULL)
	{
		  OutputDebugString("File didn't load\n");
		  return FAILURE;
	}

	// Put the info about the bitmap into a struct
	GetObject(hbm,sizeof(bmInfo),&bmInfo);

	// Select Image into a device context

	hdcImage = CreateCompatibleDC(NULL);

	if(hdcImage == NULL)
	{
		  OutputDebugString("Couldn't create DC\n");
		  return FAILURE;
	}


	SelectObject(hdcImage, hbm);

	// now to create the DDraw surface so I can load the image onto it
	
	this->height=bmInfo.bmHeight;
	this->width=bmInfo.bmWidth;



	// Fill in the order form
	memset(&ddsd,0,sizeof(ddsd));
	ddsd.dwSize = sizeof(ddsd);
	ddsd.dwFlags=DDSD_CAPS|DDSD_WIDTH|DDSD_HEIGHT;		// Set capablilties
	ddsd.dwHeight	=this->height;						// Set height
	ddsd.dwWidth	=this->width;						// Set width
	ddsd.ddsCaps.dwCaps=DDSCAPS_OFFSCREENPLAIN|flags;	// Set as offscreen surface, also any
														// flags requested by call - such as
														// a request for video memory storage

	// Create the surface

	int err;
	(err=(lpdd->CreateSurface(&ddsd, &lpTheSurface, NULL)));
	if (err!=DD_OK)
	{
		  OutputDebugString("Couldn't create theSurface\n");
		  if (err==DDERR_INVALIDOBJECT)
			  	OutputDebugString("Invalid object\n");
		  if (err==DDERR_INVALIDCAPS)
			  	OutputDebugString("Invalid caps\n");
		  if (err==DDERR_INVALIDPARAMS)
			  	OutputDebugString("Invalid params\n");
		  if (err==DDERR_NOCOOPERATIVELEVELSET)
			  	OutputDebugString("Coops not set\n");

		  return FAILURE;
	}

	// Set colour key to 0
	DDCOLORKEY ddColourKey;
	ddColourKey.dwColorSpaceHighValue=0;
	ddColourKey.dwColorSpaceLowValue=0;

	lpTheSurface->SetColorKey(DDCKEY_SRCBLT, &ddColourKey);

	// Copy the bitmap info into it.

	if (FAILED(lpTheSurface->GetDC(&surfaceDC)))
	{
		  OutputDebugString("Couldn't get DC of bitmap\n");
		  return FAILURE;
	}


	StretchBlt(surfaceDC,0,0,width,height,hdcImage,0,0,width, height, SRCCOPY);
	lpTheSurface->ReleaseDC(surfaceDC);

	DeleteDC(hdcImage);

	return SUCCESS;
}

ErrorType MyPicture::MakeBlank(int width, int height, int flags)
{

	DDSURFACEDESC ddsd;				// An "order form" for the surface

	// create the DDraw surface
	
	this->height=height;
	this->width=width;

	// Fill in the order form
	memset(&ddsd,0,sizeof(ddsd));
	ddsd.dwSize = sizeof(ddsd);
	ddsd.dwFlags=DDSD_CAPS|DDSD_WIDTH|DDSD_HEIGHT;		// Set capablilties
	ddsd.dwHeight	=this->height;						// Set height
	ddsd.dwWidth	=this->width;						// Set width
	ddsd.ddsCaps.dwCaps=DDSCAPS_OFFSCREENPLAIN|flags;	// Set as offscreen surface, also any
														// flags requested by call - such as
														// a request for video memory storage
	// Create the surface

	int err;
	(err=(lpdd->CreateSurface(&ddsd, &lpTheSurface, NULL)));
	if (err!=DD_OK)
	{
		  OutputDebugString("Couldn't funk up theSurface\n");
		  if (err==DDERR_INVALIDOBJECT)
			  	OutputDebugString("Invalid object\n");
		  if (err==DDERR_INVALIDCAPS)
			  	OutputDebugString("Invalid caps\n");
		  if (err==DDERR_INVALIDPARAMS)
			  	OutputDebugString("Invalid params\n");
		  if (err==DDERR_NOCOOPERATIVELEVELSET)
			  	OutputDebugString("Coops not set\n");

		  return FAILURE;
	}

	// Set colour key to 0
	DDCOLORKEY ddColourKey;
	ddColourKey.dwColorSpaceHighValue=0;
	ddColourKey.dwColorSpaceLowValue=0;

	lpTheSurface->SetColorKey(DDCKEY_SRCBLT, &ddColourKey);

	// Blank the surface with black pixels

	RECT tempRect;
	tempRect.top=0;
	tempRect.bottom=height-1;
	tempRect.left=0;
	tempRect.right=width-1;

	FillRect(tempRect, 0);

	return SUCCESS;

}	// End function


ErrorType MyPicture::Blit(RECT& destinationRect, RECT& sourceRect, MyPicture *sourcePicture)
{
	// Adjust the sourceRect to make sure it does not go beyond the size of the sourcePicture
	if (sourceRect.left<0)	sourceRect.left		= 0;
	if (sourceRect.top<0)	sourceRect.top		= 0;
	if (sourceRect.right>=sourcePicture->width)		sourceRect.right	= sourcePicture->width -1;
	if (sourceRect.bottom>=sourcePicture->height)	sourceRect.bottom	= sourcePicture->height -1;

	// Adjust the destinationRect to make sure it does not go beyond the size of this MyPicture	
	if (destinationRect.left<0) destinationRect.left=0;
	if (destinationRect.top<0) destinationRect.top=0;
	if (destinationRect.right<=0) destinationRect.right=width-1;
	if (destinationRect.bottom<=0) destinationRect.bottom=height-1;

	// Attempt to blit and return failure if DDraw reports failure
	if (FAILED(lpTheSurface->Blt(&destinationRect, sourcePicture->lpTheSurface, &sourceRect, (DDBLT_WAIT | DDBLT_KEYSRC),NULL)))
	{
		  OutputDebugString("Blit failed\n");
		  return FAILURE;
	}

	return SUCCESS;
}	// End function




ErrorType MyPicture::FillRect(RECT& destinationRect, int colour)
{
	// to do: clip this rectangle - or is it done by the DDclipper?

	DDBLTFX ddbltfx;	// FX order form

	memset(&ddbltfx,0,sizeof(ddbltfx));
	ddbltfx.dwSize=sizeof(ddbltfx);


	// set FX to the colour requested
	ddbltfx.dwFillColor = colour; 


	// Fill in the surface
	lpTheSurface->Blt(&destinationRect, 
			   NULL,							// nothing to copy from            
			   NULL,							// nothing to copy from
			   DDBLT_COLORFILL | DDBLT_WAIT,	// fill and wait for complete
			   &ddbltfx);						// the order form

	return SUCCESS;
}	// End function

