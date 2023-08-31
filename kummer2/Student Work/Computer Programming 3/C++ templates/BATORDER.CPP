// BATORDER.CPP
// Example of a circularly-linked list.

// include files
#include<iostream.h>
#include<iomanip.h>
#include<string.h>

// global structure, variables, and constants
  const NAME_LENGTH = 20;

  struct batter_node         // node for linked list
    {
     char batter_name[NAME_LENGTH];
     batter_node *next;      // link to next node
    };

  batter_node *first;
  batter_node *current_batter;   // pointer to current batter

// function prototypes
int get_batter_name(char name[NAME_LENGTH]);
void add_node(char name[NAME_LENGTH]);
void do_rotation();
void delete_list();

// beginning of main function
int main()
{
 char name[NAME_LENGTH];

 if(get_batter_name(name))   // prompt user for data for the node
   {
     first = new batter_node; // initialize list head
     strcpy(first->batter_name, name);
     first->next = first;       // initialize next node pointer to first
     current_batter = first;

     while(get_batter_name(name))
      {
       add_node(name);
      }
     do_rotation();  // display the batters
     delete_list();   // free the memory used by the linked list
   }
 return 0;
}

// Function that gets data from user.
int get_batter_name(char name[NAME_LENGTH])
 {
  int keep_data = 1;

  cout << "\nEnter batter name (Press Enter alone to stop): ";
  cin.get(name,NAME_LENGTH);
  cin.ignore(80,'\n');
  if(name[0] == 0)
   {
    keep_data = 0;
   }
  return(keep_data);
 }

// Function that adds a node to the linked list.
void add_node(char name[NAME_LENGTH])
{
  batter_node *new_rec_ptr; // Declare temporary pointer for the new node.

  new_rec_ptr = new batter_node; // Allocate memory for a new node and
				 // initialize pointer to point to it.

  strcpy(new_rec_ptr->batter_name, name);
  new_rec_ptr->next = first;  // Set next node pointer of new node to first

  current_batter->next = new_rec_ptr; // Place new node in list
  current_batter = new_rec_ptr;
}

// Function that displays batters until Q is entered
void do_rotation()
{
 char user_input[3];

 current_batter = first;   // Move current_batter to first
 do
  {
   cout << "\nThe next batter is "
	<< current_batter->batter_name << ".\n";
   cout << "\nPress Enter for next batter or Q and Enter to quit: ";
   cin.get(user_input,3);
   cin.ignore(80,'\n');
   current_batter = current_batter->next;
  } while((user_input[0] != 'Q') && (user_input[0] != 'q'));
}

// Function that frees the memory used by the linked list.
void delete_list()
{
 batter_node *temp_ptr;  // pointer used for temporary storage

 current_batter = first;  // Move current_ptr to head of the list.

 do    // Traverse list until the end is reached.
  {
   temp_ptr = current_batter->next;   // Set temporary pointer to point
				   // to the remainder of the list.
   delete current_batter;   // Delete current
   current_batter = temp_ptr;
  } while(temp_ptr != first);
}
