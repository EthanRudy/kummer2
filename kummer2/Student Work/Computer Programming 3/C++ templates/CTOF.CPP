#include<iostream.h>

float celsius_to_fahrenheit(float celsius);

int main()
 {
  float fahrenheit;
  float celsius = 22.5;

  fahrenheit = celsius_to_fahrenheit(celsius);

  cout << celsius << " C = " << fahrenheit << " F\n";

  return 0;
 } 

float celsius_to_fahrenheit(float celsius)
 {
  return(celsius * (9.0/5.0) + 32.0);
 }

