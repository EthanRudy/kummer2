// gamecode.exe 
// An empty windows program with a game loop for you

// Chris Rook

// version 7 15/12/03


#include "errortype.h"
// wincode.cpp
// Creates a window using the size and depth declared in gamecode.h
// Initiates a game loop that calls the functions GameInit(), GameMain(), GameShutdown()
// The loop checks for the escape key being pressed, and ends the game loop if it is.


#include "gamecode.h"
#include "gametimer.h"

// Includes *************************************************************************************

#define WIN32_LEAN_AND_MEAN		// Gives you SDK windows rather than that horrible

//#include "mytools.h"


#include <ddraw.h>
#include <stdio.h>				// IO stuff
#include <windows.h>			// Windows headers all-in-one
#include <iostream.h>			// IO stuff
#include <windowsx.h>			// Windows macros




// Defines **************************************************************************************

#define WINDOW_CLASS_NAME "WINCLASS1"	
								// Defines the name of the window class I am going to use




// Globals ************************************************************************************

HINSTANCE g_hinstance;		// The handle to the window instance
HWND gHwnd;					// The handle to the window
bool WindowClosed;			// A variable that records whether or not the window has been asked to close



// Window proc **********************************************************************************


// Remember -- all the windows will use this winproc!!!

LRESULT CALLBACK WindowProc(	// The event handler. It's a callback function
							HWND hwnd,		// The handle to the window that called
							UINT msg,		// The message sent
							WPARAM wparam,
							LPARAM lparam)	// These further subclass the message sent,
											// but I don't plan to use them
{
	PAINTSTRUCT ps;				// Use by WM_PAINT
	HDC hdc;					// A handle to a device context. May be used by WM_PAINT,
								// but not right now.

	// Decide what the message is
	switch(msg)
	{
	case WM_CREATE:				// If window has been created
		{
								// Do any initialisation
			return(0);			// Return success
		}
		break;

	case WM_SETCURSOR:
		// Hide the cursor if in full screen 
		SetCursor( NULL );
		return TRUE;
		break;

	case WM_PAINT:
		{
			hdc=BeginPaint(hwnd, &ps);		// Validate the window
			EndPaint(hwnd, &ps);

			// I havn't really done much here - just did a standard paint-job to pretend
			// the window has been properly painted.
			// hwnd tells it what to paint - the window, of course
			// ps is the address of a structure holding the rectangle to bve drawn
			// hdc is a graphics context that describes the video system

			return(0);			// return success
		}
		break;

	case WM_DESTROY:
		{
			// Wants to kill the application
			PostQuitMessage(0);	// Sends a quit message onto the windows queue

			return(0);			// return success
		}
		break;

	default:
		break;

	}	// End the switch

	// Any messages not handled are done by the default handler
	return (DefWindowProc(hwnd, msg, wparam, lparam));
					// Ever feel like switching round wparam and lparam,
					// just to see what happens?

}	// End of WinProc


// Winmain **************************************************************************************

int WINAPI WinMain(HINSTANCE hInstance,			// A number that registers the instance of this program
				   HINSTANCE hPrevInstance,		// Not used in W95+. Null
				   LPSTR lpCmdLine,				// Pointer to a string that started this whole thing off
				   int nCmdShow)				// Integer that tells how the window is to appear. Active/maximized, etc
{
	WNDCLASSEX	winclass;				// The window class to be created
	HWND		hwnd;					// A general window handle
	MSG			msg;					// A general message

	// Fill in the window class structure
	winclass.cbSize	=	sizeof(WNDCLASSEX);		// The size of the class in case anyone wants to know
	winclass.style	=	CS_DBLCLKS |			// Responds to double-clicks
						CS_OWNDC	|			// Has own device context (speed)
						CS_HREDRAW |			// Redraws if vertically changed
						CS_VREDRAW;				// Redraws if horizontally changed
	winclass.lpfnWndProc = WindowProc;			// Sets pointer to WindowProc function
	winclass.cbClsExtra	=	0;					// No-one used these
	winclass.cbWndExtra	=	0;					// nowadays
	winclass.hInstance	=	hInstance;			// The handle to the instance created at startup
	winclass.hIcon		= LoadIcon				// Set the icon to use
							(NULL,				// use a standard one
							IDI_APPLICATION);	// this standard one
	winclass.hCursor	=	LoadCursor			// Set cursor to use
							(NULL,				// Use a standard one
							IDC_ARROW);			// The bog-standard arrow
	winclass.hbrBackground =					// Set background brush (using handle)
		(HBRUSH)GetStockObject(BLACK_BRUSH);	// Get the black one from the general stores
	winclass.lpszMenuName = NULL;				// A string for the resource filename with the menu in. Not using one here.
	winclass.lpszClassName = WINDOW_CLASS_NAME;	// The name of this class - defined above
	winclass.hIconSm	= LoadIcon				// Set the small icon
						(NULL, IDI_APPLICATION);	// Bog standard one

	g_hinstance = hInstance;					// Keep global record of the application instance#



	// Register the window. If it fails, bug out
	if (!RegisterClassEx(&winclass))
		return(FAILURE);

	// Create the window

	if (!(hwnd = CreateWindowEx(NULL,				// No extended styles
								WINDOW_CLASS_NAME,	// The class name
								"Basic window",		// Title
								WS_POPUP | WS_VISIBLE, // An overlapped, visible window
								0,0,				// Initial location
								SCREENWIDTH,SCREENHEIGHT,		// Size
								NULL,				// PArent - use desktop
								NULL,				// No menu used, so no handle
								hInstance,			// handle to this instance
								NULL)))				// No extra parameters
			return(FAILURE);						// Bug out if failed

	gHwnd=hwnd;										// Set the global

	// The event loop
	
	GameTimer* GameTmr;
	GameTmr = new GameTimer;
	
	GameTmr->setMinimumFrameTime(0.010);
	
	WindowClosed=false;
	int gameError=GameInit();						// Initialise the game

	if (gameError == FAILURE)						// If game failed to initialise
		WindowClosed = true;
	else
	while(true)
	{												// Infinite loop

		//SetCursor(NULL);							// Keep cursor out of way

		if(PeekMessage(&msg, NULL, 0,0,PM_REMOVE))	// If there is a message in the queue, remove it and....
		{
			if (msg.message == WM_QUIT)				// If is is "quit"
				break;								// out of the infinite loop

			TranslateMessage(&msg);					// Translate the message - it's voodoo

			DispatchMessage(&msg);					// And send it to the Window proc
		}

		// Test to see if boss walked into the room

		if (KEYPRESSED(VK_ESCAPE))
		{
			PostMessage(gHwnd,WM_CLOSE,0,0);		// Send message to quit window on next (?) loop
			WindowClosed=true;						// Make a note that window is on the way out
		}
		
		GameTmr->mark();
		
		
		if (!WindowClosed)		// Check I'm not already dead
			gameError=GameMain();						// Play the real game stuff

	}		// End infinite loop

	GameShutdown();									// Clear up the game

	delete GameTmr;
	
	return(msg.wParam);								// Return to windows

}	// End WinMain


