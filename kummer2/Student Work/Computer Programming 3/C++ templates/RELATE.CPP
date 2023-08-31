#include<iostream.h>

main()
{
 int i = 2;
 int j = 3;
 int true_false;

 cout << (i == 2) << '\n'; // displays a 1 (true)
 cout << (i == 1) << '\n'; // displays a 0 (false)
 cout << (j > i) << '\n';  
 cout << (j < i) << '\n';  // Can you predict the
 cout << (j <= 3) << '\n'; // output of the rest of
 cout << (j >= i) << '\n'; // these statements?
 cout << (j != i) << '\n';

 true_false = (j < 4); // The result can be stored to an integer
 cout << true_false << '\n';

 return 0;
}
