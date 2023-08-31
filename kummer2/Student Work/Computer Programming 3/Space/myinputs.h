#pragma once

#include <windows.h>			// Windows headers all-in-one
#define DIRECTINPUT_VERSION 0x0600
#include "dinput.h"

// Class MyInputs version 6.1
// This class is incomplete. The programming for Joysticks is unfinished
// The class will correctly report mouse and keyboard inputs using DirectInput


class MyInputs
{

private:
	int miMouseDX;						// The x-movement of the mouse in the last sample
	int miMouseDY;						// The y-movement of the mouse in the last sample
	bool mbMouseLeft;					// Whether or not left mouse button down in last sample
	bool mbMouseRight;					// Whether or not right mouse button down in last sample
	bool mbMouseMiddle;					// Whether or not middle mouse button down in last sample

	bool mbKeyboardAvailable;			// Whether or not the keyboard is available
	bool mbMouseAvailable;				// Whether or not the mouse is available
	bool mbJoystickAvailable;			// Whether or not a joystick is available
	const int mkiMaxJoystickAxis;		// Maximum value of the joystick axes. (

	DIMOUSESTATE msMousestate;			// DirectINput object to store state of mouse
	char mrgcKeystate[256];				// Array to hold the keyboard state. (Usually 102 keys, but 256 allows
										//		for future expansion

	LPDIRECTINPUT lpdi;					// DirectInput
	LPDIRECTINPUTDEVICE lpdikeyboard;	// The directInput keyboard
	LPDIRECTINPUTDEVICE lpdimouse;		// The directInput mouse
	LPDIRECTINPUTDEVICE lpdijoystick;	// The directInput joystick
	GUID mJoystickGUID;					// The GUID of the first joystick

public:
	MyInputs(HINSTANCE hinst, HWND hwnd);
		// Constructor. Creates the MyInputs object and connects to a mouse, joystick and keyboard
		// via direct input.
		// The attributes mbKeyboardAvailable , mbMouseAvailable, mbJoystickAvailable will be set
		// to true if each corresponding object can be connected. Otherwise each is false.

	~MyInputs();
		// Destructor. Calls Release()

	void Release();
		// Releases all directInput objects

	int GetMouseDX();
		// Gets the x-movement of the mouse found on the last sample

	int GetMouseDY();
		// Gets the y-movement of the mouse found on the last sample

	bool IfMouseLeftDown();
		// Returns true if the left mouse button was down on the last sample.
		// False otherwise

	bool IfMouseRightDown();
		// Returns true if the right mouse button was down on the last sample.
		// False otherwise

	bool IfMouseMiddleDown();
		// Returns true if the middle mouse button was down on the last sample.
		// False otherwise

	void SampleMouse();
		// Samples the mouse. Records the state of the buttons and the movement made
		// since the previous sample

	void SampleKeyboard();
		// Samples the keyboard. Records the up/down state of all the keys at the time of sampling

	char* GetKeyboardState();
		// Returns a pointer to an array describing the state of all keys the at the time
		// of the last keyboard sampling.
		//      The integer values for the array position of each key are stored in a series of constants.
		//		DIK_0		Main keyboard zero
		//		DIK_1		Main keyboard 1
		//			etc for numbers
		//		DIK_MINUS	Minus key
		//		DIK_EQUALS	Equals key
		//		DIK_A		A key
		//		DIK_B		B key
		//		DIK_C		C key
		//			etc for letters
		//		DIK_LSHIFT	Left shift
		//		DIK_RSHIFT	Right shift
		//		DIK_LCONTROL	Left ctrl
		//		DIK_RCONTROL	Right ctrl
		//		DIK_LMENU		Left ALT
		//		DIK_SPACE
		//		DIK_F1		F1 key
		//		DIK_F2		F2 key
		//		DIK_NUMPAD0	Number pad zero
		//		DIK_NUMPAD1	Number pad one
		//		DIK_LEFT	Left arrow
		//		DIK_RIGHT	Right arrow
		//		DIK_UP		Up arrow
		//		DIK_DOWN	Down arrow
		//		.... YOU GET THE IDEA

	bool KeyPressed(unsigned char key);
		// A method to check if a particular key was pressed at the last sample of the keyboard.
		// Returns:
		//  true if the specified key was pressed at the time the keyboard was last sampled.
		//  false otherwise
		// Parameters:
		//  key: an integer to indicate the key to check.
		//      The integer values for each key are stored in a series of constants.
		//		DIK_0		Main keyboard zero
		//		DIK_1		Main keyboard 1
		//			etc for numbers
		//		DIK_MINUS	Minus key
		//		DIK_EQUALS	Equals key
		//		DIK_A		A key
		//		DIK_B		B key
		//		DIK_C		C key
		//			etc for letters
		//		DIK_LSHIFT	Left shift
		//		DIK_RSHIFT	Right shift
		//		DIK_LCONTROL	Left ctrl
		//		DIK_RCONTROL	Right ctrl
		//		DIK_LMENU		Left ALT
		//		DIK_SPACE
		//		DIK_F1		F1 key
		//		DIK_F2		F2 key
		//		DIK_NUMPAD0	Number pad zero
		//		DIK_NUMPAD1	Number pad one
		//		DIK_LEFT	Left arrow
		//		DIK_RIGHT	Right arrow
		//		DIK_UP		Up arrow
		//		DIK_DOWN	Down arrow
		//		.... YOU GET THE IDEA



	void SampleJoystick();
		// To do




};