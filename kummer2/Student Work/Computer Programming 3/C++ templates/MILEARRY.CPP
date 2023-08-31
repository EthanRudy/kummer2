// Road Mileage Finder
// By Eric Hosch

#include<iostream.h>   // necessary for input/output

// function prototypes
void get_cities(int &originating_city, int &destination_city);

// main Function
void main()
{
 // Two dimensional array initialized with mileage between the cities
 int cities[10][10] = {{0,1037,674,440,795,1398,699,2182,841,2618},
		       {1037,0,963,840,1748,1949,695,2979,206,2976},
		       {674,963,0,287,917,996,266,2054,802,2013},
		       {440,840,287,0,920,1164,259,2179,647,2300},
		       {795,1748,917,920,0,781,1143,1387,1552,2078},
		       {1398,1949,996,1164,781,0,1253,1059,1771,1307},
		       {699,695,266,259,1143,1253,0,2311,637,2279},
		       {2182,2979,2054,2179,1387,1059,2311,0,2786,1131},
		       {841,206,802,647,1552,1771,637,2786,0,2815},
		       {2618,2976,2013,2300,2078,1307,2279,1131,2815,0}};

 int originating_city; // Holds the choice of the starting point
 int destination_city; // Holds the choice of the ending point
 char answer;          // Used for ending or not ending the loop

 do
  { // iterate until user chooses not to continue

   // call get_cities function to get input from the user
   get_cities(originating_city, destination_city);

   originating_city--;   // Decrement the number of the originating and
   destination_city--;   // destination cities for use in the array

   // index array using the decremented city numbers and print mileage
   cout << "\nMileage = " << cities[originating_city][destination_city]
	<< endl;

   // ask user if he/she wants to repeat look-up
   cout << "\nContinue? [Y]es [N]o: ";
   cin >> answer;
    // loop as long as user answers y or Y
  } while ((answer == 'y') || (answer == 'Y')); // end of do loop
} // end main function

// function that gets the input from the user
void get_cities(int &originating_city, int &destination_city)
 {
  cout << "\nOriginating City     Destination City\n";
  cout << "----------------     ----------------\n";
  cout << " 1 Atlanta            1 Atlanta\n";
  cout << " 2 Boston             2 Boston\n";       // Table of starting
  cout << " 3 Chicago            3 Chicago\n";      // and ending points
  cout << " 4 Cincinnati         4 Cincinnati\n";
  cout << " 5 Dallas             5 Dallas\n";
  cout << " 6 Denver             6 Denver\n";
  cout << " 7 Detroit            7 Detroit\n";
  cout << " 8 Los Angeles        8 Los Angeles\n";
  cout << " 9 New York           9 New York\n";
  cout << "10 Seattle           10 Seattle\n";

  cout << "\nOriginating City [1-10]: ";
  cin >> originating_city;

  cout << "\nDestination City [1-10]: ";
  cin >> destination_city;
 } // end of get_cities function
