/* 
See "CMUgraphics.h" for version info and copyright information
This file was last modified on 09.09.2000
*/

#include <cstdio>
#include <cstdlib>
#include <iostream>

using namespace std;

#include <CMUgraphics.h>

// To prevent redefinition of INT32
#define IMAGE_CPP

extern "C" {
#include <jpeglib.h>
}

#include <png.h>

image::image() : usWidth(0), usHeight(0), ucpImageData(NULL) {
}  
  
image::image(const string strFileName, const imagetype itThisType) :
	usWidth(0), usHeight(0), ucpImageData(NULL) {
    Open((char *) strFileName.c_str(), itThisType);
}

image::image(const char *cpFileName, const imagetype itThisType) : 
	usWidth(0), usHeight(0), ucpImageData(NULL) {
    
    if(cpFileName == NULL) {
      error(FILE_NOT_FOUND, "NULL filename passed to image constructor!");
      return;
    }
    
    Open(cpFileName, itThisType);
    
}

image::~image() {

   if(ucpImageData != NULL) {
        delete [] ucpImageData;
    }
}

bool image::Valid() const {
  return (ucpImageData != NULL);
}

unsigned short image::GetWidth() const { return usWidth; }
unsigned short image::GetHeight() const { return usHeight; }

void image::Open(const string strFileName, const imagetype itThisType) {
    Open((char *) strFileName.c_str(), itThisType);
}

void image::Open(const char *cpFileName, const imagetype itThisType) {

	unsigned long i, j;
	unsigned char *ucpTmp;
	
	if(cpFileName == NULL) {
      error(FILE_NOT_FOUND, "NULL, filename passed to Open!");
      ucpImageData = NULL;
      return;
    }
    
    itType = itThisType;

    if(ucpImageData != NULL) {
        delete [] ucpImageData;
    }
 
 
    if(itType == JPEG) {
        ucpTmp = jpegload(cpFileName, usWidth, usHeight);
        if(ucpTmp == NULL) {
            ucpImageData = NULL;
        	return;
        }
	
		ucpImageData = new unsigned char[(usWidth * 4) * usHeight];
		if(ucpImageData == NULL) {
   		    error(OUT_OF_MEMORY, "Could not allocate enough memory for temporary storage in image Open!");
   		    return;
		}

        for(i = 0, j = 0; i < ((usWidth * 3) * usHeight); i += 3, j += 4) {
		    ucpImageData[j] = ucpTmp[i + 2];
		    ucpImageData[j + 1] = ucpTmp[i + 1];
			ucpImageData[j + 2] = ucpTmp[i];
			ucpImageData[j + 3] = 0;
		}

		delete [] ucpTmp;


	} else if(itType == PNG) {

		ucpTmp = pngload(cpFileName, usWidth, usHeight);
		if(ucpTmp == NULL) {
		    ucpImageData = NULL;
			return;
	    }
	
		ucpImageData = new unsigned char[(usWidth * 4) * usHeight];
		if(ucpImageData == NULL) {
   		    error(OUT_OF_MEMORY, "Could not allocate enough memory for temporary storage in image Open!");
   		    return;
		}

        for(i = 0; i < ((usWidth * 4) * usHeight); i += 4) {
		    ucpImageData[i] = ucpTmp[i + 2];
		    ucpImageData[i + 1] = ucpTmp[i + 1];
			ucpImageData[i + 2] = ucpTmp[i];
			ucpImageData[i + 3] = ucpTmp[i + 3];
		}

		delete [] ucpTmp;
	
	} else {
	    error(USER, "Tried to load unsupported image type!");
	    ucpImageData = NULL;
	    return;
	}

}

void image::Save(const string strFileName, const imagetype itThisType) const {
    Save((char *) strFileName.c_str(), itThisType);
}

void image::Save(const char *cpFileName, const imagetype itThisType) const {

  unsigned long i, j;
  unsigned char* ucpTemp = new unsigned char[(usWidth * 3) * usHeight];
  
  for(i = 0, j = 0; i < ((usWidth * 3) * usHeight); i += 3, j+=4) {
    ucpTemp[i] = ucpImageData[j + 2];
    ucpTemp[i+1] = ucpImageData[j + 1];
    ucpTemp[i+2] = ucpImageData[j];
  }  

  if(itThisType == JPEG) {
  	jpegsave(cpFileName, usWidth, usHeight, ucpTemp);
  } else if (itThisType == PNG) {
  	pngsave(cpFileName, usWidth, usHeight, ucpTemp);
  } else {
	error(USER, "Tried to save as an unsupported image type!");
	return;
  }
  
  delete [] ucpTemp;
}


