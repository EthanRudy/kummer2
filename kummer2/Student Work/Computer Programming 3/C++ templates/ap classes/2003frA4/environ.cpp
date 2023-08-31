#include "environ.h"
#include "fish.h"
#include "utils.h"

// constructor

Environment::Environment(istream & input)
  : myWorld(0,0),
    myFishCreated(0),
    myFishCount(0),
    myAlgae(0,0)
// precondition:  input is open for reading, in correct format
// postcondition: environment initialized and populated from input
{
  int numRows, numCols, row, col;

  if (input >> numRows >> numCols)    // resize the matrix
  {
    myWorld.resize(numRows, numCols);
    myAlgae.resize(numRows, numCols);
  }
  else
  {
    cerr << "reading rows/columns failed in Environment" << endl;
    exit(1);
  }
  while (input >> row >> col)
  {
    AddFish(Position(row, col));
  }
}

Environment::Environment(istream & input, istream & algaeIn)
  : myWorld(0,0),
    myFishCreated(0),
    myFishCount(0),
    myAlgae(0,0)
// precondition:  input is open for reading, in correct format
// postcondition: environment initialized and populated from input
{
  int numRows, numCols, row, col;

  if (input >> numRows >> numCols)    // resize the matrix
  {
    myWorld.resize(numRows, numCols);
    myAlgae.resize(numRows, numCols);
  }
  else
  {
    cerr << "reading rows/columns failed in Environment" << endl;
    exit(1);
  }
  while (input >> row >> col)
  {
    AddFish(Position(row, col));
  }
  
  if( algaeIn >> row >> col)
  {
    if(row != numRows || col != numCols)
    {
      cerr << "rows and columns for algae do not match in Environment" << endl;
      exit(1);
    }
    for(row = 0; row < numRows; row++)
    {
      for(col = 0; col< numCols; col++)
      {
        if(!(algaeIn >> myAlgae[row][col]))
        {
          cerr << "algae error in Environment" << endl;
          exit(1);
        }
      }
    }
  }
}

// public accessing functions

int Environment::NumRows() const
// postcondition: returns # rows in grid  
{
  return myWorld.numrows();
}

int Environment::NumCols() const
// postcondition: returns # columns in grid  
{
  return myWorld.numcols();
}

apvector<Fish> Environment::AllFish( ) const
// postcondition: returned vector (call it fishList) contains all fish
//                in top-down, left-right order:
//                top-left fish in fishList[0], 
//                bottom-right fish in fishList[fishList.length()-1];
//                # fish in environment is fishList.length()
{
  apvector<Fish> fishList(myFishCount);
  int r, c, k;
  int count = 0;
  apstring s = "";

  // look at all grid positions, store fish found in vector fishList

  for (r = 0; r < NumRows(); r++)
  {
    for (c = 0; c < NumCols(); c++)
    {
      if (! myWorld[r][c].IsUndefined())
      {
        fishList[count] = myWorld[r][c];
        count++;  
      }
    }
  }

  for (k = 0; k < count; k++) 
  {
    s += fishList[k].Location().ToString() + " ";
  }
  DebugPrint(5, "Fish vector = " + s);
  return fishList;
}      

bool Environment::IsEmpty(const Position & pos) const
// postcondition: returns true if pos in grid and no fish at pos,
//                returns false otherwise  
{
  if (! InRange(pos)) 
  {
    return false;    // debug msg printed in InRange
  }

  if (myWorld[pos.Row()][pos.Col()].IsUndefined())
  {
    return true;    // pos in grid and no fish at pos
  }

  DebugPrint(5, pos.ToString() + " contains a fish.");
  return false;
}

// public modifying functions

void Environment::Update(const Position & oldLoc, Fish & fish)
// precondition:  fish was located at oldLoc, has been updated
// postcondition: if (fish.Location() != oldLoc) then oldLoc is empty;
//                Fish fish is updated properly in this environment  
{
  Fish emptyFish;

  if (InRange(oldLoc))
  {
    if (myWorld[oldLoc.Row()][oldLoc.Col()].Id() != fish.Id())
    {
      cerr << "illegal fish move" << endl;
    }
    else
    {
      // Put an updated copy of fish in fish's current position.
      Position newLoc = fish.Location();
      myWorld[newLoc.Row()][newLoc.Col()] = fish;

      // If fish moved, empty out fish's old location.
      if (! (oldLoc == newLoc))
      {
        myWorld[oldLoc.Row()][oldLoc.Col()] = emptyFish;
      }
    }
  }
}

void Environment::AddFish(const Position & pos)
// precondition:  no fish already at pos, i.e., IsEmpty(pos)
// postcondition: fish created at pos
{
  if (! IsEmpty(pos))
  {
    cerr << "error, attempt to create fish at non-empty: " << pos << endl;
    return;
  }
  myFishCreated++;
  myWorld[pos.Row()][pos.Col()] = Fish(myFishCreated, pos);
  myFishCount++;
}

// private helper functions

bool Environment::InRange(const Position & pos) const
// postcondition: returns true if pos is in the grid,
//                returns false otherwise  
{
  if (0 <= pos.Row() && pos.Row() < NumRows() &&
      0 <= pos.Col() && pos.Col() < NumCols())
  {
    return true;
  }

  DebugPrint(5, pos.ToString() + " is out of range.");
  return false;
}

  // added methods

void Environment::RemoveFish(const Position & pos)
// precondition:  there is a fish at pos
// postcondition: there is no fish at pos, this environment is otherwise unchanged
{
  if (IsEmpty(pos))
  {
    cerr << "error, attempt to remove non-existent fish at: " << pos << endl;
    return;
  }

  myWorld[pos.Row()][pos.Col()] = Fish();
  myFishCount--;
}


int Environment::NumAlgaeAt(const Position & pos) const
// precondition:  pos is a valid position in the environment
// postcondition: returns the number of units of algae at pos
{
  return myAlgae[pos.Row()][pos.Col()];
}

void Environment::RemoveAlgae(const Position & pos, int numUnits)
// precondition:  algae at position pos exceeds numUnits
// postcondition: algae at position pos has been reduced by numUnits
{
  if(myAlgae[pos.Row()][pos.Col()] < numUnits)
  {
    cerr << "error, attempt to remove more algae than exists at: " << pos << endl;
    return;
  }

  myAlgae[pos.Row()][pos.Col()] -= numUnits;
}


