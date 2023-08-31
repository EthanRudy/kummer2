// DISPLAY.H
// Radio display class definition

#ifndef _DISPLAY_H
#define _DISPLAY_H

#include <iostream.h>
#include <iomanip.h>
#include <string.h>
#include "on_off.h"  // defines the constants ON and OFF

class Display
{
  public:
    Display();  // constructor

    void On();  // turn display on
    void Off(); // turn display off
    void FrequencyToDisplay(float value); // set message
    void DisplayMessage(ostream &); // display message

  private:
    int    power;     // power status (on or off)
    float  MyValue;   // frequency value for display
};                    

#endif