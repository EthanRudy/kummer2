// My inputs.cpp		Version 6a			8/12/03		
// The definition file for the MyInputs class - declared in myinputs.h


#include "myinputs.h"

// *************************************************************************************
// Implementation of the global EnumerateJoystick function

int CALLBACK EnumerateJoystick(LPCDIDEVICEINSTANCE lpddi, LPVOID pDeviceFoundGUID)
// Nothing to see here, folks. Move along. Move along.
// My, look at that fascinating function at the bottom of the page. Mmmm. That looks good.
{
	pDeviceFoundGUID = (LPVOID)(&(lpddi->guidInstance));

	return DIENUM_STOP;			// Stop enumerating
	
}

// *************************************************************************************
// Implementation of the MyInputs member functions

MyInputs::MyInputs(HINSTANCE hinst, HWND hwnd)
:mkiMaxJoystickAxis(100)
{
	lpdi=NULL;

	lpdikeyboard=NULL;
	lpdimouse=NULL;
	lpdijoystick=NULL;

	miMouseDX=0;
	miMouseDY=0;
	mbMouseLeft=false;
	mbMouseRight = false;
	mbMouseMiddle = false;

	mbMouseAvailable = true;
	mbKeyboardAvailable = true;
	mbJoystickAvailable = false;			


	if (FAILED(DirectInputCreate(hinst, DIRECTINPUT_VERSION, &lpdi, NULL)))
	{
		// Failed to get DInput.
		OutputDebugString("Failed to create direct input.");

		mbMouseAvailable = false;
		mbKeyboardAvailable = false;
		mbJoystickAvailable = false;

		return;
	}

	// Direct input is set up - handle the keyboard next ********************

	if (FAILED(lpdi->CreateDevice(GUID_SysKeyboard, &lpdikeyboard, NULL)))
	{
		// Failed to get a keyboard!
		OutputDebugString("Failed to find a keyboard");
		mbKeyboardAvailable = false;

	}

	// Setting cooperation level to BACKGROUND (gets input whether on top or not)
	//   and NONEXCLUSIVE (let other programs use the keyboard, too)
	if (FAILED(lpdikeyboard->SetCooperativeLevel(hwnd, DISCL_BACKGROUND | DISCL_NONEXCLUSIVE)))
	{
		// Failed to set cooperative level
		OutputDebugString("Failed to set keyboard cooperative level");
		mbKeyboardAvailable = false;

	}

	// Setting format for the device to be a default keyboard
	if (FAILED(lpdikeyboard->SetDataFormat(&c_dfDIKeyboard)))
	{
		// Failed to set format
		OutputDebugString("Failed to set keyboard format");
		mbKeyboardAvailable = false;

	}

		// Aquire keyboard
	if (FAILED(lpdikeyboard->Acquire()))
	{
		// Failed to set cooperative level
		OutputDebugString("Failed to acquire keyboard");
		mbKeyboardAvailable = false;

	}

	// Keyboard ready. Next is the mouse **************************************


		if (FAILED(lpdi->CreateDevice(GUID_SysMouse, &lpdimouse, NULL)))
	{
		// Failed to get a mouse
		OutputDebugString("Failed to find a mouse");
		mbMouseAvailable = false;

	}

	// Setting cooperation level to BACKGROUND (gets input whether on top or not)
	//   and NONEXCLUSIVE (let other programs use the mouse, too)
	if (FAILED(lpdimouse->SetCooperativeLevel(hwnd, DISCL_BACKGROUND | DISCL_NONEXCLUSIVE)))
	{
		// Failed to set cooperative level
		OutputDebugString("Failed to set mouse cooperative level");
		mbMouseAvailable = false;

	}

	// Setting format for the device to be a default mouse
	if (FAILED(lpdimouse->SetDataFormat(&c_dfDIMouse)))
	{
		// Failed to set format
		OutputDebugString("Failed to set mouse format");
		mbMouseAvailable = false;

	}

		// Aquire keyboard
	if (FAILED(lpdimouse->Acquire()))
	{
		// Failed to set cooperative level
		OutputDebugString("Failed to acquire mouse");
		mbMouseAvailable = false;

	}

	// Mouse is armed and hungry. Next try the joystick

	// First need to enumerate the joysticks an just claim the first one connected
	// (a bit simple - alternative is to give users a choice from a list, but too much hassle.)

	mJoystickGUID.Data1 = NULL;	// Set it to null. If still null afterwards, assume no joystick

	// Enumerate the attached joystick devices. This will repeatedly call my "EnumerateJoysticks()£ 
	//  function, and will put the joystick GUID in mJoystickGUID.
	lpdi->EnumDevices(DIDEVTYPE_JOYSTICK, EnumerateJoystick, &mJoystickGUID, DIEDFL_ATTACHEDONLY);

	if(mJoystickGUID.Data1 == NULL) mbJoystickAvailable = false;	// Still null. No joystick found
	else mbJoystickAvailable = true;						// Joystick found

	// Connnect to the joystick stored by the enumeration function

	if(mbJoystickAvailable)
	{
		if(FAILED(lpdi->CreateDevice(mJoystickGUID, &lpdijoystick, NULL)))
		{
			mbJoystickAvailable = false;		// If couldn't connect, set to unavailable
		}
	}

	// Set the cooperative level - want exclusive access

	if(mbJoystickAvailable)
	{
		if(FAILED(lpdijoystick->SetCooperativeLevel(hwnd, DISCL_BACKGROUND | DISCL_NONEXCLUSIVE)))
		{
			// Could not set cooperative level
			mbJoystickAvailable=false;
			OutputDebugString("Could not set joystick cooperative level");
		}
	}

	// Set the data format for the joystick

	if(mbJoystickAvailable)
	{
		if(FAILED(lpdijoystick->SetDataFormat(&c_dfDIJoystick)))
		{
			// Could not set data format
			mbJoystickAvailable=false;
			OutputDebugString("Could not set joystick data format");
		}
	}

	if(mbJoystickAvailable)
	{
		// Set joystick ranges - start with x axis

		DIPROPRANGE joystickAxisRange;		// A struct to store the details of the range you want to set

		joystickAxisRange.lMax = mkiMaxJoystickAxis;				// Set max range to the constant
		joystickAxisRange.lMin = -mkiMaxJoystickAxis;				// Same for min range
		joystickAxisRange.diph.dwSize=sizeof(DIPROPRANGE);			// Tell it its own size
		joystickAxisRange.diph.dwHeaderSize=sizeof(DIPROPHEADER);	// Tell it the size of its header
		joystickAxisRange.diph.dwObj = DIJOFS_X;					// Setting the x-axis
		joystickAxisRange.diph.dwHow = DIPH_BYOFFSET;				// Use offset (as always) for getting data

		lpdijoystick->SetProperty(DIPROP_RANGE, &joystickAxisRange.diph);

		// Y-axis next
		joystickAxisRange.lMax = mkiMaxJoystickAxis;				// Set max range to the constant
		joystickAxisRange.lMin = -mkiMaxJoystickAxis;				// Same for min range
		joystickAxisRange.diph.dwSize=sizeof(DIPROPRANGE);			// Tell it its own size
		joystickAxisRange.diph.dwHeaderSize=sizeof(DIPROPHEADER);	// Tell it the size of its header
		joystickAxisRange.diph.dwObj = DIJOFS_Y;					// Setting the x-axis
		joystickAxisRange.diph.dwHow = DIPH_BYOFFSET;				// Use offset (as always) for getting data

		lpdijoystick->SetProperty(DIPROP_RANGE, &joystickAxisRange.diph);

		// Finally, z-axis
		joystickAxisRange.lMax = mkiMaxJoystickAxis;				// Set max range to the constant
		joystickAxisRange.lMin = -mkiMaxJoystickAxis;				// Same for min range
		joystickAxisRange.diph.dwSize=sizeof(DIPROPRANGE);			// Tell it its own size
		joystickAxisRange.diph.dwHeaderSize=sizeof(DIPROPHEADER);	// Tell it the size of its header
		joystickAxisRange.diph.dwObj = DIJOFS_Z;					// Setting the x-axis
		joystickAxisRange.diph.dwHow = DIPH_BYOFFSET;				// Use offset (as always) for getting data

		lpdijoystick->SetProperty(DIPROP_RANGE, &joystickAxisRange.diph);

	}

	if(mbJoystickAvailable)
	{
		// Finally, acquire the joystick
		if(FAILED(lpdijoystick->Acquire()))
		{
			mbJoystickAvailable=false;
			OutputDebugString("Failed to aquire joystick");
		}
	}

	if(!mbJoystickAvailable)	// If joystick did not survive all that mangling
		lpdijoystick=NULL;


}


