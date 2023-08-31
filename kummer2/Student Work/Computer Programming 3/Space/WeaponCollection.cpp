#include "WeaponCollection.h"

CWeaponCollection::CWeaponCollection()
{
	int i;
	
	for (i = 0; i < MAX_WEAPON_COUNT; i++)
	{
		Weapon[i] = new CWeapon;
	}
}

CWeaponCollection::~CWeaponCollection()
{
	int i;
	
	for (i = 0; i < MAX_WEAPON_COUNT; i++)
	{
		delete Weapon[i];
	}
}

void CWeaponCollection::Draw()
{
	int i;
	
	for (i = 0; i < MAX_WEAPON_COUNT; i++)
	{
		if (Weapon[i]->Active)
		{
			Weapon[i]->Draw();
		}
	}
}

void CWeaponCollection::Move()
{
	int i;
	
	for (i = 0; i < MAX_WEAPON_COUNT; i++)
	{
		if (Weapon[i]->Active)
		{
			Weapon[i]->Move();
		}
	}
}

void CWeaponCollection::Create(double XPos, double YPos, double XDirection, double YDirection, int FiredBy)
{
	int i;
	
	for (i = 0; i < MAX_WEAPON_COUNT; i++)
	{
		if (!Weapon[i]->Active)
		{
			Weapon[i]->Create(XPos, YPos, XDirection, YDirection, FiredBy);
			return;
		}
	}
}
