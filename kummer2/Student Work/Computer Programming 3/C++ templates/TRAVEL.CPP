// Travel Efficiency
// Programmer: Jonathan Kleid
// 
// Purpose: Calculates miles per gallon and price per mile when
// given miles traveled, number of gallons used, and gas price.

#include <iostream.h> // necessary for cin and cout commands

main()
{
  // Variable declarations
  float MilesTraveled;     // stores number of miles
  float GallonsUsed;       // stores number of total gallons used  
  float PricePerGallon;    // stores price per gallon 
  float PricePerMile;      // stores the price per mile
  float MilesPerGallon;    // stores the number of miles per gallon

  // Ask user for input values.
  cout << "How many miles did you travel? ";
  cin  >> MilesTraveled;
  cout << "How many gallons of gas did you use? "; 
  cin  >> GallonsUsed;   
  cout << "How much did one gallon of gas cost? $"; 
  cin  >> PricePerGallon;   

  // Divide the number of miles by the number of gallons to get MPG.
  MilesPerGallon = MilesTraveled / GallonsUsed;

  // Divide price per gallon by miles per gallon 
  // to get price per mile.
  PricePerMile = PricePerGallon / MilesPerGallon;

  // Output miles per gallon and price per mile.
  cout << "You got " << MilesPerGallon << " miles per gallon,\n"; 
  cout << "and each mile cost $" << PricePerMile << "\n"; 
  
  return 0;
}
