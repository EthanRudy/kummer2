#ifndef WEAPONCOLLECTION_H
#define WEAPONCOLLECTION_H

#include "Weapon.h"

const int MAX_WEAPON_COUNT = 50;

class CWeaponCollection
{
public:
	CWeaponCollection();
	~CWeaponCollection();
	void Draw();
	void Move();
	void Create(double X, double Y, double XDirection, double YDirection, int FiredBy);
	CWeapon* Weapon[MAX_WEAPON_COUNT];
	RECT GetSrcRect(int WeaponIndex);
private:
	
};

#endif