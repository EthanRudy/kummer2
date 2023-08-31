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

#include <iostream>

#include "error.h"
#include "image.h"
#include "jpegload.h"

  
image::image() {

	bmiImage = NULL;
    ucpImageData = NULL;

    usWidth = 0;
    usHeight = 0;    

}  
  
image::image(string strFileName, imagetype itThisType) {

    image((char *) strFileName.c_str(), itThisType);
}

image::image(char *cpFileName, imagetype itThisType) {

	bmiImage = NULL;
    ucpImageData = NULL;
    
    Open(cpFileName, itThisType);
    
}

image::~image() {

	if(bmiImage != NULL) {
	    delete [] bmiImage;
	}
     
    if(ucpImageData != NULL) {
        delete [] ucpImageData;
    }
}

void image::Open(string strFileName, imagetype itThisType) {

    Open((char *) strFileName.c_str(), itThisType);

}

void image::Open(char *cpFileName, imagetype itThisType) {

	unsigned long i, j;
	unsigned char *ucpTmp;
	int iErrorCode;
	
    itType = itThisType;

	if(bmiImage != NULL) {
	    delete [] bmiImage;
	}

    if(ucpImageData != NULL) {
        delete [] ucpImageData;
    }
 
	bmiImage = (LPBITMAPINFO) new BYTE[sizeof(BITMAPINFOHEADER)];
	if(bmiImage == NULL) {
        throw OUT_OF_MEMORY;
	}

	memset(bmiImage, 0, sizeof(BITMAPINFOHEADER));
	
	bmiImage->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiImage->bmiHeader.biPlanes = 1;
	bmiImage->bmiHeader.biBitCount = 32;
	bmiImage->bmiHeader.biCompression = BI_RGB;
	bmiImage->bmiHeader.biSizeImage = 0;
	bmiImage->bmiHeader.biClrUsed = 0;
	bmiImage->bmiHeader.biClrImportant = 0;

    if(itType == JPEG) {
        iErrorCode = jpegload(cpFileName, &usWidth, &usHeight, &ucpTmp);
        if(iErrorCode == -1) {
            throw FILE_NOT_FOUND;
        } else if(iErrorCode == -2) {
            delete [] bmiImage;
            throw OUT_OF_MEMORY;          
        }

		bmiImage->bmiHeader.biWidth = usWidth;
		bmiImage->bmiHeader.biHeight = -usHeight;
	
		ucpImageData = new unsigned char[(usWidth * 4) * usHeight];
		if(ucpImageData == NULL) {
   		    throw OUT_OF_MEMORY;
		}

        for(i = 0, j = 0; i < ((usWidth * 3) * usHeight); i += 3, j += 4) {
		    ucpImageData[j] = ucpTmp[i + 2];
		    ucpImageData[j + 1] = ucpTmp[i + 1];
			ucpImageData[j + 2] = ucpTmp[i];
			ucpImageData[j + 3] = 0;
		}

		free(ucpTmp);

		ucTransRed = 0;
		ucTransGreen = 0;
		ucTransBlue = 0;

	} else {
	
	    cout << "Fatal Error: Unsupported image type!" << endl;
	
	}

}

void image::operator=(image &imgOther) {

	bmiImage = (LPBITMAPINFO) new BYTE[sizeof(BITMAPINFOHEADER)];
	if(bmiImage == NULL) {
        throw OUT_OF_MEMORY;
	}
	
	memset(bmiImage, 0, sizeof(BITMAPINFOHEADER));	
	
	bmiImage->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiImage->bmiHeader.biPlanes = 1;
	bmiImage->bmiHeader.biBitCount = 32;
	bmiImage->bmiHeader.biCompression = BI_RGB;
	bmiImage->bmiHeader.biSizeImage = 0;
	bmiImage->bmiHeader.biClrUsed = 0;
	bmiImage->bmiHeader.biClrImportant = 0;

    usWidth = imgOther.usWidth;
    usHeight = imgOther.usHeight;

    bmiImage->bmiHeader.biWidth = usWidth;
	bmiImage->bmiHeader.biHeight = -usHeight;

    ucpImageData = new unsigned char[(usWidth * 4) * usHeight]; 
    if(ucpImageData == NULL) {
   	    throw OUT_OF_MEMORY;
	}
    
    memcpy(ucpImageData, imgOther.ucpImageData, (unsigned int) (usWidth * 4) * usHeight);

}

image::image(image &imgOther) {

	bmiImage = (LPBITMAPINFO) new BYTE[sizeof(BITMAPINFOHEADER)];
	if(bmiImage == NULL) {
        throw OUT_OF_MEMORY;
	}
	
    memset(bmiImage, 0, sizeof(BITMAPINFOHEADER));
	
	bmiImage->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiImage->bmiHeader.biPlanes = 1;
	bmiImage->bmiHeader.biBitCount = 32;
	bmiImage->bmiHeader.biCompression = BI_RGB;
	bmiImage->bmiHeader.biSizeImage = 0;
	bmiImage->bmiHeader.biClrUsed = 0;
	bmiImage->bmiHeader.biClrImportant = 0;

    usWidth = imgOther.usWidth;
    usHeight = imgOther.usHeight;

    bmiImage->bmiHeader.biWidth = usWidth;
	bmiImage->bmiHeader.biHeight = -usHeight;

    ucpImageData = new unsigned char[(usWidth * 4) * usHeight]; 
    if(ucpImageData == NULL) {
   	    throw OUT_OF_MEMORY;
	}
    
    memcpy(ucpImageData, imgOther.ucpImageData, (unsigned int) (usWidth * 4) * usHeight);

}