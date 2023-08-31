// VECTOREX.CPP

#include <iostream.h>
#include "vector.h"

int main()
{
  vector <int> numVector(10,0);
  int number, counter, sum;
  float average;

  cout << "How many numbers do you want to average: ";
  cin >> number;

  if(number > numVector.length())
  {
    numVector.resize(number);
  }

  for(counter = 0, sum = 0; counter < number; counter++)
  {
    cout << "Number " << counter + 1 << " : ";
    cin >> numVector[counter];
    sum += numVector[counter];
  }

  average = float(sum)/float(number);

  cout.setf(ios::fixed);
  cout << "The average is " << average << ".\n";
  cout.unsetf(ios::fixed);
  return 0;
}