void image::operator=(const image &imgOther) {

    itType = imgOther.itType;

    usWidth = imgOther.usWidth;
    usHeight = imgOther.usHeight;

	if(ucpImageData != NULL) {
		delete [] ucpImageData;
	}

    ucpImageData = new unsigned char[(usWidth * 4) * usHeight]; 
    if(ucpImageData == NULL) {
   	    error(OUT_OF_MEMORY, "Could not allocate enough memory for image assignment!");
   	    return;
	}
    
    memcpy(ucpImageData, 
    	   imgOther.ucpImageData, 
    	   static_cast<unsigned int>((usWidth * 4) * usHeight));

}

image::image(const image &imgOther) : 
	itType(imgOther.itType), 
	usWidth(imgOther.usWidth),
	usHeight(imgOther.usHeight) {

    ucpImageData = new unsigned char[(usWidth * 4) * usHeight]; 
    if(ucpImageData == NULL) {
   	    error(OUT_OF_MEMORY, "Could not allocate enough memory for image copy constructor!");
   	    return;
	}
    
    memcpy(ucpImageData, 
           imgOther.ucpImageData, 
           static_cast<unsigned int>((usWidth * 4) * usHeight));

}

unsigned char* image::jpegload(const char *cpFileName, 
    							   unsigned short &usWidth,
    							   unsigned short &usHeight) {
    					
  if(cpFileName == NULL) { 
 	 error(SYSTEM, "Passed a NULL pointer for the filename in jpegload!");
 	 return NULL;
  }

  struct jpeg_decompress_struct jdsInfo;
  struct jpeg_error_mgr jemError;

  unsigned char* ucpImageData;

  JSAMPARRAY jsaTmpBuffer;
  unsigned long ulOffset, ulDataWidth;
  unsigned short i;

  FILE *fInput;

  fInput = fopen(cpFileName, "rb");
  if(fInput == NULL) {
    error(FILE_NOT_FOUND, string("The specified image file, ") + cpFileName + ", could not be found!");
    return NULL;
  }

  jdsInfo.err = jpeg_std_error(&jemError);
  jpeg_create_decompress(&jdsInfo);
  jpeg_stdio_src(&jdsInfo, fInput);
  jpeg_read_header(&jdsInfo, TRUE);
  jpeg_start_decompress(&jdsInfo);

  usWidth = static_cast<unsigned short>(jdsInfo.output_width);
  usHeight = static_cast<unsigned short>(jdsInfo.output_height);
  ulDataWidth = jdsInfo.output_width * jdsInfo.output_components;

  ucpImageData = new unsigned char[ulDataWidth * usHeight];
  if(ucpImageData == NULL) {
    error(OUT_OF_MEMORY, "Could not allocated enough temporary storage in jpegload!");
    return NULL;
  }
  
  memset(ucpImageData, static_cast<unsigned char>(0), ulDataWidth * usHeight);
  jsaTmpBuffer = (*jdsInfo.mem->alloc_sarray) ((j_common_ptr) &jdsInfo, JPOOL_IMAGE, ulDataWidth, 1);

  for(i = 0, ulOffset = 0; i < usHeight; i++) {
    jpeg_read_scanlines(&jdsInfo, jsaTmpBuffer, 1); 
    memcpy(ucpImageData + ulOffset, jsaTmpBuffer[0], ulDataWidth);
    ulOffset += ulDataWidth;
  }
  
  jpeg_finish_decompress(&jdsInfo);

  fclose(fInput);
  
  return ucpImageData;
}
    							   
