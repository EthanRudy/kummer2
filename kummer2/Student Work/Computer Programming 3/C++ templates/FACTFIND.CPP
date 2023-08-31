// FACTFIND.CPP
// A program that calculates the factorial of an integer recursively.

#include<iostream.h>  // necessary for stream I/O

// function prototype
long factorial(long n);

int main()
{
 long n;       // number entered by user
 long result;  // result returned by factorial function

 cout << "Enter a non-negative integer: ";
 cin >> n;
 if(n == 0) // If the integer is 0, print message and do no calculation.
  {
   cout << "By definition, the factorial of 0 is 1.\n";
  }
 else
  {
   if(n > 0) // If the integer is greater than zero, calculate
    {        // the factorial.
     result = factorial(n);  // Call the recursive function.
     cout << "The factorial of " << n << " is " << result << ".\n";
    }
   else    // If the integer is less than zero, entry is not valid.
    {
     cout << "Not a valid integer.\n";
    }
  }
 return 0;
}

// Recursive function that calculates factorial.
long factorial(long n)
{
 long fact;   // Local variable returned by function.

 if(n > 1)
  {          // If n is not one, make another recursive call.
   fact = n * factorial(n - 1);
  }
 else
  {          // Exit condition
   fact = 1; // If n is one, recursion stops and flow of logic
  }          // begins "backing out" of recursive calls.
 return(fact);  // Return fact to the next level of recursion.
}
