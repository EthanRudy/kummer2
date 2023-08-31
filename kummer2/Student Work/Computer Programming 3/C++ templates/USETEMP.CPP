// USETEMP.CPP

#include <iostream.h>
#include "tempex.h"

int main()
{
  TemplateExample <int> IntExample;
  TemplateExample <float> FloatExample;
  TemplateExample <char> CharExample;

  IntExample.SetValue(1);
  FloatExample.SetValue(3.14);
  CharExample.SetValue('A');

  cout << "The value of IntExample is " << IntExample.Value() << endl;
  cout << "The value of FloatExample is " << FloatExample.Value() << endl;
  cout << "The value of CharExample is " << CharExample.Value() << endl;

  return 0;
}
