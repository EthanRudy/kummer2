#include "ExplosionCollection.h"


CExplosionCollection::CExplosionCollection()
{
	int i;
	
	for (i = 0; i < MAX_EXPLOSION_COUNT; i++)
	{
		Explosion[i] = new CExplosion;
	}
	
	CurPos = 0;
}

CExplosionCollection::~CExplosionCollection()
{
	int i;
	
	for (i = 0; i < MAX_EXPLOSION_COUNT; i++)
	{
		delete Explosion[i];
	}
}

void CExplosionCollection::Animate()
{
	int i;
	
	for (i = 0; i < MAX_EXPLOSION_COUNT; i++)
	{
		if (Explosion[i]->Active)
		{
			Explosion[i]->Animate();
		}
	}
}

void CExplosionCollection::Draw()
{
	int i;
	
	for (i = 0; i < MAX_EXPLOSION_COUNT; i++)
	{
		if (Explosion[i]->Active)
		{
			Explosion[i]->Draw();
		}
	}
}

void CExplosionCollection::CreateExplosion(int XPos, int YPos, int Type)
{
	int i;
	
	for (i = CurPos; i < MAX_EXPLOSION_COUNT; i++)
	{
		// Find the next Explosion object that isn't active...
		if (!Explosion[i]->Active)
		{
			// Use this explosion object...
			Explosion[i]->Create(XPos, YPos, Type);
			
			CurPos = i + 1;
			if (CurPos == MAX_EXPLOSION_COUNT)
			{
				CurPos = 0;
			}
			// No need to contine anymore...
			return;
		}
	}
	
	
	for (i = 0; i < CurPos; i++)
	{
		// Find the next Explosion object that isn't active...
		if (!Explosion[i]->Active)
		{
			// Use this explosion object...
			Explosion[i]->Create(XPos, YPos, Type);
			
			CurPos = i + 1;
			if (CurPos == MAX_EXPLOSION_COUNT)
			{
				CurPos = 0;
			}
			// No need to contine anymore...
			return;
		}
	}
}

void CExplosionCollection::StopAllExplosions()
{
	int i;
	
	for (i = 0; i < MAX_EXPLOSION_COUNT; i++)
	{
		Explosion[i]->Active = false;
	}
}