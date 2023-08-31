// mysound.cpp	Version 7		8/12/03
// The definition file for the methods in MySound, declared in mysound.h



#include "mysound.h"
#include "mysoundengine.h"

#define DSBCAPS_CTRLDEFAULT 0x000000E0



MySound::MySound(MySoundEngine* theSoundEngine, char* pszFilename)
{
	lpSoundBuffer=NULL;

	DSBUFFERDESC dsbd;			// "Order form" for the sound
	WAVEFORMATEX formatdesc;	// Description of the format	
	HMMIO hWaveFile;		// Handle to the wave file
	MMCKINFO parent;		// A parent chunk (wav file data chunks)
	MMCKINFO child;			// A child chunk (wav file data chunks)

	UCHAR *tempBuffer;		// Pointer to a buffer to temporarily store sound
	UCHAR *tempPtr1;		// Pointer to first part of sound buffer
	UCHAR *tempPtr2;		// Pointer to second part of sound buffer
	DWORD length1;			// Length of first part of sound buffer
	DWORD length2;			// Length of second part of sound buffer

	// ***************************************************************
	// Most of what follows is some fairly complicated bits that
	// open a pcm wave file, and read the contents into the
	// directX buffer.

	// Chunk info initialised
 
	parent.ckid			= (FOURCC)0;
	parent.cksize		= 0;
	parent.fccType		= (FOURCC)0;
	parent.dwDataOffset	= 0;
	parent.dwFlags		= 0;

	child=parent;

	// Open the wav file

	hWaveFile = mmioOpen(pszFilename, NULL, MMIO_READ|MMIO_ALLOCBUF);	

	if (hWaveFile==NULL)			// If file could not open
	{
		return;
	}

	// Find the wave section
	// What is it with sound engineers? Is is because they are musicians
	// that they like using meaningless terms like "descend"?
	parent.fccType=mmioFOURCC('W','A','V','E');

	if (mmioDescend(hWaveFile, &parent, NULL, MMIO_FINDRIFF))
	{
		OutputDebugString("Couldn't find wave section in wave file ");
		OutputDebugString(pszFilename);
		OutputDebugString("\n");

		mmioClose(hWaveFile,0);			// Error - close the wave file
		return;
	}

	// Find the format section
	child.ckid=mmioFOURCC('f','m','t',' ');
	if (mmioDescend(hWaveFile, &child,&parent, 0)!=MMSYSERR_NOERROR)
	{
		OutputDebugString("Couldn't find format section in wave file ");
		OutputDebugString(pszFilename);
		OutputDebugString("\n");

		mmioClose(hWaveFile,0);			// Error - close the wave file
		return;
	}

	// Read out the format data
	if (mmioRead(hWaveFile, (char *)&formatdesc, sizeof(formatdesc))!=sizeof(formatdesc))
	{
		OutputDebugString("Error in wave format of ");
		OutputDebugString(pszFilename);
		OutputDebugString("\n");

		mmioClose(hWaveFile,0);
		return;

	}

	// Check this is a pcm format (a standard wav format)
	if (formatdesc.wFormatTag!=WAVE_FORMAT_PCM)
	{
		OutputDebugString("Error in wave format of ");
		OutputDebugString(pszFilename);
		OutputDebugString("\n");

		mmioClose(hWaveFile,0);
		return;

	}

	// Pop upstairs so we can then get down to data chunk
	if (mmioAscend(hWaveFile, &child, 0)!=MMSYSERR_NOERROR )
	{
		OutputDebugString("Couldn't ascend to data chunk of ");
		OutputDebugString(pszFilename);
		OutputDebugString("\n");

		mmioClose(hWaveFile,0);
		return;

	}

	// Now drop into data chunk
	child.ckid=mmioFOURCC('d','a','t','a');

	if (mmioDescend(hWaveFile, &child,&parent, MMIO_FINDCHUNK)!=MMSYSERR_NOERROR)
	{
		OutputDebugString("Couldn't find data section in wave file ");
		OutputDebugString(pszFilename);
		OutputDebugString("\n");

		mmioClose(hWaveFile,0);			// Error - close the wave file
		return;
	}


	// *************************************************************
	// Now that the info from the file has been stored, it is possible to
	// Create a sound buffer ready to hold the data, so it back to directX

	// Set the descriptor for the sound to be created.

	memset(&dsbd,0,sizeof(dsbd));
	dsbd.dwSize=sizeof(dsbd);
	dsbd.dwFlags = DSBCAPS_CTRLDEFAULT;						// Default features
	dsbd.dwBufferBytes=child.cksize;				// Set bytes needed to store
	dsbd.lpwfxFormat=&formatdesc;					// The format descriptor (got earlier from the file)

	if (FAILED(theSoundEngine->lpds->CreateSoundBuffer(&dsbd,&lpSoundBuffer,NULL)))
	{
		lpSoundBuffer=NULL;
		OutputDebugString("Could not create a sound buffer\n");
		return;

	}

	// ************************************************************
	// The file is open, the buffer is created. Now to read all the data in.

	// Load data into a buffer
	tempBuffer = (UCHAR *)malloc(child.cksize);
	mmioRead(hWaveFile, (char*)tempBuffer, child.cksize);

	// Close the file
	mmioClose(hWaveFile,0);

	// Locking the Dsound buffer

	if(FAILED(lpSoundBuffer->Lock(0, child.cksize, (void**) &tempPtr1,
							&length1, (void**) &tempPtr2,
							&length2, DSBLOCK_FROMWRITECURSOR)))
	{
		OutputDebugString("Couldn't lock the sound buffer \n");
		free(tempBuffer);
		return;
	}

	// Copy the two bits of the buffer
	memcpy(tempPtr1, tempBuffer, length1);
	memcpy(tempPtr2, tempBuffer+length1, length2);

	// Unlock the Dsound buffer
	if(FAILED(lpSoundBuffer->Unlock(tempPtr1,
							length1, tempPtr2,
							length2)))
	{
		OutputDebugString("Couldn't unlock the sound buffer \n");
		free(tempBuffer);

		return;
	}

	free(tempBuffer);
}	// End constructor




MySound::~MySound()
{
	Release();
}

ErrorType MySound::SetPan(int lPan)
{
	if (FAILED(lpSoundBuffer->SetPan(lPan)))
	{
		return FAILURE;
	}
	return SUCCESS;
}

ErrorType MySound::Release()
{
	if (lpSoundBuffer)				// If lpSoundBuffer is not null
	{
		lpSoundBuffer->Release();	// Attempt to release it

		lpSoundBuffer=NULL;

		return SUCCESS;
	}
	return FAILURE;
}

ErrorType MySound::Play(int flag)
{
	// The first two numbers in the Play() functions below
	// are always zero. The third controls whether to loop,
	// or just play once.
	if (FAILED(lpSoundBuffer->Play(0,0,flag)))
	{
		return FAILURE;
	}

	return SUCCESS;
}

ErrorType MySound::Stop()
{
	if (FAILED(lpSoundBuffer->Stop()))
	{
		return FAILURE;
	}

	return SUCCESS;
}

ErrorType MySound::SetVolume(int lVolume)
{
	if (FAILED(lpSoundBuffer->SetVolume(lVolume)))
	{
		return FAILURE;
	}
	return SUCCESS;
}


ErrorType MySound::SetFrequency(int lFrequency)
{
	if (FAILED(lpSoundBuffer->SetFrequency(lFrequency)))
	{
		return FAILURE;
	}
	return SUCCESS;
}

