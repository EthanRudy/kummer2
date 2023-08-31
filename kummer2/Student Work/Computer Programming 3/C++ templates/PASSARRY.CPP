#include<iostream.h>

void print_message(char string_to_print[45]);

int main()
{
 char mystring[45] = "This string will be passed to print_message.";

 print_message(mystring);

 return 0;
}

void print_message(char string_to_print[45])
 {
  cout << string_to_print << '\n';
 }
