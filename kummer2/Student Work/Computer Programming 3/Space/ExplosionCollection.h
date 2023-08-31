#ifndef EXPLOSIONCOLLECTION_H
#define EXPLOSIONCOLLECTION_H

#include "Explosion.h"

const int MAX_EXPLOSION_COUNT = 60;

class CExplosionCollection
{
public:
	void CreateExplosion(int XPos, int YPos, int Type);
	void Animate();
	void Draw();
	void StopAllExplosions();
	CExplosionCollection();
	~CExplosionCollection();
private:
	CExplosion* Explosion[MAX_EXPLOSION_COUNT];
	int CurPos;
};



#endif