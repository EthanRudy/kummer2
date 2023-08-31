// TSWITCH.CPP
// Toggle switch class implementation

#include "TSWITCH.H"

// Constructor
ToggleSwitch::ToggleSwitch()
:SwitchState(OFF)
{
}

// Constructor that allows you to specify the original
// state of the switch
ToggleSwitch::ToggleSwitch(int StartingState)
:SwitchState(StartingState)
{
}

// Copy constructor
ToggleSwitch::ToggleSwitch(ToggleSwitch & ts)
:SwitchState(ts.SwitchState)
{
}

// Method that toggles the position of the switch
void ToggleSwitch::ChangeState()
{
  SwitchState = !SwitchState;
}

// Method that returns the current state of the switch
int ToggleSwitch::CurrentState()
{
  return(SwitchState);
}