#include<iostream.h>

main()
{
 char city_name[25];
 unsigned long population;

 cout << "What is the name of your city or town? ";
 cin.get(city_name, 24);
 cin.ignore(80,'\n');

 cout << "What is the population of the city or town? ";
 cin >> population;

 return 0;
}