MyInputs::~MyInputs()
{

	Release();
}

void MyInputs::Release()
{
	// Release all objects
	if (lpdimouse) lpdimouse->Release();
	if (lpdikeyboard) lpdikeyboard->Release();

	if (lpdijoystick) lpdijoystick->Release();

	if (lpdi) lpdi->Release();
	mJoystickGUID.Data1=NULL;		// Set joystick guid back to null
}




void MyInputs::SampleMouse()
{
	// Get state of mouse from DInput
	lpdimouse->GetDeviceState(sizeof(msMousestate), (LPVOID) &msMousestate);

	// Record mouse movements in member variables
	miMouseDX=msMousestate.lX;
	miMouseDY=msMousestate.lY;

	// See which buttons were down and set accordingly
	if(msMousestate.rgbButtons[0] & 0x80)
	{
		mbMouseLeft = true;
	}
	else
	{
		mbMouseLeft = false;
	}

	if(msMousestate.rgbButtons[1] & 0x80)
	{
		mbMouseRight = true;
	}
	else
	{
		mbMouseRight = false;
	}

	if(msMousestate.rgbButtons[2] & 0x80)
	{
		mbMouseMiddle = true;
	}
	else
	{
		mbMouseMiddle = false;
	}

	// Wheel not implemented
}

int MyInputs::GetMouseDX()
{
	return miMouseDX;
}

int MyInputs::GetMouseDY()
{
	return miMouseDY;
}

bool MyInputs::IfMouseLeftDown()
{
	return mbMouseLeft;
}

bool MyInputs::IfMouseRightDown()
{
	return mbMouseRight;
}

bool MyInputs::IfMouseMiddleDown()
{
	return mbMouseMiddle;
}


char* MyInputs::GetKeyboardState()
{
	return mrgcKeystate;
}

bool MyInputs::KeyPressed(unsigned char key)
{
	
	return ((mrgcKeystate[key]&0x80)>0);	// Return true if 0x80 bit set (set if key was pressed)
}


void MyInputs::SampleKeyboard()
{
	lpdikeyboard->GetDeviceState(sizeof(mrgcKeystate), mrgcKeystate);
}


void MyInputs::SampleJoystick()
{
	
}
