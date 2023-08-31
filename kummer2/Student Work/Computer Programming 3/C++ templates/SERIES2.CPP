#include<iostream.h>

void get_choice(int &choice);
void handle_choice(int choice);
void print_odd();
void print_even();
void print_all();

int main()
{
 int choice;  // variable for user input

 get_choice(choice);
 handle_choice(choice);

 return 0;
}

void get_choice(int &choice)
 {
  do  // loop until a valid choice is entered
   {
    cout << "Which series you wish to display?\n";
    cout << "1 - Odd numbers from 1 to 30\n";
    cout << "2 - Even numbers from 1 to 30\n";
    cout << "3 - All numbers from 1 to 30\n";
    cin >> choice;  // get choice from user
    if ((choice < 1) || (choice > 3))  // if invalid entry, give message
     {
      cout << "Choice must be 1, 2, or 3\n";
     }
   } while ((choice < 1) || (choice > 3));
 }

void handle_choice(int choice)
 {
  switch (choice)
    {
     case 1:
       print_odd();
       break;
     case 2:
       print_even();
       break;
     case 3:
       print_all();
       break;
    }
 }

void print_odd()
 {
  int i;
  for (i = 1; i <= 30; i = i + 2)
    cout << i << ' ';
  cout << endl;
 }

void print_even()
 {
  int i;
  for (i = 2; i <= 30; i = i + 2)
    cout << i << ' ';
  cout << endl;
 }

void print_all()
 {
  int i;
  for (i = 1; i <= 30; i++)
    cout << i << ' ';
  cout << endl;
 }
