//  histogr.h
//
//  Chris Nevison
//  January 24, 2000
//
//  Displays a given apvector as a histogram
//  Number of bars and max bar length are given when window is constructed

#ifndef _HISTOGR_H
#define _HISTOGR_H

#include <apvector.h>
#include <CMUgraphics.h>

class Histo{
public:

  Histo(int numBars, int maxLen);

  void Histogram(const apvector<int> & count);  
  // display a histogram of the values in count

private:
  void DrawBlock(int bar, int blocknum);
  // draw a block at the blocknum position (height) for
  // bar (horizontal position)

  int myMaxLen;
  window myWin;
};

#endif


  