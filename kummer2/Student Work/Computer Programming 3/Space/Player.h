#ifndef PLAYER_H
#define PLAYER_H

#include "mydrawengine.h"

const double PLAYER_XACCELERATION = 0.7;
const double PLAYER_YACCELERATION = 0.7;
const double CoF                  = 0.03;

class CPlayer
{
private:
	double XVelocity;
	double YVelocity;
	double XAcceleration;
	double YAcceleration;
	MyPicture* pImage;
	RECT SrcHealthyRECT[3];
	RECT SrcDamagedRECT[12];
	int Frame[3];
	int TimeTillNextFrame[3];
	int FiringDelay;
	int ToFire;
	bool ReadyToFire;
	int DamageThreshhold;
public:
	CPlayer();
	~CPlayer();
	void Move();
	void Fire();
	void Draw();
	RECT DestRECT[3];
	double Damage[3];
	double XPosition;
	double YPosition;
};

#endif