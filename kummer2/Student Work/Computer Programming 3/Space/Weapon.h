#ifndef WEAPON_H
#define WEAPON_H

#include "mydrawengine.h"
#include "mysound.h"

class CWeapon
{
private:
	static MyPicture* pImage;
	static int Count;
	static RECT FrameSRECT[4];
	
	double XPosition;
	double YPosition;
	double XVelocity;
	double YVelocity;
	MySound* pSound;
public:
	CWeapon();
	~CWeapon();
	void Create(double XPos, double YPos, double XVel, double YVel, int Owner);
	void Move();
	void Draw();
	RECT DestRect;
	int FiredBy;
	bool Active;
};

#endif