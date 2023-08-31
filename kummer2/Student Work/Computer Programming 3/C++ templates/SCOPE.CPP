#include<iostream.h>

int i = 3;    // global variable

void myfunction();

int main()
 {
  int j,k;    // variables local to the main function
	      // i and j are not accessible outside of the main function
  j = 2;
  k = i + j;
  cout << "j = " << j << " and k = " << k << '\n';
  cout << "i = " << i << " before the call to myfunction.\n";
  myfunction(); // call to myfunction
  cout << "i = " << i << " after the call to myfunction.\n";
  return 0;
 }

void myfunction()
 {
  int l;      // local variable
  l = ++i;    // the variable i is accessible because i is global
	      // the variable i is changed globally
  cout << "l = " << l << '\n';
  cout << "The variable l is lost as soon as myfunction exits.\n";
 }
