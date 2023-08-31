// DOUBLE.CPP
// PHONE NUMBER DATABASE
// An example of using a doubly-linked list.

// compiler directives
#include<fstream.h>
#include<iostream.h>
#include<iomanip.h>
#include<string.h>

// global structures and variables
  struct friend_node
    {
     char last_name[20];
     char first_name[15];
     char phone_num[15];
     friend_node *next;
     friend_node *previous;
    };

  friend_node *head_ptr;
  friend_node *current_ptr;


// function prototypes
void handle_choice(int choice);
void add_record();
void insert_node(friend_node *new_rec_ptr);
friend_node *position_insertion_point(char lastname[20]);
void make_node_new_head(friend_node *new_rec_ptr);
void add_node_to_end(friend_node *new_rec_ptr);
void move_current_to_end();
void display_list();
void delete_record();
void delete_head_of_list();
void delete_end_of_list(friend_node *previous_ptr);
void delete_from_middle_of_list(friend_node *previous_ptr);
int verify_delete();
void delete_node(friend_node *previous_ptr);
void delete_list();
void search_by_lastname();
void display_next_record();
void display_previous_record();
void load_list_from_file();
void write_list_to_file();

// main function
int main()
{
  int choice;

  head_ptr = NULL;
  load_list_from_file();
  current_ptr = head_ptr;
  do
   {
    cout << "\nFRIEND DATABASE\n";
    cout << "0 - Exit program\n";
    cout << "1 - Add record\n";
    cout << "2 - Display all records\n";
    cout << "3 - Search for friend by last name\n";
    cout << "4 - Delete record\n";
    cout << "5 - Display next record\n";
    cout << "6 - Display previous record\n";
    cout << "Enter choice: ";
    cin >> choice;
    handle_choice(choice);
   } while(choice != 0);
   return 0;
} // end of main function

// function to direct program flow based on user's choice
void handle_choice(int choice)
 {
    switch(choice)
     {
      case 0:
	write_list_to_file();
	if(head_ptr != NULL)
	  { delete_list(); }
	break;
      case 1:
	add_record();  // add a record to the linked list
	break;
      case 2:
	display_list(); // display all records in linked list
	break;
      case 3:
	search_by_lastname(); // search for record by last name
	break;
      case 4:
	delete_record(); // search for record by last name
	break;
      case 5:
	display_next_record();
	break;
      case 6:
	display_previous_record();
	break;
      default :
	cout << "\nInvalid choice\n";
	break;
     }
 }

// function to add record to the linked list
void add_record()
 {
   friend_node *new_rec_ptr; // Declare temporary pointer for the new node.

   new_rec_ptr = new friend_node; // Allocate memory for a new node and
				  // initialize pointer to point to it.

   cin.ignore(80,'\n');
   cout << "\nEnter a new record.\n";
   cout << "Last Name: ";
   cin.get(new_rec_ptr->last_name,20);
   cin.ignore(80,'\n');
   cout << "First Name: ";
   cin.get(new_rec_ptr->first_name,15);
   cin.ignore(80,'\n');
   cout << "Phone Number: ";
   cin.get(new_rec_ptr->phone_num,15);
   cin.ignore(80,'\n');

   insert_node(new_rec_ptr);
}

