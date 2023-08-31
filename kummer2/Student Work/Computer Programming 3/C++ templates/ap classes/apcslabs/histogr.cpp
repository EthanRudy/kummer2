//  histogr.cpp
//
//  Chris Nevison
//  January 24, 2000
//


#include "histogr.h"

Histo::Histo(int numBars, int maxLen)
: myMaxLen(maxLen),
  myWin(5+10*numBars, 7+10*maxLen, 300, 10)
{
  int row, col;
  myWin.ChangeTitle("Histogram");

  for(row = 0; row < myMaxLen; row++){
    for(col = 0; col < numBars; col++){
      myWin.SetPen(LIGHTBLUE, 2);
      myWin.SetBrush(LIGHTBLUE);
      myWin.DrawRectangle(10*col, 10*row,
                          10+10*col, 10+10*row, FILLED);
    }
  }
}

void Histo::DrawBlock(int bar, int blocknum)
{
  int row = myMaxLen - blocknum;
  myWin.SetPen(RED, 1);
  myWin.SetBrush(RED);
  myWin.DrawRectangle(10*bar+1, 10*row,
                          10+10*bar-1, 10+10*row, FILLED);
}

void Histo::Histogram(const apvector<int> & count)  // display histogram
{
}

