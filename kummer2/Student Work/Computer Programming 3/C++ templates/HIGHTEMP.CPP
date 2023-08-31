// HIGHTEMP
// This program averages the high temperatures over a user-defined
// number of days.

#include<iostream.h>
#include<iomanip.h>

int main()
{
  const int array_size = 32;  // constant to define size of array
  int daily_temp[array_size]; // array of daily high temperatures
  int num_values;             // number of days in a row to enter values
  int index;                  // index for loop counter and array access
  float average_high;         // calculated average high temperature
  int total = 0;              // used to total temps before averaging

  do  // loop to ask for number of days until valid input is received
  {
    cout << "Enter the number of days for which you have data: ";
    cin >> num_values;
    if ((num_values < 1) || (num_values > array_size - 1))
     {
      cout << "The number of days must be in the range 1 to "
	   << array_size - 1 << endl;
     }
  } while ((num_values < 1) || (num_values > array_size - 1));

  // The following loop gets the high temperatures from the user for as
  // many days as the user specified in num_values. The subscript 0 is
  // not used so that the subscript will correspond with the day number.
  for(index = 1; index <= num_values; index++)
   {
    cout << "Enter the high temperature for day " << index << ": ";
    cin >> daily_temp[index];  // input value into array
   }

  // Print the values in the array to the screen.
  cout << "The array contains high temperatures for " << num_values
       << " days.\n";
  cout << "The values are as follows.\n";
  for(index = 1; index <= num_values; index++)
   {
    cout << "Day " << index << ": " << daily_temp[index] << endl;
    total = total + daily_temp[index]; // update total for averaging
   }

  // Calculate average by typecasting total and num_values to floats
  // before dividing and assigning the result to average_high.
  average_high = (float) total / (float) num_values;

  // Print the results to the screen.
  cout << "The average high temperature during the " << num_values
       << "-day period was " << setprecision(2) << average_high
       << " degrees.\n";

  return 0;
}
