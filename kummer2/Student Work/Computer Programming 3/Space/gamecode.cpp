// GameCode.cpp		Version 7			8/12/03	
// These three functions form the basis of a game loop in the window created in the
// wincode.cpp file



#include "gamecode.h"
#include <math.h>				// Math stuff
#include <stdlib.h>				// Standard stuff
#include <dsound.h>				// Direct sound
#include "mydrawengine.h"
#include "mypicture.h"
#include "mysoundengine.h"
#include "mysound.h"
#include "myinputs.h"
#include <time.h>

#include "Collision.h"
#include "ExplosionCollection.h"
#include "InvaderCollection.h"
#include "WeaponCollection.h"
#include "Player.h"


MyDrawEngine* pTheDrawEngine;	// A pointer to the drawing engine
MySoundEngine* pTheSoundEngine;	// A pointer to the sound engine

extern HWND gHwnd;				// A handle to the main window application (created and declared in wincode.cpp).
extern HINSTANCE g_hinstance;	// A handle to the program instance

// The game !!! *********************************************************************************

	MyInputs* pTheInputs;
	
	CInvaderCollection*    pInvaders;
	CExplosionCollection*  pExplosions;
	CWeaponCollection*     pWeapons;
	CPlayer*               pPlayer;
	
	RECT rgrClipperRects[1];
	
	bool SpaceDown = false;
	int DeBugg = 0;

int GameInit()
// Called once before entering game loop. 
// Use this function to set up the program
// gHwnd is the handle to the window and is required by the constructors for the engines
{
	// Create the engines
	pTheDrawEngine = new MyDrawEngine(SCREENWIDTH, SCREENHEIGHT, COLOURDEPTH, gHwnd);
	pTheSoundEngine = new MySoundEngine(gHwnd);
	pTheInputs=new MyInputs(g_hinstance, gHwnd);
	
	// Set up the Clipper...
	rgrClipperRects[0].top    = 0;
	rgrClipperRects[0].bottom = 600;
	rgrClipperRects[0].left   = 0;
	rgrClipperRects[0].right  = 800;
	
	pTheDrawEngine->SetClipper(1,rgrClipperRects);
	
	// Make the Invaders Collection...
	pInvaders = new CInvaderCollection;
	pInvaders->InitFormation();
	
	// Make the Explosions Collection...
	pExplosions = new CExplosionCollection;
	
	// make the Weapon Collection...
	pWeapons = new CWeaponCollection;
	
	// Make the Player Object...
	pPlayer = new CPlayer;
	
	InitRandom();
	
	return (SUCCESS);
}

// ******************************************************************

int GameMain()
// Called repeatedly - the game loop
{
int i = 0;
int j = 0;
RECT tmpOver;
	
	if (KEYPRESSED('Q'))
	{
		pInvaders->Kill(GetRandNum(0, 39));
	}
	
	if (KEYPRESSED('W'))
	{
		pInvaders->Invader[GetRandNum(0, 39)]->Active = true;
	}
	
	if (pPlayer->Damage[0] < 100)
	{
		pPlayer->Damage[0] += 0.1;
	}
	
	if (pPlayer->Damage[1] < 100)
	{
		pPlayer->Damage[1] += 0.1;
	}
	
	if (pPlayer->Damage[2] < 100)
	{
		pPlayer->Damage[2] += 0.1;
	}
	
	
	
//	 ##----MOVEMENT----##  \\
	
	pInvaders->MoveFormation();
	pWeapons->Move();
	pExplosions->Animate();
	pPlayer->Move();
	
	
	
//	##----COLISIONS----##  \\
	
	for (j = 0; j < MAX_WEAPON_COUNT; j++)
	{
		if (pWeapons->Weapon[j]->Active)
		{
			if (pWeapons->Weapon[j]->FiredBy != 2)
			{
				for (i = 0; i < MAX_INVADER_COUNT; i++)
				{
					if (pInvaders->Invader[i]->Active)
					{
						if (CheckRECTColl(pInvaders->Invader[i]->DestRect, pWeapons->Weapon[j]->DestRect, tmpOver))
						{
							pInvaders->Kill(i);
							pWeapons->Weapon[j]->Active = false;
						}
					}
				}
			}
			
			if (pWeapons->Weapon[j]->FiredBy != 1)
			{
				if (CheckRECTColl(pPlayer->DestRECT[0], pWeapons->Weapon[j]->DestRect, tmpOver))
				{
					pExplosions->CreateExplosion((pPlayer->DestRECT[0].left + pPlayer->DestRECT[0].right) / 2,
												(pPlayer->DestRECT[0].top + pPlayer->DestRECT[0].bottom) / 2, 3);
					
					pWeapons->Weapon[j]->Active = false;
					pPlayer->Damage[0] -= 80;
					if (pPlayer->Damage[0] < 0)
					{
						pPlayer->Damage[0] = 0;
					}
				}
				
				if (CheckRECTColl(pPlayer->DestRECT[1], pWeapons->Weapon[j]->DestRect, tmpOver))
				{
					pExplosions->CreateExplosion((pPlayer->DestRECT[1].left + pPlayer->DestRECT[1].right) / 2,
												(pPlayer->DestRECT[1].top + pPlayer->DestRECT[1].bottom) / 2, 2);
					
					pWeapons->Weapon[j]->Active = false;
					pPlayer->Damage[1] -= 80;
					if (pPlayer->Damage[1] < 0)
					{
						pPlayer->Damage[1] = 0;
					}
				}
				
				if (CheckRECTColl(pPlayer->DestRECT[2], pWeapons->Weapon[j]->DestRect, tmpOver))
				{
					pExplosions->CreateExplosion((pPlayer->DestRECT[2].left + pPlayer->DestRECT[2].right) / 2,
												(pPlayer->DestRECT[2].top + pPlayer->DestRECT[2].bottom) / 2, 3);
					
					
					pWeapons->Weapon[j]->Active = false;
					pPlayer->Damage[2] -= 80;
					if (pPlayer->Damage[2] < 0)
					{
						pPlayer->Damage[2] = 0;
					}
				}
			}
		}
	}
	
	
	
//	 ##----DRAWING----##  \\
	
	pInvaders->Draw();
	pWeapons->Draw();
	pPlayer->Draw();
	pExplosions->Draw();
	
	pTheDrawEngine->Flip();
	pTheDrawEngine->ClearBackBuffer();
	
	return SUCCESS;
}

// ***********************************************************

void GameShutdown()
// called after the game loop is finished
{
	// Release all memory and directX interfaces
	
	delete pInvaders;
	delete pExplosions;
	delete pWeapons;
	delete pPlayer;
	
	// (engines must be released last)
	pTheDrawEngine->Release();
	pTheSoundEngine->Release();
	pTheInputs->Release();
}

void InitRandom ()
{
	srand(time(NULL));
}

int GetRandNum (int LLimit, int ULimit)
{
	int rValue = 0;  // Used to store the return value
	
	if (LLimit == ULimit)
	{
		rValue = LLimit;
	}
	else if (ULimit < LLimit) // Incase the caller has them the wrong way round.
	{
		rValue = (rand() % (LLimit - ULimit + 1)) + ULimit;
	}
	else
	{
		rValue = (rand() % (ULimit - LLimit + 1)) + LLimit;
	}
	return rValue;
}
