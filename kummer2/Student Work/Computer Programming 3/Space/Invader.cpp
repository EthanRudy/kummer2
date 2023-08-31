#include "Invader.h"
#include "WeaponCollection.h"
extern int GetRandNum (int LLimit, int ULimit);
extern CWeaponCollection* pWeapons;
extern MyDrawEngine* pTheDrawEngine;

int CInvader::Count = 0;
MyPicture* CInvader::pImage = NULL;

CInvader::CInvader()
{
	if (Count == 0)
	{
		pImage = new MyPicture(pTheDrawEngine);
		pImage->LoadBitmap("Images/Invader.bmp");
	}
	Count++;

	Active = true;
}

CInvader::~CInvader()
{
	if (Count == 1)
	{
		pImage->Release();
		delete pImage;
	}
	Count--;
}

void CInvader::Init(int FormationX, int FormationY)
{
	FormXPos = FormationX;
	FormYPos = FormationY;
	
	IsUnder = true;
	TimeTillFire = GetRandNum(30, FIRING_RATE);
}

void CInvader::FormationMoved(int X, int Y)
{
	DestRect.top    = (FormYPos * INVADER_SPACING) + Y;
	DestRect.bottom = (FormYPos * INVADER_SPACING) + Y + 19;
	DestRect.left   = (FormXPos * INVADER_SPACING) + X;
	DestRect.right  = (FormXPos * INVADER_SPACING) + X + 19;
	
	TimeTillFire--;
	
	if (TimeTillFire <= 0)
	{
		if (!IsUnder && Active)
		{
			pWeapons->Create(DestRect.left, DestRect.bottom + 3, 0, 2.5, 2);
		}
		
		TimeTillFire = FIRING_RATE;
	}
}

void CInvader::Draw(RECT Source)
{
	pTheDrawEngine->Blit(DestRect,Source,pImage);
}

bool CInvader::ReachedEnd()
{
	if (Active)
	{
		if (DestRect.left < 10 || DestRect.right > 790)
		{
			return true;
		}
	}
	return false;
}