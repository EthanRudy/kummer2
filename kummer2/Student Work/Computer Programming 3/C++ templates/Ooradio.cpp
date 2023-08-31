// OORADIO.CPP
// Object-Oriented Radio Case Study
// Written by Greg Buxkemper
//

#include <iostream.h>
#include "radio.h"

void DisplayMenu();

int main()
{
  int   MenuChoice;
  Radio MyRadio;    // instanciate radio object

  do{
       DisplayMenu();
       cout << "Choice: ";
       cin >> MenuChoice;
       cout << endl;

       switch(MenuChoice)
       {
	     case 0 :  break;
	     case 1 :  MyRadio.Power.ChangeState();
		   break;
	     case 2 :  MyRadio.Volume.TurnClockwise();
		   break;
	     case 3 :  MyRadio.Volume.TurnCounterClockwise();
		   break;
	     case 4 :  MyRadio.Frequency.TurnClockwise();
		   break;
	     case 5 :  MyRadio.Frequency.TurnCounterClockwise();
		   break;
	     case 6 :  MyRadio.DisplayStatus(cout);
		   cout << endl;
		   break;
	     default:  cout << "Choice is not valid." << endl;
		   break;
       }
    }while(MenuChoice != 0);

  return 0;
}

void DisplayMenu()
{
  cout << " 0 - Quit" << endl
       << " 1 - Toggle Power Switch" << endl
       << " 2 - Turn Volume Knob Up" << endl
       << " 3 - Turn Volume Knob Down" << endl
       << " 4 - Turn Frequency Knob Up" << endl
       << " 5 - Turn Frequency Knob Down" << endl
       << " 6 - View Radio Information" << endl;
}