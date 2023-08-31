TOP=CMUgraphicsLib

CPPFLAGS = -I$(TOP) -I$(TOP)/png -I$(TOP)/jpeg -I$(TOP)/png/zlib/
CFLAGS = -O6
CC = gcc
CXX = g++
AR = ar rcs
RANLIB = ranlib

JPEG_OBJECTS = \
$(TOP)/jpeg/jcparam.o $(TOP)/jpeg/jdapimin.o $(TOP)/jpeg/jdapistd.o \
$(TOP)/jpeg/jdatasrc.o $(TOP)/jpeg/jdcoefct.o $(TOP)/jpeg/jdcolor.o \
$(TOP)/jpeg/jddctmgr.o $(TOP)/jpeg/jdhuff.o $(TOP)/jpeg/jdinput.o $(TOP)/jpeg/jdmainct.o \
$(TOP)/jpeg/jdmarker.o $(TOP)/jpeg/jdmaster.o $(TOP)/jpeg/jdmerge.o $(TOP)/jpeg/jdphuff.o \
$(TOP)/jpeg/jdpostct.o $(TOP)/jpeg/jdsample.o $(TOP)/jpeg/jdtrans.o $(TOP)/jpeg/jerror.o \
$(TOP)/jpeg/jidctflt.o $(TOP)/jpeg/jidctfst.o $(TOP)/jpeg/jidctint.o \
$(TOP)/jpeg/jidctred.o $(TOP)/jpeg/jmemmgr.o $(TOP)/jpeg/jmemnobs.o $(TOP)/jpeg/jquant1.o \
$(TOP)/jpeg/jquant2.o $(TOP)/jpeg/jutils.o $(TOP)/jpeg/jcomapi.o $(TOP)/jpeg/jctrans.o \
$(TOP)/jpeg/jccoefct.o $(TOP)/jpeg/jccolor.o $(TOP)/jpeg/jcdctmgr.o $(TOP)/jpeg/jchuff.o \
$(TOP)/jpeg/jcinit.o $(TOP)/jpeg/jcmainct.o $(TOP)/jpeg/jcmarker.o \
$(TOP)/jpeg/jcmaster.o $(TOP)/jpeg/jcphuff.o $(TOP)/jpeg/jcprepct.o $(TOP)/jpeg/jcsample.o \
$(TOP)/jpeg/jcapistd.o $(TOP)/jpeg/jcapimin.o $(TOP)/jpeg/jdatadst.o $(TOP)/jpeg/jfdctflt.o \
$(TOP)/jpeg/jfdctfst.o $(TOP)/jpeg/jfdctint.o

ZLIB_OBJECTS = \
$(TOP)/png/zlib/compress.o $(TOP)/png/zlib/crc32.o $(TOP)/png/zlib/deflate.o $(TOP)/png/zlib/gzio.o \
$(TOP)/png/zlib/infblock.o $(TOP)/png/zlib/infcodes.o $(TOP)/png/zlib/inffast.o \
$(TOP)/png/zlib/inflate.o $(TOP)/png/zlib/inftrees.o $(TOP)/png/zlib/infutil.o \
$(TOP)/png/zlib/trees.o $(TOP)/png/zlib/uncompr.o \
$(TOP)/png/zlib/zutil.o $(TOP)/png/zlib/adler32.o

PNG_OBJECTS = \
$(TOP)/png/pngwutil.o $(TOP)/png/pngerror.o $(TOP)/png/pnggccrd.o $(TOP)/png/pngget.o \
$(TOP)/png/pngmem.o $(TOP)/png/pngpread.o $(TOP)/png/pngread.o $(TOP)/png/pngrio.o \
$(TOP)/png/pngrtran.o $(TOP)/png/pngrutil.o $(TOP)/png/pngset.o $(TOP)/png/pngtrans.o \
$(TOP)/png/pngvcrd.o $(TOP)/png/pngwio.o $(TOP)/png/pngwrite.o $(TOP)/png/pngwtran.o \
$(TOP)/png/png.o 

OBJECTS = $(TOP)/auxil.o $(TOP)/colors.o $(TOP)/errorlib.o $(TOP)/image.o $(TOP)/window.o

all: libcmugraphics.a

%.o : %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

%.o : %.cpp
	$(CXX) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

libcmugraphics.a: $(OBJECTS) $(JPEG_OBJECTS) $(ZLIB_OBJECTS) $(PNG_OBJECTS)
	$(AR) $@ $(OBJECTS) $(JPEG_OBJECTS) $(ZLIB_OBJECTS) $(PNG_OBJECTS)
	$(RANLIB) $@

clean:
	del /S *.o
	del /S *.a

$(TOP)/cmugraphics.h: $(TOP)/colors.h
$(TOP)/auxil.o: $(TOP)/cmugraphics.h
$(TOP)/colors.o: $(TOP)/cmugraphics.h
$(TOP)/errorlib.o: $(TOP)/cmugraphics.h
$(TOP)/image.o: $(TOP)/cmugraphics.h $(TOP)/jpeg/jpeglib.h $(TOP)/png/png.h
$(TOP)/window.o: $(TOP)/cmugraphics.h

