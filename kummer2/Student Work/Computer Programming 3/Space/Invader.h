#ifndef INVADER_H
#define INVADER_H

#include "mydrawengine.h"
#include "ExplosionCollection.h"

const int INVADERS_PER_ROW = 10;     // Amount of Invaders on Each Row.
const int INVADER_SPACING  = 50;     // Distance Between Invaders.
const int FIRING_RATE      = 400;    // Duration Between Invader Shots.

class CInvader
{
private:
	static MyPicture* pImage;
	static int Count;
	int FormXPos;
	int FormYPos;
	int TimeTillFire;
public:
	bool Active;
	void Draw(RECT Source);
	void FormationMoved(int X, int Y);
	void Init(int FormationX, int FormationY);
	bool ReachedEnd();
	RECT GetCollisionRECT();
	RECT GetSrcRECT();
	RECT DestRect;
	bool IsUnder;
	CInvader();
	~CInvader();
};


#endif
