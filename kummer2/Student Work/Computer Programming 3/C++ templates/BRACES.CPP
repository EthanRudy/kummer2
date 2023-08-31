#include <iostream.h>
main()
{
  int i; // declare an integer for the loop

  for(i = 1; i <= 3; i++)
	 {
	   cout << i << '\n';
	   if(i == 3)
	    {
	      cout << "This is the last time\n";
	      cout << "i equals three\n";
	    } // end of if statement
	 } // end of for loop

  return 0;
} // end of main function
