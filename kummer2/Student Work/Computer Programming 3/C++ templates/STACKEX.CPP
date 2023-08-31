// STACKEX.CPP

#include "stack.h"
#include <iostream.h>

int main()
{
  stack <char> charStack;
  stack <char> backupStack;
  char choice = '\0',
       c;

  do{
      cout << "\nStack Program\n"
	   << "-------------\n"
	   << "A Add a character to the stack\n"
	   << "T Display the character at the top of the stack\n"
	   << "R Remove the character at the top of the stack\n"
	   << "E Empty the stack\n"
	   << "S Check the status of the stack\n"
	   << "L Check the length of the stack\n"
	   << "B Backup the stack\n"
	   << "C Restore the stack\n"
	   << "Q Quit\n\n"
	   << "Choice: ";
      cin >> choice;
      switch(choice)
      {
	case 'a' :
	case 'A' : cout << "Character to add: ";
		   cin >> c;
		   charStack.push(c);
		   cout << "The character " << c
			<< " was pushed onto the stack.\n";
		   break;
	case 't' :
	case 'T' : if(!charStack.isEmpty())
		   {
		     c = charStack.top();
		     cout << "Top character is " << c << ".\n";
		   }
		   else
		   {
		     cout << "Stack is empty.\n";
		   }
		   break;
	case 'r' :
	case 'R' : if(!charStack.isEmpty())
		   {
		     c = charStack.pop();
		     cout << "The character " << c
			  << " was popped off the stack.\n";
		   }
		   else
		   {
		     cout << "Stack is empty.\n";
		   }
		   break;
	case 'e' :
	case 'E' : charStack.flush();
		   cout << "The stack has been emptied.\n";
		   break;
	case 's' :
	case 'S' : if(charStack.isEmpty())
		   {
		     cout << "The stack is empty.\n";
		   }
		   else
		   {
		     cout << "The stack is not empty.\n";
		   }
		   break;
	case 'l' :
	case 'L' : cout << "The stack currently has " << charStack.length()
			<< " elements.\n";
		   break;
	case 'b' :
	case 'B' : backupStack = charStack;
		   cout << "The stack has been backed up.\n";
		   break;
	case 'c' :
	case 'C' : charStack = backupStack;
		   cout << "The stack has been restored.\n";
		   break;
	case 'q' :
	case 'Q' : cout << "Quit\n";
		   break;
	default  : cout << "Not a valid choice.\n";
      }
    }while(choice != 'Q' && choice != 'q');

  return 0;
}
