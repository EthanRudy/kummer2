// KNOB.CPP
// Knob class implementation

#include "knob.h"

// Constructor
Knob::Knob(int LowerBound, int UpperBound)
:Minimum(LowerBound), Maximum(UpperBound), Current(LowerBound)
{
}

// Copy constructor
Knob::Knob(Knob & k)
:Minimum(k.Minimum), Maximum(k.Maximum), Current(k.Current)
{
}

// Method that turns the knob clockwise by one notch unless
// the upper bound has been reached
void Knob::TurnClockwise()
{
  if(Current < Maximum)
    Current++;
}

// Method that turns the knob counter-clockwise by one notch
// unless the lower bound has been reached
void Knob::TurnCounterClockwise()
{
  if(Current > Minimum)
    Current--;
}

// Method that returns the current knob position
int Knob::CurrentPosition()
{
  return(Current);
}
