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


#include <stdlib.h>
#include <stdio.h>
#include "jpeg\jinclude.h"
#include "jpeg\jpeglib.h"

int jpegload(char *cpFileName, unsigned short *uspWidth, unsigned short *uspHeight, unsigned char **ucpImageData) {

  struct jpeg_decompress_struct jdsInfo;
  struct jpeg_error_mgr jemError;

  JSAMPARRAY jsaTmpBuffer;
  unsigned long ulOffset, ulDataWidth;
  unsigned short i;

  FILE *fInput;

  fInput = fopen(cpFileName, "rb");
  if(fInput == NULL) {
 	  return(-1);
  }

  jdsInfo.err = jpeg_std_error(&jemError);
  jpeg_create_decompress(&jdsInfo);
  jpeg_stdio_src(&jdsInfo, fInput);
  jpeg_read_header(&jdsInfo, TRUE);
  jpeg_start_decompress(&jdsInfo);


  *uspWidth = (unsigned short) jdsInfo.output_width;
  *uspHeight = (unsigned short) jdsInfo.output_height;
  ulDataWidth = jdsInfo.output_width * jdsInfo.output_components;

  *ucpImageData = (unsigned char *) malloc(ulDataWidth * (*uspHeight));
  if(ucpImageData == NULL) {
      return(-2);
  }
  
  memset(*ucpImageData, 0, ulDataWidth * (*uspHeight));
  jsaTmpBuffer = (*jdsInfo.mem->alloc_sarray) ((j_common_ptr) &jdsInfo, JPOOL_IMAGE, ulDataWidth, 1);

  for(i = 0, ulOffset = 0; i < (*uspHeight); i++) {
    jpeg_read_scanlines(&jdsInfo, jsaTmpBuffer, 1); 
	memcpy((*ucpImageData + ulOffset), jsaTmpBuffer[0], ulDataWidth);
	ulOffset += ulDataWidth;
  }
  
  jpeg_finish_decompress(&jdsInfo);

  return(0);
}
