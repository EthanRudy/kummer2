#include<iostream.h>

main()
{
 int choice;  // variable for user input
 int i;       // variable for loops and output

 do  // loop until a valid choice is entered
  {
   cout << "Which series do you wish to display?\n";
   cout << "1 - Odd numbers from 1 to 30\n";
   cout << "2 - Even numbers from 1 to 30\n";
   cout << "3 - All numbers from 1 to 30\n";
   cin >> choice;  // get choice from user
   if ((choice < 1) || (choice > 3))  // if invalid entry, give message
    {
     cout << "Choice must be 1, 2, or 3\n";
    }
  } while ((choice < 1) || (choice > 3));

  switch (choice)
    {
     case 1:
       for (i = 1; i <= 30; i = i + 2)
	 cout << i << ' ';
       cout << endl;
       break;
     case 2:
       for (i = 2; i <= 30; i = i + 2)
	 cout << i << ' ';
       cout << endl;
       break;
     case 3:
       for (i = 1; i <= 30; i++)
	 cout << i << ' ';
       cout << endl;
       break;
    }
  return 0;
}
