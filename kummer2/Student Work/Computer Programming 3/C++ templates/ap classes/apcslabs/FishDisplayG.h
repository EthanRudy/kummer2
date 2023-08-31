//  FishDisplayG.h
//
//  Chris Nevison
//  October 13, 1998
//
//  Displays a rectangular maze, as represented in maze.h
//  Provides functions for marking positions checked or path to goal.
#ifndef _MAZEDISPLAY_H
#define _MAZEDISPLAY_H

#include "environ.h"
#include <CMUgraphics.h>

class Display{
public:

  Display(int numRows, int numCols);

  void Show(const Environment& env);  // display state of env

private:
  void DrawFish(int r, int c);

  window myWin;
};

#endif


  