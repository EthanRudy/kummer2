#ifndef EXPLOSION_H
#define EXPLOSION_H

#include "mydrawengine.h"
#include "mysound.h"

class CExplosion
{
private:
	static MyPicture* pImage[4];
	static int Count;
	RECT SourceRECT;
	RECT DestRECT;
	int Type;
	int Frame;
	int FrameDelay;
	int TimeTillNextFrame;
	MySound* pSound;
public:
	void Create(int XPos, int YPos, int Type);
	void Animate();
	void Draw();
	bool Active;
	CExplosion();
	~CExplosion();
};


#endif