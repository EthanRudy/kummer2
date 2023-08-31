#include <iostream.h>

const char ERROR = '\0';

main()
{
 int num_reps;
 int i;         // counter used by for loop
 int democrats = 0, republicans = 0, independents = 0;
 char party;

 cout << "\nHow many U.S. Representatives does your state have? ";
 cin  >> num_reps;  // ask user for number of representatives

 cout << "Enter the party affiliation for each Representative.\n";
 cout << "Enter D for Democrat, R for Republican,\n";
 cout << "and I for independents or other parties.\n";
 for (i = 1; i <= num_reps; i++)
  {
   do
    {
     cout << "Party of representative #" << i << ": ";
     cin  >> party;
     switch(party)
      {
       case 'D':
       case 'd':         // if democrat,
        democrats++;     // increment democrats counter
        break;
       case 'R':
       case 'r':         // if republican,
        republicans++;   // increment republicans counter
        break;
       case 'I':
       case 'i':         // if independent or other,
        independents++;  // increment independents counter
        break;
       default:
        cout << "Invalid entry. Enter D, R, or I.\n";
        party = ERROR;
        break;
      } // end of switch structure
    } while (party == ERROR); // loop again if invalid choice is made
  } // end of for loop
 cout << "\nYour state is represented by " << democrats << " Democrats, "
      << republicans << " Republicans,\nand " << independents
      << " independents and members of other parties.\n\n";
 return 0;
} // end of program
