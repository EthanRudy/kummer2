#include "Weapon.h"

extern MyDrawEngine* pTheDrawEngine;
extern MySoundEngine* pTheSoundEngine;

int CWeapon::Count = 0;
MyPicture* CWeapon::pImage = NULL;
RECT CWeapon::FrameSRECT[4];

CWeapon::CWeapon()
{
	if (Count == 0)
	{
		FrameSRECT[0].top    = 0;
		FrameSRECT[0].bottom = 6;
		FrameSRECT[0].left   = 0;
		FrameSRECT[0].right  = 3;
		
		FrameSRECT[1].top    = 0;
		FrameSRECT[1].bottom = 6;
		FrameSRECT[1].left   = 0;
		FrameSRECT[1].right  = 3;
		
		FrameSRECT[2].top    = 0;
		FrameSRECT[2].bottom = 6;
		FrameSRECT[2].left   = 0;
		FrameSRECT[2].right  = 3;
		
		FrameSRECT[3].top    = 0;
		FrameSRECT[3].bottom = 6;
		FrameSRECT[3].left   = 0;
		FrameSRECT[3].right  = 3;
		
		pImage = new MyPicture(pTheDrawEngine);
		pImage->LoadBitmap("Images/Laser.bmp");

		Active = false;
	}
	Count++;
	pSound = new MySound(pTheSoundEngine, "Sounds/Laser.wav");
}

CWeapon::~CWeapon()
{
	if (Count == 1)
	{
		pImage->Release();
		delete pImage;
	}
	Count--;
	
	pSound->Release();
	delete pSound;
}

void CWeapon::Create(double XPos, double YPos, double XVel, double YVel, int Owner)
{
	XPosition = XPos;
	YPosition = YPos;
	
	XVelocity = XVel;
	YVelocity = YVel;
	
	DestRect.top    = (long)YPosition;
	DestRect.bottom = (long)YPosition + 6;
	DestRect.left   = (long)XPosition;
	DestRect.right  = (long)XPosition + 3;
	
	FiredBy = Owner;
	
	pSound->Play(0);
	Active = true;
}

void CWeapon::Move()
{
	if (XPosition < -3 || XPosition > 800 || 
		YPosition < -6 || YPosition > 600 )
	{
		// Weapon is off the screen so destroy...
		Active = false;
	}
	
	XPosition += XVelocity;
	YPosition += YVelocity;
	
	DestRect.top    = (long)YPosition;
	DestRect.bottom = (long)YPosition + 6;
	DestRect.left   = (long)XPosition;
	DestRect.right  = (long)XPosition + 3;
}

void CWeapon::Draw()
// Will just draw the weapon, the caller must check to see if
// the weapon is active.
{
	pTheDrawEngine->Blit(DestRect,FrameSRECT[0],pImage);
}