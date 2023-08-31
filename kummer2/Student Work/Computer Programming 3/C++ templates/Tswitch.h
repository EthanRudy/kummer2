// TSWITCH.H
// Toggle switch class definition

#ifndef _TOGGLE_SWITCH_H
#define _TOGGLE_SWITCH_H

#include "on_off.h" // defines the constants ON and OFF

class ToggleSwitch
{
  public:
    ToggleSwitch(); // constructor
    ToggleSwitch(int StartingState); // constructor with init
    ToggleSwitch(ToggleSwitch & ts); // copy constructor

    void ChangeState();  // toggle the switch
    int  CurrentState(); // return current switch position

  private:
    int SwitchState; // stores the current switch position
};

#endif