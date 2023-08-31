// INSERT.CPP
// Example of a dynamically-allocated linked list.

// include files
#include<iostream.h>
#include<iomanip.h>
#include<string.h>

// global structure, variables, and constants
  const NAME_LENGTH = 20;

  struct county_node         // node for linked list
    {
     char county_name[NAME_LENGTH];
     long population;
     county_node *next;      // link to next node
    };

  county_node *head_ptr;      // pointer to head of linked list
  county_node *current_ptr;   // pointer to current node

// function prototypes
int get_county_data(char name[NAME_LENGTH], long &popul);
void insert_node(char name[NAME_LENGTH], long popul);
void position_insertion_point(long popul);
void make_node_new_head(county_node *new_rec_ptr);
void move_current_to_end();
void display_list();
void delete_list();

// beginning of main function
int main()
{
 char name[NAME_LENGTH];
 long popul;

 if(get_county_data(name, popul))   // prompt user for data for the node
   {
     head_ptr = new county_node; // initialize list head
     strcpy(head_ptr->county_name, name);
     head_ptr->population = popul;
     head_ptr->next = NULL;       // initialize next node pointer to NULL

     while(get_county_data(name,popul))
      {
       insert_node(name, popul);
      }
     display_list();  // display the counties and populations
     delete_list();   // free the memory used by the linked list
   }
 cout << "\nEND OF PROGRAM\n";
 return 0;
}

// Function that gets data from user.
int get_county_data(char name[NAME_LENGTH], long &popul)
 {
  int keep_data = 1;

  cout << "Enter county name (Press Enter alone to stop): ";
  cin.get(name,NAME_LENGTH);
  cin.ignore(80,'\n');
  if(name[0] != 0)
   {
    cout << "Enter county population: ";
    cin >> popul;
    cin.ignore(80,'\n');
   }
  else
   {
    keep_data = 0;
   }
  return(keep_data);
 }

// Function that inserts a new node into the linked list
// sorted by population.
void insert_node(char name[NAME_LENGTH], long popul)
{
  county_node *new_rec_ptr; // Declare temporary pointer for the new node.
  county_node *before_ptr;  // More temporary pointers.
  county_node *after_ptr;

  new_rec_ptr = new county_node; // Allocate memory for a new node and
				 // initialize pointer to point to it.

  strcpy(new_rec_ptr->county_name, name);  // Initialize the new node
  new_rec_ptr->population = popul;         // with data.

  if(popul > head_ptr->population)    // If the population of the new
   {                                  // county is greater than that of the
    make_node_new_head(new_rec_ptr);  // head of the list, make new node
   }                                  // the head.
  else                                // Else, determine where the new node
   {                                  // should be inserted.
    position_insertion_point(popul); // Move current_ptr to node before
				     // insertion point.
    before_ptr = current_ptr;      // Use pointers to keep track of nodes
    after_ptr = current_ptr->next; // on each side of the insertion point.

    before_ptr->next = new_rec_ptr; // Insert node in list.
    new_rec_ptr->next = after_ptr;
   }
}

// Function that positions current_ptr at the node before the position
// where the new node should be inserted.
void position_insertion_point(long popul)
{
 long temp_popul;
 county_node *temp_ptr;

 if(head_ptr->next != NULL) // If more than one node exists, search the
  {                         // list for the correct insertion point.
   current_ptr = head_ptr;
   temp_ptr = current_ptr->next;
   temp_popul = temp_ptr->population;
   // Loop until the population of the node following current_ptr has
   // less population than the current node.
   while((current_ptr->next !=NULL) && (popul < temp_popul))
    {
     current_ptr = temp_ptr;
	 
	 // check to see if current node is the last node in the list
	 if(current_ptr->next != NULL)
	 {
      temp_ptr = current_ptr->next;
      temp_popul = temp_ptr->population;
	 }
    }
  }
 else  // If only one node exists in the list, current_ptr is the same
  {    // as head_ptr. New node will be added to the end of the list.
   current_ptr = head_ptr;
  }
}

// Function that makes the node pointed to by new_rec_ptr the new
// head of the linked list. It handles the special case of inserting at
// the front of the list.
void make_node_new_head(county_node *new_rec_ptr)
{
  new_rec_ptr->next = head_ptr;
  head_ptr = new_rec_ptr;
}

// Function that moves current_ptr to end of the linked list.
void move_current_to_end()
{
 current_ptr = head_ptr;  // Move current_ptr to head of the list.

 while(current_ptr->next != NULL)
  {                             // Traverse list until NULL is reached.
   current_ptr = current_ptr->next;
  }
}

// Function that displays entire linked list.
void display_list()
{
 current_ptr = head_ptr;   // Move current_ptr to head of list.
 cout << "County                     Population\n";
 cout << "-------------------        ----------\n";
 do
  {
   cout.setf(ios::left);
   cout << setw(25) << current_ptr->county_name;
   cout.setf(ios::right);
   cout	<< setw(12) << current_ptr->population << endl;
   current_ptr = current_ptr->next; // set current_ptr to point to next node
  } while(current_ptr != NULL); // loop until end of list
}

// Function that frees the memory used by the linked list.
void delete_list()
{
 county_node *temp_ptr;  // pointer used for temporary storage

 current_ptr = head_ptr;  // Move current_ptr to head of the list.

 do    // Traverse list until the end is reached.
  {
   temp_ptr = current_ptr->next;   // Set temporary pointer to point
				   // to the remainder of the list.
   delete current_ptr;   // Delete current
   current_ptr = temp_ptr;
  } while(temp_ptr != NULL);
}
