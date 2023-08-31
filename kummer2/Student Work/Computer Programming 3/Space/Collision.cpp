#include "Collision.h"

bool CheckRECTColl(RECT D1, RECT D2, RECT &OverLap)
{
	LPRECT pOver = &OverLap;
	
	if (IntersectRect(pOver, &D1, &D2))
	{
		OverLap.top = pOver->top;
		OverLap.bottom = pOver->bottom;
		OverLap.left = pOver->left;
		OverLap.right = pOver->right;
		
		return true;
	}
	
	OverLap.top = 0;
	OverLap.bottom = 0;
	OverLap.left = 0;
	OverLap.right = 0;
	
	return false;
}

bool CheckPixelPColl(MyPicture* Pic1, MyPicture* Pic2, RECT S1, RECT D1, RECT S2, RECT D2, RECT &OverLap)
{
	LPRECT pOver = 0;
	RECT O1;
	RECT O2;
	
	if (IntersectRect(pOver, &D1, &D2))
	{
		// Rect Collision has occured...
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		if (true)
		{
			OverLap.top = pOver->top;
			OverLap.bottom = pOver->bottom;
			OverLap.left = pOver->left;
			OverLap.right = pOver->right;
			
			return true;
		}
	}
	
	OverLap.top = 0;
	OverLap.bottom = 0;
	OverLap.left = 0;
	OverLap.right = 0;
	
	return false;
}