// Function to insert new node into correct position in list.
void insert_node(friend_node *new_rec_ptr)
{
   friend_node *before_ptr;
   friend_node *after_ptr;

   if(head_ptr == NULL)
    {                             // If no nodes exist, make the node
     new_rec_ptr->next = NULL;    // the head.
     new_rec_ptr->previous = NULL;
     head_ptr = new_rec_ptr;
    }
   else
    {
     if(strcmp(new_rec_ptr->last_name, head_ptr->last_name) < 0)
      {                                  // If new record comes before head,
       make_node_new_head(new_rec_ptr);  // make it the new head.
      }
     else                                // Else, determine where the new node
      {                                  // should be inserted.
       current_ptr = position_insertion_point(new_rec_ptr->last_name);
       before_ptr = current_ptr;      // Use pointers to keep track of nodes
       after_ptr = current_ptr->next; // on each side of the insertion point.

       if(after_ptr == NULL) // If after_ptr is NULL, the node needs to be
	{                    // added to the end of the list.
	 add_node_to_end(new_rec_ptr);
	}
       else                  // Else add the node between the nodes pointed to
	{                    // by before_ptr and after_ptr.
	 before_ptr->next = new_rec_ptr;
	 new_rec_ptr->next = after_ptr;
	 new_rec_ptr->previous = before_ptr;
	 after_ptr->previous = new_rec_ptr;
	}
      }
    }
}

// Function that positions current_ptr at the node before the position
// where the new node should be inserted.
friend_node *position_insertion_point(char lastname[20])
{
 char temp_name[20];
 friend_node *temp_ptr;
 int tempint;

 if(head_ptr->next != NULL) // If more than one node exists, search the
  {                         // list for the correct insertion point.
   current_ptr = head_ptr;
   temp_ptr = current_ptr->next;
   strcpy(temp_name, temp_ptr->last_name);
   // Loop until the correct insertion point is found
   tempint = strcmp(lastname,temp_name);
   while((tempint > 0) && (current_ptr->next !=NULL))
    {
     current_ptr = temp_ptr;

	 // check to see if current node is the last node
	 if(current_ptr->next != NULL)
	 {
      temp_ptr = current_ptr->next;
      strcpy(temp_name, temp_ptr->last_name);
      tempint = strcmp(lastname,temp_name);
	 }
    }
  }
 else  // If only one node exists in the list, current_ptr is the same
  {    // as head_ptr. New node will be added to the end of the list.
   current_ptr = head_ptr;
  }
 return(current_ptr);
}

// Function that makes the node pointed to by new_rec_ptr the new
// head of the linked list. It handles the special case of inserting at
// the front of the list.
void make_node_new_head(friend_node *new_rec_ptr)
{
  friend_node *temp_ptr;

  temp_ptr = head_ptr;
  temp_ptr->previous = new_rec_ptr;
  new_rec_ptr->next = temp_ptr;
  new_rec_ptr->previous = NULL;
  head_ptr = new_rec_ptr;
}

// Function that adds a node to the end of the linked list. It handles
// the special case of inserting at the end of the list.
void add_node_to_end(friend_node *new_rec_ptr)
{
  new_rec_ptr->next = NULL;  // Set next node pointer of new node to NULL.

  move_current_to_end();        // Make sure current_ptr is at end of list.
  current_ptr->next = new_rec_ptr; // Place new node at the end of the list.
  new_rec_ptr->previous = current_ptr;
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
 char fullname[36];  // used to combine names into one array

 current_ptr = head_ptr;   // Move current_ptr to head of list.
 if(current_ptr != NULL)
  {
   cout << endl;
   cout << "Friend                              Phone Number\n";
   cout << "----------------------------------- ------------\n";
   do
    {
     strcpy(fullname,""); // clear fullname
     strcat(fullname, current_ptr->last_name);  // put last name in fullname
     strcat(fullname, ", ");                    // put comma in fullname
     strcat(fullname, current_ptr->first_name); // put first name in fullname
     cout.setf(ios::left);
     cout << setw(36) << fullname;
     cout.setf(ios::right);
     cout << setw(12) << current_ptr->phone_num << endl;
     current_ptr = current_ptr->next; // set current_ptr to point to next node
    } while(current_ptr != NULL); // loop until end of list
  }
 else
  {
   cout << "\nNO RECORDS TO DISPLAY\n";
  }
 current_ptr = head_ptr;
}

