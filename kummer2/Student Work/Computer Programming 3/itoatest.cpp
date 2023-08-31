#include <iostream>
#include <stdlib.h>
#include<string>
using namespace std;

void main()
{

char charValue1[5],charValue2[5];
int value1, value2,sum;
string bob,n;

//using atoi to change char arrays into values
cout<<"Enter a # up to 4 digits:"<<endl;
cin.get(charValue1,5);
cin.ignore();
cout<<"Enter another # up to 4 digits:"<<endl;
cin.get(charValue2,5);
cin.ignore();

value1 = atoi(charValue1);
value2 = atoi(charValue2);

sum=value1+value2;
cout << sum << endl;

//using itoa to change values into char arrays
char buff[5];
itoa( sum, buff, 10 ); // itoa( integer, char array, base)     

cout << buff << endl;

for(int i=0;i<4;i++)
{ 
	cout<<buff[i]<<endl;
}

// using .data() to change strings to char arrays 
const char *chararray = 0;

cout<<"Enter a name:"<<endl;
cin>>n;

chararray=n.data();

cout<<chararray<<endl;

// adding strings and chararrays

bob=n+buff;

cout<<bob<<endl;

}
