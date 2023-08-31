// RADIO.H
// Radio class definition

#ifndef _RADIO_H
#define _RADIO_H

#include <iostream.h>
#include "on_off.h"  // defines the constants ON and OFF
#include "tswitch.h" // toggle switch class
#include "knob.h"    // knob class
#include "amp.h"     // amplifier class
#include "tuner.h"   // tuner class
#include "display.h" // display class

class Radio
{
  public:
    Radio(); // constructor

    void Update();  // updates the status of components
    void DisplayStatus(ostream &);  // displays radio status

    ToggleSwitch Power;  // power switch
    Knob Volume,         // volume knob
         Frequency;      // tuner knob

  private:
    Amplifier    MyAmp;     // amplifier
    Tuner        MyTuner;   // tuner
    Display      MyDisplay; // radio display
};

#endif