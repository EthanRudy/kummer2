// DISPLAY.CPP
// Display class implementation

#include "display.h"

// Constructor
Display::Display()
:power(OFF), MyValue(0.0)
{
}

// Method that turns on the radio's display
void Display::On()
{
  power = ON;
}

// Method that turns off the radio's display
void Display::Off()
{
  power = OFF;
}

// Method that creates the message for displaying the
// tuner frequency
void Display::FrequencyToDisplay(float value)
{
  MyValue = value;
}

// Method that displays the tuner frequency
void Display::DisplayMessage(ostream & out)
{
  out.setf(ios::fixed); // prevent E-notation
  out << setprecision(1) << MyValue << " MHz";
  out.unsetf(ios::fixed);
}