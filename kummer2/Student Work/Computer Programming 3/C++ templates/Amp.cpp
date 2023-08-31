// AMP.CPP
// Amplifier class implementation

#include "amp.h"

// Constructor
Amplifier::Amplifier()
:power(OFF), volume(0)
{
}

// Method that turns on the amplifier
void Amplifier::On()
{
  power = ON;
}

// Method that turns off the amplifier
void Amplifier::Off()
{
  power = OFF;
}

// Method that sets a new amplifier volume
void Amplifier::Volume(int NewVolume)
{
  if(power == ON)
    volume = NewVolume;
}

// Method that returns the current volume setting
int Amplifier::CurrentVolume()
{
  return(volume);
}