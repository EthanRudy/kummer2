#include "Player.h"
#include "WeaponCollection.h"
#include "ExplosionCollection.h"
#include "mysound.h"
extern MyDrawEngine* pTheDrawEngine;
extern CWeaponCollection* pWeapons;
extern CExplosionCollection* pExplosions;

extern MySound* pExplosionSound;


CPlayer::CPlayer()
{
	pImage = new MyPicture(pTheDrawEngine);
	pImage->LoadBitmap("Images/Player.bmp");
	
	// Healthy Frames...
	SrcHealthyRECT[0].top    = 2;
	SrcHealthyRECT[0].bottom = 38;
	SrcHealthyRECT[0].left   = 0;
	SrcHealthyRECT[0].right  = 12;
	
	SrcHealthyRECT[1].top    = 0;
	SrcHealthyRECT[1].bottom = 38;
	SrcHealthyRECT[1].left   = 12;
	SrcHealthyRECT[1].right  = 52;
	
	SrcHealthyRECT[2].top    = 2;
	SrcHealthyRECT[2].bottom = 38;
	SrcHealthyRECT[2].left   = 52;
	SrcHealthyRECT[2].right  = 64;
	
	// First Damage Frames...
	SrcDamagedRECT[0].top    = 2;
	SrcDamagedRECT[0].bottom = 38;
	SrcDamagedRECT[0].left   = 65;
	SrcDamagedRECT[0].right  = 77;
	
	SrcDamagedRECT[1].top    = 0;
	SrcDamagedRECT[1].bottom = 38;
	SrcDamagedRECT[1].left   = 77;
	SrcDamagedRECT[1].right  = 117;
	
	SrcDamagedRECT[2].top    = 2;
	SrcDamagedRECT[2].bottom = 38;
	SrcDamagedRECT[2].left   = 117;
	SrcDamagedRECT[2].right  = 129;
	
	// Second Damage Frames...
	SrcDamagedRECT[3].top    = 2;
	SrcDamagedRECT[3].bottom = 38;
	SrcDamagedRECT[3].left   = 130;
	SrcDamagedRECT[3].right  = 142;
	
	SrcDamagedRECT[4].top    = 0;
	SrcDamagedRECT[4].bottom = 38;
	SrcDamagedRECT[4].left   = 142;
	SrcDamagedRECT[4].right  = 182;
	
	SrcDamagedRECT[5].top    = 2;
	SrcDamagedRECT[5].bottom = 38;
	SrcDamagedRECT[5].left   = 182;
	SrcDamagedRECT[5].right  = 194;
	
	// Third Damage Frames...
	SrcDamagedRECT[6].top    = 2;
	SrcDamagedRECT[6].bottom = 38;
	SrcDamagedRECT[6].left   = 195;
	SrcDamagedRECT[6].right  = 207;
	
	SrcDamagedRECT[7].top    = 0;
	SrcDamagedRECT[7].bottom = 38;
	SrcDamagedRECT[7].left   = 207;
	SrcDamagedRECT[7].right  = 247;
	
	SrcDamagedRECT[8].top    = 2;
	SrcDamagedRECT[8].bottom = 38;
	SrcDamagedRECT[8].left   = 247;
	SrcDamagedRECT[8].right  = 259;
	
	// Fourth Damage Frames...
	SrcDamagedRECT[9].top    = 2;
	SrcDamagedRECT[9].bottom = 38;
	SrcDamagedRECT[9].left   = 260;
	SrcDamagedRECT[9].right  = 272;
	
	SrcDamagedRECT[10].top    = 0;
	SrcDamagedRECT[10].bottom = 38;
	SrcDamagedRECT[10].left   = 272;
	SrcDamagedRECT[10].right  = 312;
	
	SrcDamagedRECT[11].top    = 2;
	SrcDamagedRECT[11].bottom = 38;
	SrcDamagedRECT[11].left   = 312;
	SrcDamagedRECT[11].right  = 324;
	
	
	// Set initial values...
	XAcceleration = 0;
	YAcceleration = 0;
	XVelocity = 0;
	YVelocity = 0;
	XPosition = 385;
	YPosition = 570;
	
	Frame[0] = 0;
	TimeTillNextFrame[0] = 4;
	Frame[1] = 0;
	TimeTillNextFrame[1] = 4;
	Frame[2] = 0;
	TimeTillNextFrame[2] = 4;
	
	DamageThreshhold = 40;
	
	Damage[0] = 50;
	Damage[1] = 100;
	Damage[2] = 50;
	
	FiringDelay = 50; // Frames between Shots
	ReadyToFire = true;
	ToFire = FiringDelay;
}

