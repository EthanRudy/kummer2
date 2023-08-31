// SHARE.CPP
#include <iostream.h>

main()
{
  int number_of_people;  // declare number_of_people as an integer
  float money;           // declare money as a float
  float share;           // declare share as a float

  cout << "How many people need a share of the money? ";
  cin >> number_of_people;
  cout << "How much money is available to share among the people? ";
  cin >> money;

  share = money / number_of_people;

  cout << "Give each person $" << share << '\n';

  return 0;
}
