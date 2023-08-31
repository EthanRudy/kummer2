#include<iostream.h>

void print_title();    // prototype for print_title function
void print_goodbye();  // prototype for print_goodbye function


int main()
 {
  print_title();      // call to print_title

  // insert the rest of the program here

  print_goodbye();

  return 0;
 } // end of main function


// Function to print program title to screen.
void print_title()
 {
  cout << "Tennis Tournament Scheduler Program\n";
  cout << "By Jennifer Baker\n";
 }

// Function to print closing message to screen.
void print_goodbye()
 {
  cout << "Thank you for using the Tennis Tournament Scheduler.\n";
 }
