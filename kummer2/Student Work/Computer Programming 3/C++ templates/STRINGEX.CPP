// STRINGEX.CPP

#include <iostream.h>
#include "oostring.h"

int main()
{
  oostring FirstString;
  oostring SecondString("Hello, World!");
  oostring ThirdString(SecondString);
  oostring FourthString("World");
  int length,
      location;
  bool flag;
  char ch;
  char * StandardString;

  length = SecondString.length();

  location = SecondString.find(FourthString);
  location = SecondString.find('W');

  FirstString = SecondString.substr(0, 5);

  StandardString = FourthString.c_str();

  FirstString = SecondString;
  FirstString = "Goodbye, World!";
  FirstString = 'A';

  FirstString[0] = 'B';
  ch = FirstString[0];

  FirstString = "Hello";
  SecondString = "World";

  FirstString += ", ";
  FirstString += SecondString;
  FirstString += '!';

  cout << FirstString << endl;
  cout << "Please enter a string ( no spaces or tabs please ): ";
  cin  >> SecondString;
  cout << "Please enter another string ( spaces and tabs are ok ): ";
  getline(cin, ThirdString);


  flag = FirstString == SecondString;
  flag = FirstString != SecondString;
  flag = FirstString <  SecondString;
  flag = FirstString <= SecondString;
  flag = FirstString >  SecondString;
  flag = FirstString >= SecondString;

  ThirdString = "BCD....WXY";
  FirstString = SecondString + ThirdString;
  FirstString = 'A' + ThirdString;
  FirstString = ThirdString + 'Z';

  return(0);
}