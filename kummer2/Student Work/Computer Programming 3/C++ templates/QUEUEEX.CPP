// QUEUEEX.CPP

#include "queue.h"
#include <iostream.h>

int main()
{
  queue <char> charQueue;
  queue <char> backupQueue;
  char choice = '\0',
       c;

  do{
      cout << "\nQueue Program\n"
	   << "-------------\n"
	   << "A Add a character to the queue\n"
	   << "F Display the character at the front of the queue\n"
	   << "R Remove the character at the front of the queue\n"
	   << "E Empty the queue\n"
	   << "S Check the status of the queue\n"
	   << "L Check the length of the queue\n"
	   << "B Backup the queue\n"
	   << "C Restore the queue\n"
	   << "Q Quit\n\n"
	   << "Choice: ";
      cin >> choice;
      switch(choice)
      {
	case 'a' :
	case 'A' : cout << "Character to add: ";
		   cin >> c;
		   charQueue.enqueue(c);
		   cout << "The character " << c
			<< " was added to the queue.\n";
		   break;
	case 'f' :
	case 'F' : if(!charQueue.isEmpty())
		   {
		     c = charQueue.front();
		     cout << "Front character is " << c << ".\n";
		   }
		   else
		   {
		     cout << "Queue is empty.\n";
		   }
		   break;
	case 'r' :
	case 'R' : if(!charQueue.isEmpty())
		   {
		     c = charQueue.dequeue();
		     cout << "The character " << c
			  << " was removed from the queue.\n";
		   }
		   else
		   {
		     cout << "Queue is empty.\n";
		   }
		   break;
	case 'e' :
	case 'E' : charQueue.flush();
		   cout << "The queue has been emptied.\n";
		   break;
	case 's' :
	case 'S' : if(charQueue.isEmpty())
		   {
		     cout << "The queue is empty.\n";
		   }
		   else
		   {
		     cout << "The queue is not empty.\n";
		   }
		   break;
	case 'l' :
	case 'L' : cout << "The queue currently has " << charQueue.length()
			<< " elements.\n";
		   break;
	case 'b' :
	case 'B' : backupQueue = charQueue;
		   cout << "The queue has been backed up.\n";
		   break;
	case 'c' :
	case 'C' : charQueue = backupQueue;
		   cout << "The queue has been restored.\n";
		   break;
	case 'q' :
	case 'Q' : cout << "Quit\n";
		   break;
	default  : cout << "Not a valid choice.\n";
      }
    }while(choice != 'Q' && choice != 'q');

  return 0;
}