unsigned char* image::pngload(const char *cpFileName, 
    						      unsigned short &usWidth,
    							  unsigned short &usHeight) {

  if(cpFileName == NULL) {
    error(SYSTEM, "Passed a null pointer for the filename in pngload!");  
    return NULL;
  }

  int number = 0;
  png_byte header[8];
  
  FILE *fp = fopen(cpFileName, "rb");
    if(!fp) {
      error(FILE_NOT_FOUND, string("Cannot open the specified image,") + cpFileName + ", in pngload!"); 
      return NULL;
    }
    fread(header, 1, number, fp);
    int is_png = !png_sig_cmp(header, 0, number);
    if (!is_png) {
      fclose(fp);
      error(FILE_NOT_FOUND, "Cannot of the specified image in pngload!"); 
      return NULL;
    }

  png_structp png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);

  if(!png_ptr) {
    fclose(fp);
    error(SYSTEM, "Could not create the necessary infrastructure to load the image in pngload!");
    return NULL;
  }

  png_infop info_ptr = png_create_info_struct(png_ptr);
  if(!info_ptr) {
    png_destroy_read_struct(&png_ptr, (png_infopp) NULL, (png_infopp) NULL);
    fclose(fp);
    error(SYSTEM, "Could not create the necessary infrastructure to load the image in pngload!");
    return NULL;
  }

  png_infop end_info = png_create_info_struct(png_ptr);
  if(!end_info) {
    png_destroy_read_struct(&png_ptr, (png_infopp) NULL, (png_infopp) NULL);
    fclose(fp);
    error(SYSTEM, "Could not create the necessary infrastructure to load the image in pngload!");
    return NULL;
  }

  if(setjmp(png_ptr->jmpbuf)) {
    png_destroy_read_struct(&png_ptr, &info_ptr, &end_info);
    fclose(fp);
    error(SYSTEM, "Could not create the necessary infrastructure to load the image in pngload!");
    return NULL;
  }

  png_init_io(png_ptr, fp);
  png_set_sig_bytes(png_ptr, number);
  
  png_read_info(png_ptr, info_ptr);
  
  png_uint_32 width, height, rowbytes;
  png_byte bit_depth, color_type;
  width = png_get_image_width(png_ptr, info_ptr);
  height = png_get_image_height(png_ptr, info_ptr);
  bit_depth = png_get_bit_depth(png_ptr, info_ptr);
  color_type = png_get_color_type(png_ptr, info_ptr);

  if(color_type == PNG_COLOR_TYPE_PALETTE && bit_depth <= 8) 
    png_set_palette_to_rgb(png_ptr);
  
  if(color_type == PNG_COLOR_TYPE_GRAY && bit_depth < 8) 
    png_set_gray_1_2_4_to_8(png_ptr);

  if(png_get_valid(png_ptr, info_ptr, PNG_INFO_tRNS))
    png_set_tRNS_to_alpha(png_ptr);

  if(bit_depth == 16)
    png_set_strip_16(png_ptr);

  if(color_type == PNG_COLOR_TYPE_GRAY || 
     color_type == PNG_COLOR_TYPE_GRAY_ALPHA)
    png_set_gray_to_rgb(png_ptr);

  if(bit_depth == 8 && color_type == PNG_COLOR_TYPE_RGB)
    png_set_filler(png_ptr, 255, PNG_FILLER_AFTER);

  if(color_type == PNG_COLOR_TYPE_PALETTE)
    png_set_filler(png_ptr, 255, PNG_FILLER_AFTER);

  png_read_update_info(png_ptr, info_ptr);

  rowbytes = png_get_rowbytes(png_ptr, info_ptr);

  png_bytep* row_pointers = new png_bytep[height];
  if(row_pointers == NULL) {
    error(OUT_OF_MEMORY, "Could not allocated enough temporary storge in pngload!");
    return NULL;
  }

  png_uint_32 i;
  for(i = 0; i < height; i++) {
    row_pointers[i] = new png_byte[rowbytes];
    if(row_pointers[i] == NULL) {
        error(OUT_OF_MEMORY, "Could not allocated enough temporary storge in pngload!");
        return NULL;
    }
  }

  png_read_image(png_ptr, row_pointers);

  unsigned char *ucpImageData = new unsigned char[rowbytes * height];
  if(ucpImageData == NULL) {
    error(OUT_OF_MEMORY, "Could not allocated enough temporary storge in pngload!");
    return NULL;
  }
  
  memset(ucpImageData, static_cast<unsigned char>(0), rowbytes * height);

  png_uint_32 offset = 0;
  for(i = 0; i < height; i++) {
    memcpy(ucpImageData + offset, row_pointers[i], rowbytes);
    offset += rowbytes;
  }
  
  usWidth = width;
  usHeight = height;

  png_destroy_read_struct(&png_ptr, &info_ptr, &end_info);

  fclose(fp);

  for(i = 0; i < height; i++) {
    delete [] row_pointers[i];
  }
  delete [] row_pointers;
  
  return ucpImageData;  
}
    							   
