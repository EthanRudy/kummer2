// OOP.CPP
// This object-oriented program shows the use of simple objects which
// represent circles.

#include "circle.h"                  // contains the Circle class
#include <iostream.h>

int main()
{
 circle Circle_One;                  // instanciate objects
 circle Circle_Two;                  // of type circle
 float User_Radius;
 double Area;

 cout << "\nWhat is the radius of the the first circle? ";
 cin  >> User_Radius;

 Circle_One.SetRadius(User_Radius);  // Send a message to Circle_One telling
				     //  it to set its radius to User_Radius

 cout << "\nWhat is the radius of the second circle? ";
 cin  >> User_Radius;

 Circle_Two.SetRadius(User_Radius);  // Send a message to Circle_Two telling
				     //  it to set its radius to User_Radius

 Area = Circle_One.Area();           // Send a message to Circle_One asking
				     //  for its area
 cout.setf(ios::fixed);
 cout << "\nThe area of the first circle is " << Area << ".\n";

 Area = Circle_Two.Area();           // Send a message to Circle_Two asking
				     //  for its area

 cout << "\nThe area of the second circle is " << Area << ".\n";
 cout.unsetf(ios::fixed);
 return(0);
}