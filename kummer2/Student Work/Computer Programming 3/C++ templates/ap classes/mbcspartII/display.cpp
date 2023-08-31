// AP Computer Science Marine Biology Case Study program
// Copyright (C) 2000  College Board and Educational Testing Service

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// display.cpp - copyright statement added 5/31/2000


#include "display.h"
#include "environ.h"
#include "fish.h"
#include "utils.h"
#include <iomanip.h>
	//using namespace std;

// constructor

Display::Display()
// postcondition: ready to display an Environment
{
}

// public modifying function

void Display::Show(const Environment & env)
// postcondition: state of env written as text to cout
{
  const int WIDTH = 1;  // for each fish

  int rows = env.NumRows();
  int cols = env.NumCols();
  int fishIndex = 0;
  int numFish;
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
      if (pos.Row() == r && pos.Col() == c)
      {
        // this is a position with a fish
        cout << setw(WIDTH) << fishList[fishIndex].ShowMe();
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
      else  // this position has no fish
      {
        cout << setw(WIDTH) << ' ';
      }
    }  // finished processing all columns in a row
    cout << endl;
  }  // finished processing all rows in the grid
}

