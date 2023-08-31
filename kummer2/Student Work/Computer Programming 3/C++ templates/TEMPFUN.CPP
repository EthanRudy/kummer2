// TEMPFUN.CPP

#include <iostream.h>

template <class DataType>
void swap(DataType & x, DataType & y);

int main()
{
  int a = 1,
      b = 2;

  float c = 1.2345,
	d = 9.8765;

  char String1[] = "This is string one.";
  char String2[] = "This is string two!";

  cout << "a is " << a << ", b is " << b << endl;
  swap(a,b);
  cout << "a is " << a << ", b is " << b << endl << endl;

  cout << "c is " << c << ", d is " << d << endl;
  swap(c,d);
  cout << "c is " << c << ", d is " << d << endl << endl;

  cout << "String1: " << String1 << endl
       << "String2: " << String2 << endl;
  swap(String1[18],String2[18]);
  cout << "String1: " << String1 << endl
       << "String2: " << String2 << endl;

  return 0;
}

template <class DataType>
void swap(DataType & x, DataType & y)
{
  DataType temp = x;
  x = y;
  y = temp;
}
