#include<iostream.h>

main()
{
 const int YES = 1;
 const int NO = 0;

 int exempt_from_final;
 float my_average;
 int my_days_absent;

 exempt_from_final = NO;

 cout << "What is your course grade average? ";
 cin >> my_average;

 cout << "How many days were you absent from class? ";
 cin >> my_days_absent;

 if (my_average >= 90)
  {                                 // if your average is 90 or better
   if (my_days_absent <= 3)         // and you have missed three days
     { exempt_from_final = YES; }  // or less, you are exempt.
  }
 else  // if you don't have a 90+ average, you still have a chance
  { if (my_average >= 80)
    {                                // if you average is 80 or better
     if (my_days_absent <= 1)        // and you have missed one day or
       { exempt_from_final = YES; } // less, you are exempt.
    }
  }

 // notify student of the decision
 if (exempt_from_final)
  { cout << "You are exempt from the final exam.\n"; }
 else
  { cout << "You must take the final exam for the course.\n"; }

 return 0;
}
