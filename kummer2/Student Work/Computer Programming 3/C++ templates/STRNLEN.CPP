#include<iostream.h>

int stringlength(char *string_in);

int main()
{
  char mystring[] = "This is my string";

  cout << "The length of the string is " << stringlength(mystring)
       << " characters long.\n";
  return 0;
}

int stringlength(char *string_in)
{
  int countlength = 0;

  while(string_in[countlength] != '\0')
    countlength++;

  return(countlength);
}
