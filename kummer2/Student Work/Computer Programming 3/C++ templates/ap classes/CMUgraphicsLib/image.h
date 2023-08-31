/* 

CMUgraphics Package 1.1 
Copyright (c) 1998 by Geoff Washburn.  All rights reserved.

Please send all bug reports via e-mail to Mark Stehlik at 
'mjs@cs.cmu.edu'.

Redistribution and use in source and binary forms of this library, 
with or without modification, are permitted provided that the 
following conditions are met:
 
  1. Redistribution of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
  2. Redistribution in binary form must reproduce the above 
     copyright notice, this list of conditions and the following 
     disclaimer in the documentation and/or other materials 
     provided with the distribution.
  3. When redistributing a modified version of this library it must 
     carry prominent notices stating the name of individual(s) that 
     altered the files, the nature of the modifications, and the 
     date they were performed.
  4. No fee is charged for redistribution or use without prior 
     written permission from the author.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS 
OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY 
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;  OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

This code is not yet certified for mission critical applications,
such as navigation and/or control of aircraft.

This file was last modified on 10.11.1998

*/

#ifndef IMAGE_H
#define IMAGE_H

#include <string>

// Needed in Visual C++ and CodeWarrior 3
using namespace std;

#include <windows.h>

// Can currently only handle one image format
enum imagetype {
	JPEG,
	SCREEN
};

class image {

  private:
    // Height and width of the image
	unsigned short usHeight, usWidth;
	
	// The image data
    unsigned char *ucpImageData;
    
    // Transparent color info -- currently not used
	unsigned char ucTransRed, ucTransGreen, ucTransBlue;
	
	// The file format this image was created from
	imagetype itType;

    // Windows API stuff
	BITMAPINFO *bmiImage;
	HDC dcTempBuffer;
	HBITMAP bmapTempBuffer;

    // Transparency?
	int iTransparent;

    // Allow the window class to get at us
	friend class window;

  public:
  
    image();
	image(string strFileName, imagetype itThisType = JPEG);
    image(char *cpFileName, imagetype itThisType = JPEG);
	~image();
	
	// Open an image file, currently the only value imagetype is 
	// JPEG
	void Open(string strFileName, imagetype itThisType = JPEG);
	void Open(char *cpFileName, imagetype itThisType = JPEG);
	
	// Find out the dimensions of our image
	unsigned long GetWidth() { return usWidth; }
	unsigned long GetHeight() { return usHeight; }

    // Copy images 
    void operator=(image &imgOther); 
    
    // Possible, but a bad idea... Maybe use as an example of
    // why passing by value for large data structures is bad.
    image(image &imgOther);


};

#endif