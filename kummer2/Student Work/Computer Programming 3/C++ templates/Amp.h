// AMP.H
// Amplifier class definition

#ifndef _AMPLIFIER_H
#define _AMPLIFIER_H

#include "on_off.h" // defines the constants ON and OFF

class Amplifier
{
  public:
    Amplifier(); // constructor

    void On();                  // turn amplifier on
    void Off();                 // turn amplifier off
    void Volume(int NewVolume); // set amplifier volume
    int  CurrentVolume();       // return current volume

  private:
    int power, // power status (on or off)
	volume;    // volume level
};

#endif