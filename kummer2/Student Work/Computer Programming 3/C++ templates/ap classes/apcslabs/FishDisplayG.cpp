//  FishDisplayG.cpp
//
//  Chris Nevison
//  January 16, 2000
//


#include "FishDisplayG.h"
#include "Position.h"

Display::Display(int numRows, int numCols)
: myWin(5+10*numCols, 7+10*numRows, 300, 10)
{
  int row, col;
  myWin.ChangeTitle("Fish");
  myWin.SetBuffering(true);

  for(row = 0; row < numRows; row++){
    for(col = 0; col < numCols; col++){
      myWin.SetPen(LIGHTBLUE, 2);
      myWin.SetBrush(LIGHTBLUE);
      myWin.DrawRectangle(10*col, 10*row,
                          10+10*col, 10+10*row, FILLED);
    }
  }
  myWin.UpdateBuffer();
}

void Display::Show(const Environment & env)
{
  int rows = env.NumRows();     
  int cols = env.NumCols();
  int numFish;
  int fishIndex = 0;
  int r, c;
  Position pos;        // position of fish to be displayed next

  apvector<Fish> fishList;
  fishList = env.AllFish();
  numFish = fishList.length();

  // find position of first fish to be displayed (if any)
  if (fishIndex < numFish)
  {
    pos = fishList[fishIndex].Location();
  }
  
  for (r = 0; r < rows; r++)
  {
    for (c = 0; c < cols; c++)
    {
      myWin.SetPen(LIGHTBLUE, 2);
      myWin.SetBrush(LIGHTBLUE);

      myWin.DrawRectangle(10*c, 10*r,
                          10+10*c, 10+10*r, FILLED);

      if (pos.Row() == r && pos.Col() == c)
      {
        DrawFish(r, c);

        fishIndex++;
        // find position of next fish to be displayed
        if (fishIndex < numFish)
        {
          pos = fishList[fishIndex].Location();
        }
        else  // no more fish to display
        {
          pos = Position();   // not in the grid, won't be displayed
        }
      }
    }  // finished processing all columns in a row
  }  // finished processing all rows in the grid
  myWin.UpdateBuffer();
}


void Display::DrawFish(int r, int c)
{
  myWin.SetPen(RED, 1);    
  myWin.SetBrush(RED);
  myWin.DrawEllipse(10*c+1, 10*r+4, 10*c+9, 10*r+7, FILLED);
}


