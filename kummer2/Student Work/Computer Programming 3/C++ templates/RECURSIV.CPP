// RECURSIV.CPP
// A simple example of recursion.
// By Macneil Shonle

#include<iostream.h>  // necessary for stream I/O

// function prototype
void PrintHello(int How_Many_Times);

// main function
int main()
{
 int n;

 cout << "How many times do you want to print the message? ";
 cin >> n;
 PrintHello(n);

 return 0;
}

// recursive function
void PrintHello(int How_Many_Times)
{
 cout << "Recursive function begins with the parameter value "
      << How_Many_Times << ".\n";
 if(How_Many_Times > 0)   // If How_Many_Times is greater than zero,
  {                       // make another recursive call.
   cout << "Hello\n";
   PrintHello(How_Many_Times - 1); // Reduce How_Many_Times by one.
  }
 cout << "Recursive function with parameter value " << How_Many_Times
      << " ends.\n";
}