CPlayer::~CPlayer()
{
	pImage->Release();
	delete pImage;
}

void CPlayer::Move()
{
	int i;
	
	// Get the users input...
	if (GetAsyncKeyState(VK_LEFT) && !GetAsyncKeyState(VK_RIGHT) && Damage[1] > 30)
	{
		// Left...
		XAcceleration = -(PLAYER_XACCELERATION * ((Damage[1] - 30) / (100 - 30)));
	}
	else if (GetAsyncKeyState(VK_RIGHT) && !GetAsyncKeyState(VK_LEFT) && Damage[1] > 30)
	{
		// Right...
		XAcceleration = (PLAYER_XACCELERATION *  ((Damage[1] - 30) / (100 - 30)));
	}
	else
	{
		XAcceleration *= 0.01;
	}
	
	
	// Perform Motion...
	XVelocity += XAcceleration;
	YVelocity += YAcceleration;
	
	XVelocity -= XVelocity * CoF;
	YVelocity -= YVelocity * CoF;
	
	XPosition += XVelocity;
	YPosition += YVelocity;
	
	
	// Keep the player insted the screen...
	if (XPosition < 0)
	{
		XAcceleration = 0;
		XVelocity = 0;
		XPosition = 0;
	}
	else if (XPosition > 730)
	{
		XAcceleration = 0;
		XVelocity = 0;
		XPosition = 730;
	}
	
	if (YPosition < 0)
	{
		YAcceleration = 0;
		YVelocity = 0;
		YPosition = 0;
	}
	else if (YPosition > 558)
	{
		YAcceleration = 0;
		YVelocity = 0;
		YPosition = 558;
	}
	
	
	// Calculate the new DestRECTs for the 3 sections...
	DestRECT[0].top    = (long)YPosition + 2;
	DestRECT[0].bottom = (long)YPosition + 38;
	DestRECT[0].left   = (long)XPosition;
	DestRECT[0].right  = (long)XPosition + 12;
	
	DestRECT[1].top    = (long)YPosition;
	DestRECT[1].bottom = (long)YPosition + 38;
	DestRECT[1].left   = (long)XPosition + 12;
	DestRECT[1].right  = (long)XPosition + 52;
	
	DestRECT[2].top    = (long)YPosition + 2;
	DestRECT[2].bottom = (long)YPosition + 38;
	DestRECT[2].left   = (long)XPosition + 52;
	DestRECT[2].right  = (long)XPosition + 64;
	
	
	// If the section is damaged then animate it...
	for (i = 0; i < 3; i++)
	{
		if (Damage[i] <= DamageThreshhold)
		{
			TimeTillNextFrame[i]--;
			if (TimeTillNextFrame[i] == 0)
			{
				Frame[i]++;
				TimeTillNextFrame[i] = 8;
				if (Frame[i] >= 4)
				{
					Frame[i] = 0;
				}
			}
		}
	}
	
	
	if (!ReadyToFire)
	{
		ToFire -= 1;
		if (ToFire == 0)
		{
			ReadyToFire = true;
		}
	}
	
	// Check if the player is pressing fire...
	if (GetAsyncKeyState(VK_SPACE))
	{
		if (ReadyToFire)
		{
			Fire();
			ToFire = FiringDelay;
			ReadyToFire = false;
		}
	}
}

void CPlayer::Fire()
{
	// Check if the left Weapon is too damaged to fire...
	if (Damage[0] > DamageThreshhold)
	{
		pWeapons->Create(XPosition + 5, YPosition - 4, 0, -6, 1);
	}
	
	// Check if the right Weapon is too damaged to fire...
	if (Damage[2] > DamageThreshhold)
	{
		pWeapons->Create(XPosition + 57, YPosition - 4, 0, -6, 1);
	}
}

void CPlayer::Draw()
{
	int i;
	
	for (i = 0; i < 3; i++)
	{
		if (Damage[i] > DamageThreshhold)
		{
			pTheDrawEngine->Blit(DestRECT[i], SrcHealthyRECT[i], pImage);
		}
		else
		{
			pTheDrawEngine->Blit(DestRECT[i], SrcDamagedRECT[Frame[i] * 3 + i], pImage);
		}
	}
}