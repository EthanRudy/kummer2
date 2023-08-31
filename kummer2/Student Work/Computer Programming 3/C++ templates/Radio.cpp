// RADIO.CPP
// Radio class implementation

#include "radio.h"

// Constructor for radio object
Radio::Radio()
:Power(OFF), Volume(1,10), Frequency(1,103)
{
}

// Method to update the status of the radio object
void Radio::Update()
{
  if(Power.CurrentState() == OFF)
  { // If power is off, make sure each component is off
    MyAmp.Off();
    MyTuner.Off();
    MyDisplay.Off();
  }
  else
  { // If power is on, make sure each component is on
    MyAmp.On();
    MyTuner.On();
    MyDisplay.On();

    // Set volume to the current volume knob position
    MyAmp.Volume(Volume.CurrentPosition());
	// Set frequency to the current tuner knob position
    MyTuner.Frequency( (Frequency.CurrentPosition() * 0.2) + 87.3 );
	// Set display message to reflect current frequency
    MyDisplay.FrequencyToDisplay( MyTuner.CurrentFrequency());
  }
}

// Method to display the current status of the radio
void Radio::DisplayStatus(ostream & out)
{
  Update(); // Execute Update method to ensure that all
            // components are operating at current knob settings.
  if(Power.CurrentState() == OFF)
  {                            // If power is off,
    out << "Radio:" << endl    // display message indicating
	<< "------"  << endl       // that the power is off.
	<< "Power: OFF" << endl
	<< endl;
  }
  else
  {
	out.setf(ios::fixed);      // If power is on,
	out << "Radio:" << endl    // display current settings.
	<< "------" << endl
	<< "Power: ON" << endl
	<< "Volume: " << MyAmp.CurrentVolume() << endl
	<< "Frequency: " << setprecision(1) << MyTuner.CurrentFrequency()
	<< endl << "Display: [ ";
	out.unsetf(ios::fixed);

    MyDisplay.DisplayMessage(cout);  // Activate the radio's display

    out	<< " ]" << endl << endl;
  }
}