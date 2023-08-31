// Shipping Rates
//
// This program looks up the cost of shipping a package based on the
// package weight and the zone to which the package is to be shipped.

#include<iostream.h>
#include<iomanip.h>

// function prototypes
double get_weight();
int get_zone();

// global array of shipping rates
double ship_rate[6][8] = {
	     { 2.65,  2.75,  2.87,  3.06,  2.65,  3.35,  4.73,  6.13},
	     { 3.05,  3.18,  3.35,  3.84,  4.60,  5.58,  7.68,  9.33},
	     { 3.25,  3.40,  3.63,  4.24,  5.08,  6.13,  8.46, 10.38},
	     { 4.10,  4.28,  4.59,  5.34,  6.20,  7.39,  9.93, 11.85},
	     { 4.65,  4.95,  5.35,  6.23,  7.25,  8.66, 11.55, 13.58},
	     { 5.25,  5.49,  5.99,  6.90,  8.03,  9.69, 12.69, 15.49},
			};

int main()
 {
  double weight;          // weight of package
  int weight_category;   // weight category in table
  int zone;              // zone of package's destination

  weight = get_weight();  // call function to get package weight
  zone = get_zone();      // call function to get shipping zone number

  zone--; // Subtract one from the zone number so the number will
	  // correspond to the subscript of the array.

  weight_category = weight / 5.0; // Divide by 5 and truncate to get
				  // subscript for the array.

  cout.setf(ios::showpoint);
  cout << "The cost of shipping the package is $" << setprecision(4)
       << ship_rate[weight_category][zone] << '\n';
  return 0;
 }

double get_weight()
{
  double weight;
  do
   {
    cout << "Enter the weight of the package: ";
    cin >> weight;
    if (weight <= 0.0)
      { cout << "The weight cannot be less than or equal to zero\n"; }
    if (weight >= 30.0)
      { cout << "This program cannot provide rates for packages that\n"
	     << "weigh thirty pounds or more.\n"; }
   }
  while ((weight <= 0) || (weight >= 30.0));
  return(weight);
}

int get_zone()
{
  int zone;
  do
   {
    cout << "Enter the zone to which the package is being shipped: ";
    cin >> zone;
    if ((zone < 1) || (zone > 8))
     { cout << "The zones are numbered 1 through 8. Please enter again.\n"; }
   }
  while ((zone < 1) || (zone > 8));
  return(zone);
}
