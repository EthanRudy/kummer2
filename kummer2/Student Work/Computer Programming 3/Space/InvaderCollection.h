#ifndef INVADERCOLLECTION_H
#define INVADERCOLLECTION_H

#include "Invader.h"

const int MAX_INVADER_COUNT = 40;
const int INIT_OFFSET_X    = 50;     // Starting X Position.
const int INIT_OFFSET_Y    = 50;     // Starting Y Position.
const int INVADER_STEP_X   = 1;      // Amount the Invaders move each time.
const int INVADER_STEP_Y   = 10;     // Amount the Invaders move each time.

class CInvaderCollection
{
private:
	RECT FrameSRECT[4];
	
	double FormX;
	double FormY;
	int DirectionX;
	double Speed;
	double aFrame[2];
public:
	CInvaderCollection();
	~CInvaderCollection();
	CInvader* Invader[MAX_INVADER_COUNT];
	void InitFormation();
	void MoveFormation();
	void Kill(int InvaderIndex);
	void Draw();
	void GetCollisionArray(RECT* Pics[]);
	RECT GetSrcRect(int InvaderIndex);
};

#endif