void image::jpegsave(const char *cpFileName, 
    				 const unsigned short usWidth,
    				 const unsigned short usHeight,
    				 unsigned char* ucpImageData) {

  if(cpFileName == NULL) {
    error(SYSTEM, "Passed a null pointer for the filename in jpegsave!");  
    return;
  }

  struct jpeg_compress_struct cinfo;
  struct jpeg_error_mgr jerr;

  FILE * outfile;		
  JSAMPROW row_pointer[1];
  int row_stride;	    

  cinfo.err = jpeg_std_error(&jerr);
  jpeg_create_compress(&cinfo);

  if ((outfile = fopen(cpFileName, "wb")) == NULL) {
    error(USER, "Could not open the specified file in jpegsave!");
    return;
  }
  jpeg_stdio_dest(&cinfo, outfile);

  cinfo.image_width = usWidth; 	
  cinfo.image_height = usHeight;
  cinfo.input_components = 3;		
  cinfo.in_color_space = JCS_RGB; 	

  jpeg_set_defaults(&cinfo);
  jpeg_set_quality(&cinfo, 100, TRUE);

  jpeg_start_compress(&cinfo, TRUE);

  row_stride = usWidth * 3;

  while (cinfo.next_scanline < cinfo.image_height) {
    row_pointer[0] = &ucpImageData[cinfo.next_scanline * row_stride];
    (void) jpeg_write_scanlines(&cinfo, row_pointer, 1);
  }

  jpeg_finish_compress(&cinfo);
  fclose(outfile);
  jpeg_destroy_compress(&cinfo);    				 
    				 
}
    							   
void image::pngsave(const char *cpFileName,
                    const unsigned short usWidth,
                    const unsigned short usHeight,
                    const unsigned char* ucpImageData) {

  if(cpFileName == NULL) {
    error(SYSTEM, "Passed a null pointer for the filename in pngsave!");  
    return;
  }
  
  FILE *fp = fopen(cpFileName, "wb");
  if(!fp) {
    error(USER, "Could not open the specified file in pngsave!");
    return;
  }

  png_structp png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, (png_voidp) NULL, NULL, NULL);
  if(!png_ptr) {
    fclose(fp);
	error(SYSTEM, "Could not create the necessary infrastructure in pngsave!");    
	return;
  }

  png_infop info_ptr = png_create_info_struct(png_ptr);
  if(!info_ptr) {
    png_destroy_write_struct(&png_ptr, (png_infop *) NULL);
    fclose(fp);
	error(SYSTEM, "Could not create the necessary infrastructure in pngsave!");    
	return;
  }

  if(setjmp(png_ptr->jmpbuf)) {
    png_destroy_write_struct(&png_ptr, &info_ptr);
    fclose(fp);
	error(SYSTEM, "Could not create the necessary infrastructure in pngsave!"); 
	return;
  }
  
  png_init_io(png_ptr, fp);

  png_set_filter(png_ptr, 0, PNG_FILTER_NONE);

  png_set_compression_level(png_ptr, Z_BEST_COMPRESSION);
  
  png_set_IHDR(png_ptr, info_ptr, usWidth, usHeight, static_cast<png_byte>(8), PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

  png_write_info(png_ptr, info_ptr);

  png_uint_32 rowbytes = usWidth * 3;

  png_bytep* row_pointers = new png_bytep[usHeight];
  if(row_pointers == NULL) {
    error(OUT_OF_MEMORY, "Could not allocated temporary storage space in pngsave!");
    return;
  }

  png_uint_32 i;  
  for(i = 0; i < usHeight; i++) {
    row_pointers[i] = new png_byte[rowbytes];
    if(row_pointers[i] == NULL) {
	    error(OUT_OF_MEMORY, "Could not allocated temporary storage space in pngsave!");
	    return;
	}
    memset(row_pointers[i], static_cast<unsigned char>(0), rowbytes);
  }

  png_uint_32 offset = 0;
  for(i = 0; i < usHeight; i++) {
      memcpy(row_pointers[i], ucpImageData + offset, rowbytes);
	  offset += rowbytes; 
  }

  png_write_image(png_ptr, row_pointers);
  
  png_write_end(png_ptr, info_ptr);
  png_destroy_write_struct(&png_ptr, &info_ptr);

  fclose(fp);

  for(i = 0; i < usHeight; i++) {
    delete [] row_pointers[i];
  }
  delete [] row_pointers;                    
}                    