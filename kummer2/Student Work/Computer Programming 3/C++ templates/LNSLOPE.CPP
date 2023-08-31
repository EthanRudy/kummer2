// LNSLOPE
// This program calculates the slope of a line.

#include <iostream.h>

// Global structure declarations
struct point
  {
    float x;
    float y;
  };

struct line
  {
    point p1;
    point p2;
  };

// function declaration
float slope(line theLine);

//begin main function
int main()
{
 line L;
 float m;

 cout << "Enter the x coordinate of P1: ";
 cin >> L.p1.x;
 cout << "Enter the y coordinate of P1: ";
 cin >> L.p1.y;
 cout << "Enter the x coordinate of P2: ";
 cin >> L.p2.x;
 cout << "Enter the y coordinate of P2: ";
 cin >> L.p2.y;

 m = slope(L); // pass the line to the slope function

 cout << "The slope of the line is " << m << endl;

 return 0;
} // end of main function

//begin slope function
float slope(line theLine)
{
 return((theLine.p2.y - theLine.p1.y) / (theLine.p2.x - theLine.p1.x));
} //end slope function