// Function that deletes individual nodes from the linked list.
void delete_record()
{
  char search_string[20];
  friend_node *previous_ptr;

  previous_ptr = NULL; // initialize previous_ptr to NULL
  current_ptr = head_ptr;  // Move current_ptr to head of list
			   // to begin search.
  cin.ignore(80,'\n');
  cout << "\nEnter the last name of the friend you want to delete: ";
  cin.get(search_string,20);
  cin.ignore(80,'\n');

  while((current_ptr != NULL) &&
	   (strcmp(current_ptr->last_name, search_string) != 0))
   {
    previous_ptr = current_ptr;
    current_ptr = current_ptr->next;
   }

  if(current_ptr != NULL) // If current_ptr is not NULL, then match was
   {                      // found.
    cout << "\nRECORD FOUND\n";
    cout << current_ptr->first_name << ' '
	 << current_ptr->last_name << endl;
    cout << current_ptr->phone_num << endl;
    if(verify_delete())
     {
      delete_node(previous_ptr);
      cout << "\nRECORD DELETED\n";
     }
    else
     {
      cout << "\nRECORD NOT DELETED\n";
     }
   }
  else
   {
    cout << "\nNO MATCH FOUND. NO RECORD DELETED.\n";
   }
}

// Function to ask user to verify intention to delete the node.
int verify_delete()
{
 char YesNo;

 cout << "\nDo you wish to delete this record? (Y/N) ";
 cin >> YesNo;
 if((YesNo == 'Y') || (YesNo == 'y'))
  {
   return(1);
  }
 else
  {
   return(0);
  }
}

// Function that deletes node pointed to by current_ptr.
void delete_node(friend_node *previous_ptr)
{
 if(current_ptr == head_ptr)
  {
   delete_head_of_list();
  }
 else
  {
   if(current_ptr->next == NULL)
    {
     delete_end_of_list(previous_ptr);
    }
   else
    {
     delete_from_middle_of_list(previous_ptr);
    }
  }
}

//Function that deletes the head of the list.
void delete_head_of_list()
{
 current_ptr = head_ptr;
 if(head_ptr->next != NULL)
  {
   head_ptr = current_ptr->next;
   head_ptr->previous = NULL;
  }
 else
  {
   head_ptr = NULL;
  }
 delete current_ptr;
}

// Function that deletes the last node of the linked list.
void delete_end_of_list(friend_node *previous_ptr)
{
 delete current_ptr;
 previous_ptr->next = NULL;
 current_ptr = head_ptr; // Set current_ptr to head to give it a value.
}

// Function that deletes a node from the middle of the list.
void delete_from_middle_of_list(friend_node *previous_ptr)
{
 previous_ptr->next = current_ptr->next;
 current_ptr->next->previous = previous_ptr;
 delete current_ptr;
 current_ptr = head_ptr;
}

// Function that frees the memory used by the linked list.
void delete_list()
{
 friend_node *temp_ptr;  // pointer used for temporary storage

 current_ptr = head_ptr;  // Move current_ptr to head of the list.

 do    // Traverse list until the end is reached.
  {
   temp_ptr = current_ptr->next;   // Set temporary pointer to point
				   // to the remainder of the list.
   delete current_ptr;   // Delete current node.
   current_ptr = temp_ptr;   // Set current_ptr to next node after the
  } while(temp_ptr != NULL); // deleted one.
}

// Function that searches linked list for the first occurrence of a given
// last name and displays the record to the screen.
void search_by_lastname()
{
  char search_string[20];  // Character array for last name to search for.

  current_ptr = head_ptr;  // Move current_ptr to head of list
			   // to begin search.
  cin.ignore(80,'\n');
  cout << "\nEnter the last name for which you want to search: ";
  cin.get(search_string,20);
  cin.ignore(80,'\n');

  while((current_ptr != NULL) &&
	   (strcmp(current_ptr->last_name, search_string) != 0))
   {
    current_ptr = current_ptr->next;
   }

  if(current_ptr != NULL) // If current_ptr is not NULL, then match was
   {                      // found.
    cout << "\nRECORD FOUND\n";
    cout << current_ptr->first_name << ' '
	 << current_ptr->last_name << endl;
    cout << current_ptr->phone_num << endl;
   }
  else
   {
    cout << "\nNO MATCH FOUND\n";
   }
}

