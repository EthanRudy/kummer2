#include<iostream.h>
#include<iomanip.h>
#include<string.h>

main()
{
 double length_in_feet, converted_length, factor;
 int choice;
 char units[11];

 // Ask the user for the length to be converted
 cout << "What is the length in feet? ";
 cin >> length_in_feet;

 // Display the menu of conversion options
 cout << "\nTo what units would you like to convert the length?\n";
 cout << "1 - Inches\n";
 cout << "2 - Meters\n";
 cout << "3 - Yards\n";
 cout << "4 - Kilometers\n";
 cout << "Enter the number of the unit you want: ";
 cin >> choice;

 // Use a switch structure to set the conversion factor
 switch(choice)
  {
    case 1: // inches
	factor = 12.0;
	strcpy(units,"inches");
	break;
    case 2: // meters
	factor = 0.30479999;
	strcpy(units,"meters");
	break;
    case 3: // yards
	factor = 0.33333333;
	strcpy(units,"yards");
	break;
    case 4: // kilometers
	factor = 0.00030479;
	strcpy(units,"kilometers");
	break;
    default:
	factor = 0;
	break;
  }

 if (factor == 0) // check for illegal selection
   {
     cout << "Illegal selection--no result calculated\n";
   }
 else // if not illegal, do the conversion and print the output
   {
     converted_length = length_in_feet * factor;
     cout.setf(ios::fixed);
     cout << setprecision(3) << length_in_feet << " feet = "
	  << converted_length << " " << units << endl;
   }

 return 0;
}
