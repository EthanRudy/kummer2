#include "fish.h"
#include "environ.h"
#include "randgen.h"
#include "position.h"
#include "nbrhood.h"
#include "utils.h"

// constructors

Fish::Fish()
  : myId(0),
    amIDefined(false),
    myStepsSinceFed(0)
// postcondition: IsUndefined() == true
{

}

Fish::Fish(int id, const Position & pos)
  : myId(id),
    myPos(pos),
    amIDefined(true),
    myStepsSinceFed(0)
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

/*
  Modified Move function is given below. This modification was not part
  of the required code for the question, but fits the description of the
  modifications.

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
    DebugPrint(1, "Fish " + ToString() + " moves to " + myPos.ToString());

    env.Update(oldPos, *this); // *this means this fish

  }
  else
  {
    DebugPrint(1, "Fish " + ToString() + " can't move.");
  }
}
*/

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


bool Fish::operator <(const Fish & rhs) const
{
  return (Location().Row() < rhs.Location().Row()) ||
         (Location().Row() == rhs.Location().Row() && Location().Col() < rhs.Location().Col());
}

  // added member function

void Fish::Act(Environment & env)
// precondition:  this Fish is stored in env at Location()
// postcondition: if there was algae at Location(), this Fish ate
//                and one unit of algae has been removed from
//                Location(); otherwise, if this was the third
//                consecutive step that this Fish did not eat,
//                then this Fish has been removed from env;
//                otherwise, this Fish moved.
//                myStepsSinceFed has been updated.
{
  if(env.NumAlgaeAt(Location()) > 0)
  {
    myStepsSinceFed = 0;
    env.Update(Location(), *this);
    env.RemoveAlgae(Location(), 1);
  }
  else if(myStepsSinceFed >= 2)
  {
    env.RemoveFish(Location());
  }
  else
  {
    Move(env);
    myStepsSinceFed++;
    env.Update(Location(), *this);
  }
}


Position Fish::MostAlgae(const Environment & env,
                         const Neighborhood & nbrs) const
// precondition:  nbrs.Size() > 0
// postcondition: returns a Position from nbrs that contains
//                the most algae
/*
{
  int maxIndex = 0;
  int k;

  for(k = 1; k < nbrs.Size(); k++)
  {
    if(env.NumAlgaeAt(nbrs.Select(k)) > env.NumAlgaeAt(nbrs.Select(maxIndex)))
      maxIndex = k;
  }
  return nbrs.Select(maxIndex);
}
*/
// alternate
{
  Position maxPos = nbrs.Select(0);
  int max = env.NumAlgaeAt(maxPos);
  int k;

  for(k = 1; k < nbrs.Size(); k++)
  {
    if(env.NumAlgaeAt(nbrs.Select(k)) > max)
    {
      maxPos =  nbrs.Select(k);
      max = env.NumAlgaeAt(maxPos);
    }
  }
  return maxPos;
}



//  Modified Move. This modification was not part
//  of the required code for the question, but fits the description of the
//  modifications.

void Fish::Move(Environment & env)
// precondition:  Fish stored in env at Location()
// postcondition: Fish has moved to a new location in env (if possible)
{
  RandGen randomVals;
  Neighborhood nbrs = EmptyNeighbors(env, myPos);
  DebugPrint(3, nbrs.ToString());

  if (nbrs.Size() > 0)
  {
    // choose the empty neighbor with the most algae
    Position oldPos = myPos;
    myPos = MostAlgae(env, nbrs);
    DebugPrint(1, "Fish " + ToString() + " moves to " + myPos.ToString());

    env.Update(oldPos, *this); // *this means this fish

  }
  else
  {
    DebugPrint(1, "Fish " + ToString() + " can't move.");
  }
}

