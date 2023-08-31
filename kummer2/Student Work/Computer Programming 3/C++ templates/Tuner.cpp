// TUNER.CPP
// Tuner class implementation

#include "tuner.h"

// Constructor
Tuner::Tuner()
:power(OFF), frequency(0.0)
{
}

// Method to turn the tuner on
void Tuner::On()
{
  power = ON;
}

// Method to turn the tuner off
void Tuner::Off()
{
  power = OFF;
}

// Method to set the tuner to a new frequency
void Tuner::Frequency(float NewFrequency)
{
  if(power == ON)
    frequency = NewFrequency;
}

// Method to return the current frequency
float Tuner::CurrentFrequency()
{
  return(frequency);
}