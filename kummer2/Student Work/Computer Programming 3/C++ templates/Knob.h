// KNOB.H
// Knob class definition

#ifndef _KNOB_H
#define _KNOB_H

class Knob
{
  public:
    Knob(int UpperBound, int LowerBound); // constructor
    Knob(Knob & k);  // copy constructor

    void TurnClockwise();        // turn knob to the right
    void TurnCounterClockwise(); // turn knob to the left
    int  CurrentPosition();      // return current knob position

  private:
    int Current,  // current knob position
	Minimum,      // minimum allowed knob position
	Maximum;      // maximum allowed knob position
};

#endif