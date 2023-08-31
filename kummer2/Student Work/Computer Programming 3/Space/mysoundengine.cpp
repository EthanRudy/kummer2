// mysoundengine.cpp	Version 7		8/12/03
// The definition file for the methods in MySoundEngine, declared in mysoundengine.h


#include "mysoundengine.h"

MySoundEngine::MySoundEngine(HWND hwnd)
{
	// Initialise dsound
	HRESULT error;
	if (FAILED(DirectSoundCreate(NULL, &lpds, NULL)))
	{
		OutputDebugString("Failed to create sound player\n");
		lpds=NULL;
	}

	// Set cooperative level and check for error
	error=lpds->SetCooperativeLevel(hwnd, DSSCL_NORMAL);

	if (FAILED(error))	// If failed to set cooperative level
	{
		OutputDebugString("Failed to set cooperative level\n");
		lpds->Release();
		lpds=NULL;
		if (error==DSERR_INVALIDPARAM)
			OutputDebugString("Parameters invalid\n");
		if (error==DSERR_ALLOCATED)
			OutputDebugString("Allocated\n");

	}
}

MySoundEngine::~MySoundEngine()
{
	Release();
}

ErrorType MySoundEngine::Release()
{
	if (lpds)			// If not already null
	{
		lpds->Release();
		lpds=NULL;
		return SUCCESS;
	}
	return FAILURE;
}