// Function that allows the user to browse through records by displaying
// the next record in the linked list.
void display_next_record()
{
 if(current_ptr != NULL) // check to make sure records exist
 {
  if(current_ptr->next != NULL)             // If current_ptr is not
   {                                        // already at the end of the
    current_ptr = current_ptr->next;        // list, move current_ptr
    cout << current_ptr->first_name << ' '  // forward in the list and
	 << current_ptr->last_name << endl;     // display the data in the next
    cout << current_ptr->phone_num << endl; // node.
   }
  else                                      // Otherwise, display message
   {                                        // to alert user that the last
    cout << "\nLAST RECORD\n";              // record has been reached and
    cout << current_ptr->first_name << ' '  // display the last record
	 << current_ptr->last_name << endl;     // again.
    cout << current_ptr->phone_num << endl;
   }
 }
 else
 {
	 cout << "\nNO RECORDS\n";
 }
}

// Function that allows the user to browse through records by displaying
// the previous record in the linked list.
void display_previous_record()
{
 if(current_ptr != NULL) // check to make sure records exist
 {
  if(current_ptr->previous != NULL)         // If current_ptr is not
   {                                        // already at the beginning of
    current_ptr = current_ptr->previous;    // the list, move current_ptr
    cout << current_ptr->first_name << ' '  // backward in the list and
	 << current_ptr->last_name << endl;     // display the data in the
    cout << current_ptr->phone_num << endl; // previous node.
   }
  else                                      // Otherwise, display message
   {                                        // to alert user that the first
    cout << "\nFIRST RECORD\n";             // record has been reached and
    cout << current_ptr->first_name << ' '  // display the first record
	 << current_ptr->last_name << endl;     // again.
    cout << current_ptr->phone_num << endl;
   }
 }
 else
 {
	 cout << "\nNO RECORDS\n";
 }
}

// Function to load the linked list from the data file.
void load_list_from_file()
{
  friend_node *new_rec_ptr;
  ifstream infile;

  infile.open("FRIENDS.DAT",ios::in);  // open file for input

  if (infile)  // If no error occurred while opening file
   {           // input the data from the file.
    do
     {
       new_rec_ptr = new friend_node;
       infile.get(new_rec_ptr->last_name,20);
       infile.ignore(80,'\n');
       infile.get(new_rec_ptr->first_name, 15);
       infile.ignore(80,'\n');
       infile.get(new_rec_ptr->phone_num, 15);
       infile.ignore(80,'\n');
       
	   if(strcmp(new_rec_ptr->last_name, "END OF FILE") != 0)
	   {
	    insert_node(new_rec_ptr);
	   }
       else
	   {
	    delete new_rec_ptr;
	    new_rec_ptr=NULL;
	   }
     } while(new_rec_ptr!=NULL && strcmp(new_rec_ptr->last_name,"END OF FILE") != 0);
     infile.close();
   }
  else          // If error occurred, display message.
   {
    cout << "No usable data file located. List is empty.\n";
   }
}

// Function to write linked list data to the data file.
void write_list_to_file()
{
 ofstream outfile;

 outfile.open("FRIENDS.DAT",ios::out);  // open file for output

 if (outfile)
  {
   current_ptr = head_ptr;
   if(head_ptr != NULL)
    {
     do    // Traverse list until the end is reached.
      {
       outfile << current_ptr->last_name << endl;
       outfile << current_ptr->first_name << endl;
       outfile << current_ptr->phone_num << endl;
       current_ptr = current_ptr->next;
      } while(current_ptr != NULL);
    }
   outfile << "END OF FILE" << endl;
   outfile.close();
  }
 else
  {
   cout << "Error opening file.\n";
  }
}
