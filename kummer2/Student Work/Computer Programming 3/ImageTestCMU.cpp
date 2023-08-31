#include <iostream.h>
//#include <math.h>
#include "CMUgraphicsLib/graphics.h"
#include "randgen.h"
#include<windows.h>



// global constants
const int IMAGE_WIDTH = 100;
const int IMAGE_HEIGHT = 120;


// declarations
void BounceImage();
void PlaceImage(int x, int y);
void WaitNClear(window &inputWindow);


// global window object, 800x600 at (5,5)
window myWindow(400, 300, 5, 5);

//images
image saddam("saddam.jpg", JPEG);


int main()
{
	cout << "Hit <enter> once you've resized and moved the Console";
	cout << " window out of the way...\n";
	cin.ignore();
	
	BounceImage();
	 	
 	return 0;
}


void BounceImage()
{	int x, y;
	RandGen r;

	myWindow.SetBuffering(true);

	
	
	PlaceImage(x,y);
	// Set the brush and pen white so we can clear the background
	for(int i=1;i<=20;i++)
	{

		myWindow.SetPen(WHITE, 0);    
		myWindow.SetBrush(WHITE);
    
		// Draw a rectangle that covers the entire window
		myWindow.DrawRectangle(0, 0, myWindow.GetWidth(), myWindow.GetHeight());
		x=r.RandInt(0,myWindow.GetWidth()-100);
		y=r.RandInt(0,myWindow.GetHeight()-120);

		PlaceImage(x,y);

		myWindow.UpdateBuffer();

		Sleep(500);

	}

	myWindow.SetBuffering(false);

	WaitNClear(myWindow);

}


void PlaceImage(int x, int y)
{
	
	
	myWindow.DrawImage(saddam,x, y, IMAGE_WIDTH, IMAGE_HEIGHT);
	
}



void WaitNClear(window &inputWindow)
{
 int iX, iY;
 
 	inputWindow.SetPen(BLACK);
	inputWindow.SetFont(16, BOLD, SWISS);
    inputWindow.DrawString(inputWindow.GetWidth()/2 - 100, inputWindow.GetHeight() - 25, "Click mouse to continue...");

    // Flush the mouse queue
    inputWindow.FlushMouseQueue();

    // Ignore return value since we don't care what type of click it was
    inputWindow.WaitMouseClick(iX, iY);

    // Set the brush and pen white so we can clear the background
    inputWindow.SetPen(WHITE, 0);    
    inputWindow.SetBrush(WHITE);
    
    // Draw a rectangle that covers the entire window
    inputWindow.DrawRectangle(0, 0, inputWindow.GetWidth(), inputWindow.GetHeight());
}
