#include <iostream.h>
#include <stdlib.h>

void main()
{

char charValue[5];

cout<<"Enter a # up to 4 digits:<<endl;
cin.get(charValue,5);
cin.ignore();
int value;
value = atoi(charValue);
cout << value << endl;


char buff[5];
itoa( value, buff, 10 );      

cout << buff << endl;

}
