//  FishDisplayG.h
//
//  Chris Nevison
//  January 16, 2000
//
//  Declares a graphical display for the Fish Simulation
//
//  This graphical display requires the CMU graphics library.
//  (CMUgraphics.h and CMUgraphicslib.lib)


#ifndef _FISHDISPLAYG_H
#define _FISHDISPLAYG_H

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


  