// Road Mileage Finder

#include <iostream.h>   // necessary for input/output
#include <fstream.h>    // necessary for file input/output
#include "matrix.h"     // necessary for matrix class

// function prototypes
void get_cities(int &originating_city, int &destination_city);

// main Function
int main()
{
 // Integer Matrix declared for the look-up table
 matrix <int> cities(10,10,0);

 int originating_city; // Holds the choice of the starting point
 int destination_city; // Holds the choice of the ending point
 int row_counter;      // Used to count rows in loops
 int column_counter;   // Used to count columns in loops
 char answer;          // Used for ending or not ending the loop
 ifstream input_file;  // Holds file pointer for input file


 input_file.open("mileage.dat",ios::in); //open file for input
 for(row_counter = 0 ; row_counter < 10 ; row_counter++)
 { // iterate through input file to get data for each row
   for(column_counter = 0 ; column_counter < 10 ; column_counter++)
   { // iterate through input file to get data for each column
     input_file >> cities[row_counter][column_counter];
   }
 }
 input_file.close();  // close the input file

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
  return 0;
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
