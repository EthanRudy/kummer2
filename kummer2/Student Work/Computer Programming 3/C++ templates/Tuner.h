// TUNER.H
// Tuner class definition

#ifndef _TUNER_H
#define _TUNER_H

#include "on_off.h"  // defines the constants ON and OFF

class Tuner
{
  public:
    Tuner();  // constructor

    void  On();  // turn tuner on
    void  Off(); // turn tuner off
    void  Frequency(float NewFrequency); // set tuner frequency
    float CurrentFrequency(); // return current tuner frequency

  private:
    int power;       // power status (on or off)
    float frequency; // stores tuner frequency
};

#endif