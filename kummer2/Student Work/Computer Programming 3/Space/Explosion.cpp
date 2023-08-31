#include "Explosion.h"

extern MyDrawEngine* pTheDrawEngine;
extern MySoundEngine* pTheSoundEngine;

int CExplosion::Count = 0;
MyPicture* CExplosion::pImage[4] = {0,0};

CExplosion::CExplosion()
{
	if (Count == 0)
	{
		pImage[0] = new MyPicture(pTheDrawEngine);
		pImage[0]->LoadBitmap("Images/Explosion1.bmp");
		
		pImage[1] = new MyPicture(pTheDrawEngine);
		pImage[1]->LoadBitmap("Images/Explosion2.bmp");
		
		pImage[2] = new MyPicture(pTheDrawEngine);
		pImage[2]->LoadBitmap("Images/Explosion3.bmp");
		
		pImage[3] = new MyPicture(pTheDrawEngine);
		pImage[3]->LoadBitmap("Images/Explosion4.bmp");
	}
	Count++;
	
	pSound = new MySound(pTheSoundEngine, "Sounds/explosion3.wav");
	
	Active = false;
}

CExplosion::~CExplosion()
{
	if (Count == 1)
	{
		pImage[0]->Release();
		delete pImage[0];
		
		pImage[1]->Release();
		delete pImage[1];
		
		pImage[2]->Release();
		delete pImage[2];
		
		pImage[3]->Release();
		delete pImage[3];
	}
	Count--;
	
	pSound->Release();
	delete pSound;
}

void CExplosion::Create(int XPos, int YPos, int eType)
{
	if (eType == 0)
	{
		Type = 0;
		Frame = 1;
		
		SourceRECT.top    = 0;
		SourceRECT.bottom = 64;
		SourceRECT.left   = Frame * 64;
		SourceRECT.right  = SourceRECT.left + 63;
		
		FrameDelay = 3;
		TimeTillNextFrame = FrameDelay;
	}
	else if (eType == 1)
	{
		Type = 1;
		Frame = 0;
		
		SourceRECT.top    = (4 - ((Frame + 1) % 4)) * 64 ;
		SourceRECT.left   = ((Frame + 1) / 4) * 64;
		if ((Frame + 1) % 4 == 0)
		{
			SourceRECT.top = 0;
			SourceRECT.left = (Frame / 4) * 64;
		}
		
		SourceRECT.bottom = SourceRECT.top + 64;
		SourceRECT.right  = SourceRECT.left + 64;
		
		FrameDelay = 2;
		TimeTillNextFrame = FrameDelay;
	}
	else if (eType == 2)
	{
		Type = 2;
		Frame = 0;
		
		SourceRECT.top    = 0;
		SourceRECT.bottom = 40;
		SourceRECT.left   = Frame * 50;
		SourceRECT.right  = SourceRECT.left + 50;
		
		FrameDelay = 9;
		TimeTillNextFrame = FrameDelay;
	}
	else if (eType == 3)
	{
		Type = 3;
		Frame = 0;
		
		SourceRECT.top    = 0;
		SourceRECT.bottom = 20;
		SourceRECT.left   = Frame * 25;
		SourceRECT.right  = SourceRECT.left + 25;
		
		FrameDelay = 9;
		TimeTillNextFrame = FrameDelay;
	}
	
	pSound->Play(0);
	
	XPos -= (SourceRECT.right - SourceRECT.left) / 2;
	YPos -= (SourceRECT.bottom - SourceRECT.top) / 2;
	
	DestRECT.top    = YPos;
	DestRECT.bottom = YPos + SourceRECT.bottom - SourceRECT.top;
	DestRECT.left   = XPos;
	DestRECT.right  = XPos + SourceRECT.right - SourceRECT.left;
	
	Active = true;
}

void CExplosion::Animate()
{
	if (Type == 0)
	{
		TimeTillNextFrame--;
		
		if (TimeTillNextFrame <= 0)
		{
			Frame++;
			SourceRECT.left = Frame * 64;
			SourceRECT.right = SourceRECT.left + 63;
			
			TimeTillNextFrame = FrameDelay;
		}
		
		if (Frame == 9)
		{
			Active = false;
		}
	}
	else if (Type == 1)
	{
		TimeTillNextFrame--;
		
		if (TimeTillNextFrame <= 0)
		{
			Frame++;
			SourceRECT.top    = (4 - ((Frame + 1) % 4)) * 64;
			SourceRECT.left   = ((Frame + 1) / 4) * 64;
			if ((Frame + 1) % 4 == 0)
			{
				SourceRECT.top = 0;
				SourceRECT.left = (Frame / 4) * 64;
			}
			
			SourceRECT.bottom = SourceRECT.top + 64;
			SourceRECT.right = SourceRECT.left + 64;
			
			TimeTillNextFrame = FrameDelay;
		}
		
		if (Frame == 16)
		{
			Active = false;
		}
	}
	else if (Type == 2)
	{
		TimeTillNextFrame--;
		
		if (TimeTillNextFrame <= 0)
		{
			Frame++;
			SourceRECT.left = Frame * 50;
			SourceRECT.right = SourceRECT.left + 50;
			
			TimeTillNextFrame = FrameDelay;
		}
		
		if (Frame == 5)
		{
			Active = false;
		}
	}
	else if (Type == 3)
	{
		TimeTillNextFrame--;
		
		if (TimeTillNextFrame <= 0)
		{
			Frame++;
			SourceRECT.left = Frame * 25;
			SourceRECT.right = SourceRECT.left + 25;
			
			TimeTillNextFrame = FrameDelay;
		}
		
		if (Frame == 5)
		{
			Active = false;
		}
	}
}

void CExplosion::Draw()
{
	pTheDrawEngine->Blit(DestRECT, SourceRECT, pImage[Type]);
}