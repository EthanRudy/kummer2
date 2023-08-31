#include "InvaderCollection.h"
#include "mysound.h"
extern int GetRandNum (int LLimit, int ULimit);
extern CExplosionCollection* pExplosions;
extern MySound* pExplosionSound;

CInvaderCollection::CInvaderCollection()
{
	int i;
	
	// Create RECTs for all the possible frames...
	FrameSRECT[0].top    = 0;
	FrameSRECT[0].bottom = 19;
	FrameSRECT[0].left   = 0;
	FrameSRECT[0].right  = 19;
	
	FrameSRECT[1].top    = 0;
	FrameSRECT[1].bottom = 19;
	FrameSRECT[1].left   = 20;
	FrameSRECT[1].right  = 39;
	
	FrameSRECT[2].top    = 0;
	FrameSRECT[2].bottom = 19;
	FrameSRECT[2].left   = 40;
	FrameSRECT[2].right  = 59;
	
	FrameSRECT[3].top    = 0;
	FrameSRECT[3].bottom = 19;
	FrameSRECT[3].left   = 60;
	FrameSRECT[3].right  = 79;
	
	// Set the formations initial position...
	FormX = INIT_OFFSET_X;
	FormY = INIT_OFFSET_Y;
	
	// Create all the Invader classes...
	for (i = 0; i < MAX_INVADER_COUNT; i++)
	{
		Invader[i] = new CInvader;
	}
	
	// Set Initial Speed and direction...
	Speed = INVADER_STEP_X;
	DirectionX = 1;
	
	// Set the starting frames...
	aFrame[0] = 0;
	aFrame[1] = 3;
}

CInvaderCollection::~CInvaderCollection()
{
	int i;
	
	// Destroy all the Invader classes...
	for (i = 0; i < MAX_INVADER_COUNT; i++)
	{
		delete Invader[i];
	}
}

void CInvaderCollection::InitFormation()
{
	int i;
	int PlaceX = 0;
	int PlaceY = 0;
	
	for (i = 0; i < MAX_INVADER_COUNT; i++)
	{
		// Set Invaders position in the formation...
		Invader[i]->Init(PlaceX, PlaceY);
		// Tell the Invader where the formation is based...
		Invader[i]->FormationMoved(INIT_OFFSET_X, INIT_OFFSET_Y);
		
		PlaceX++;
		if (PlaceX == INVADERS_PER_ROW)
		{
			PlaceY++;
			PlaceX = 0;
		}
	}
	
	PlaceX = 0;
	PlaceY = 0;
	
	for (i = 0; i < MAX_INVADER_COUNT; i++)
	{
		if (PlaceY == (MAX_INVADER_COUNT / INVADERS_PER_ROW) - 1)
		{
			Invader[i]->IsUnder = false;
		}
		else
		{
			Invader[i]->IsUnder = true;
		}
		
		PlaceX++;
		if (PlaceX == INVADERS_PER_ROW)
		{
			PlaceY++;
			PlaceX = 0;
		}
	}
}

void CInvaderCollection::MoveFormation()
{
	int i;
	bool TurnRound = false;
	
	Speed += 0.002;
	FormX += DirectionX * Speed;
	
	for (i = 0; i < MAX_INVADER_COUNT; i++)
	{
		Invader[i]->FormationMoved((int)FormX, (int)FormY);
		
		// Check if its on turning point...
		if (Invader[i]->ReachedEnd())
		{
			TurnRound = true;
		}
	}
	
	if (TurnRound)
	{
		// Reverse the direction of Invaders...
		DirectionX *= -1;
		FormY += INVADER_STEP_Y;
	}
}

void CInvaderCollection::Kill(int InvaderIndex)
{
	int i;
	
	if (Invader[InvaderIndex]->Active)
	{
		Invader[InvaderIndex]->Active = false;
		pExplosions->CreateExplosion((Invader[InvaderIndex]->DestRect.left + Invader[InvaderIndex]->DestRect.right) / 2,
			                         (Invader[InvaderIndex]->DestRect.top + Invader[InvaderIndex]->DestRect.bottom) / 2, 2);
		
		if (!Invader[InvaderIndex]->IsUnder)
		{
			if (InvaderIndex - INVADERS_PER_ROW >= 0)
			{
				for (i = InvaderIndex - INVADERS_PER_ROW; 
					 i >= 0; 
					 i -= INVADERS_PER_ROW)
				{
					if (Invader[i]->Active)
					{
						Invader[i]->IsUnder = false;
						break;
					}
				}
			}
		}
	}
}

void CInvaderCollection::Draw()
{
	int i;
	int PlaceX = 0;
	int PlaceY = 0;
	int f = 0;
	int Frame = 0;
	
	aFrame[0] += 0.1;
	if (aFrame[0] >= 6)
	{
		aFrame[0] = 0;
	}
	
	aFrame[1] += 0.1;
	if (aFrame[1] >= 6)
	{
		aFrame[1] = 0;
	}
	
	for (i = 0; i < MAX_INVADER_COUNT; i++)
	{
		if (Invader[i]->Active)
		{
			// Find out which frame this Invader uses...
			if ((i % 2) == 1)
			{
				if ((i / INVADERS_PER_ROW) % 2 == 1)
				{
					Frame = (int)aFrame[0];
				}
				else
				{
					Frame = (int)aFrame[1];
				}
			}
			else
			{
				if ((i / INVADERS_PER_ROW) % 2 == 1)
				{
					Frame = (int)aFrame[1];
				}
				else
				{
					Frame = (int)aFrame[0];
				}
			}
			
			if (Frame >= 4)
			{
				Frame = 6 - Frame;
			}
			
			
			Invader[i]->Draw(FrameSRECT[Frame]);
		}
		
		
		PlaceX++;
		if (PlaceX == INVADERS_PER_ROW)
		{
			PlaceY++;
			PlaceX = 0;
		}
	}
}
