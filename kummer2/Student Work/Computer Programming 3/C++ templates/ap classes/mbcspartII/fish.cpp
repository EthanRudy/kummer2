// AP Computer Science Marine Biology Case Study program
// Copyright (C) 2000  College Board and Educational Testing Service

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// fish.cpp - copyright statement added 5/31/2000

#include "fish.h"
#include "environ.h"
#include "randgen.h"
#include "position.h"
#include "nbrhood.h"
#include "utils.h"

// constructors

Fish::Fish()
  : myId(0),
    amIDefined(false)
// postcondition: IsUndefined() == true
{

}

Fish::Fish(int id, const Position & pos)
  : myId(id),
    myPos(pos),
    amIDefined(true)
// postcondition: Location() returns pos, Id() returns id,
//                IsUndefined() == false
{

}

// public accessing functions

int Fish::Id() const
// precondition:  ! IsUndefined()
// postcondition: returns id number of fish
{
  return myId;
}

Position Fish::Location() const
// postcondition: returns current fish position
{
  return myPos;
}

bool Fish::IsUndefined() const
// postcondition: returns true if constructed via default constructor,
//                false otherwise
{
  return ! amIDefined;
}

apstring Fish::ToString() const
// postcondition: returns a stringized form of Fish
{
  return IntToString(myId) + " " + myPos.ToString();
}

// public modifying functions

void Fish::Move(Environment & env)
// precondition:  Fish stored in env at Location()
// postcondition: Fish has moved to a new location in env (if possible)
{
  RandGen randomVals;
  Neighborhood nbrs = EmptyNeighbors(env, myPos);
  DebugPrint(3, nbrs.ToString());

  if (nbrs.Size() > 0)
  {
    // there were some empty neighbors, so randomly choose one
    Position oldPos = myPos;
    myPos = nbrs.Select(randomVals.RandInt(0, nbrs.Size() - 1));
    DebugPrint(1, "Fish at " + oldPos.ToString() + " moves to " + myPos.ToString());

    env.Update(oldPos, *this); // *this means this fish

  }
  else
  {
    DebugPrint(1, "Fish " + ToString() + " can't move.");
  }
}

char Fish::ShowMe() const
// postcondition: returns a character that can make me visible
{
  if (1 <= Id() && Id() <= 26)
  {
    return 'A' + (Id() - 1);
  }
  return '*';
}

// private helper functions

Neighborhood Fish::EmptyNeighbors(const Environment & env,
                                  const Position & pos) const
//  precondition:  pos is in the grid being modelled
//  postcondition: returns a Neighborhood of pos of empty positions
{
  Neighborhood nbrs;

  AddIfEmpty(env, nbrs, pos.North());
  AddIfEmpty(env, nbrs, pos.South());
  AddIfEmpty(env, nbrs, pos.East());
  AddIfEmpty(env, nbrs, pos.West());
  
  return nbrs;
}

void Fish::AddIfEmpty(const Environment & env,
                      Neighborhood & nbrs, const Position & pos) const
// postcondition: pos is added to nbrs if pos in env and empty
{
  if (env.IsEmpty(pos))
  {
    nbrs.Add(pos);
  }
}

// free functions

ostream & operator << (ostream & out, const Fish & fish)
// postcondition: fish inserted onto stream out
{
  out << fish.ToString();
  return out;
}




