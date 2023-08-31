// NAMESTAK.CPP
// An example of using a stack.

// compiler directives
#include<iostream.h>
#include<string.h>

// global declarations
  struct stack_node  // node for item on stack
    {
     char name[20];
     stack_node *next;
    };

  stack_node *top_ptr;  // pointer to top of stack

  // constants for error conditions
  const int STACKEMPTY = 2;
  const int STACKERROR = 1;
  const int NOERROR = 0;

// function prototypes
void handle_choice(int choice);
int push(char *name);
void display_stack();
int pop(char *name);
void delete_stack();

// main function
int main()
{
  int choice;

  top_ptr = NULL; // Start with top of stack set to NULL
		  // no stack exists.
  do
   {
    cout << endl;
    cout << "1 - Push a name on the stack\n";
    cout << "2 - Pop a name off the stack\n";
    cout << "3 - Display stack\n";
    cout << "4 - Quit\n";
    cout << "Enter choice: ";
    cin >> choice;
    if(choice != 4)  // If user does not want to quit,
     {               // do handle_choice.
      handle_choice(choice);
     }
   } while(choice != 4); // Loop until user chooses Quit.
   if(top_ptr != NULL)
    {                 // If stack isn't empty,
     delete_stack();  // delete the stack to free the memory.
    }
   return 0;
} // end of main function

// Function that handles the user's choice.
void handle_choice(int choice)
{
  char name[20];
    switch(choice)
     {
      case 1:  // User chose to push new name of the stack.
	cin.ignore(80,'\n');
	cout << "\nEnter name to push on stack: ";
	cin.get(name, 20);
	if(push(name) == STACKERROR)
	 {
	  cout << "\nSTACK ERROR\n\n";
	 }
	break;
      case 2:  // User chose to pop a name off the stack.
	if(pop(name) == STACKEMPTY)
	 {
	  cout << "\nSTACK EMPTY\n\n";
	 }
	else
	 {
	  cout << endl << name << " has been popped off the stack.\n";
	 }
	break;
      case 3:  // User chose to display the stack.
	if(top_ptr != NULL)
	 {
	  display_stack();
	 }
	else
	 {
	  cout << "\nSTACK EMPTY\n\n";
	 }
	break;
      default:
	cout << "\nInvalid choice: Enter 1, 2, 3 or 4.\n\n";
	break;
     }
}

// Function to push new name on the stack.
int push(char *name)
{
  int status = NOERROR;

  stack_node *new_node;

  new_node = new stack_node;  // Allocate memory for the new node.
  if(new_node == NULL)
   {                     // If memory allocation problem, set error
    status = STACKERROR; // status and proceed to exit the function.
   }
  else                   // else copy data into the node and push.
   {
    strcpy(new_node->name,name);
    if(top_ptr == NULL)
     {                        // If stack is empty, make the new
      new_node->next = NULL;  // node the first item in stack.
      top_ptr = new_node;
     }
    else
     {                           // If stack is not empty, push the
      new_node->next = top_ptr;  // node on the stack.
      top_ptr = new_node;
     }
   }
  return(status); // return error status
}

// Function to display entire stack.
void display_stack()
{
 stack_node *current_ptr;

 current_ptr = top_ptr;   // Move current_ptr to top of stack.

 cout << endl; // Display blank line before output.
 if(current_ptr != NULL)
  {
   do
    {
     cout << current_ptr->name << endl;
     current_ptr = current_ptr->next; // set current_ptr to point to next node
    } while(current_ptr != NULL); // loop until end of list
  }
 else
  {
   cout << "STACK EMPTY\n\n";
  }
}

// Function that pops top item off of stack.
int pop(char *name)
{
  stack_node *temp_ptr;
  int status = NOERROR;

  if(top_ptr != NULL)  // If stack is not empty, proceed to pop.
   {
    temp_ptr = top_ptr->next;   // Set temporary pointer to node under top.
    strcpy(name,top_ptr->name); // Copy data out of top node.
    delete top_ptr;             // Delete top node.
    top_ptr = temp_ptr;         // Move top_ptr to new top of stack.
   }
  else                 // If stack is empty, set error status.
   {
    status = STACKEMPTY;
   }
  return(status);
}

// Function that frees the memory used by the stack.
void delete_stack()
{
 char name[20];
 int status = NOERROR;

 do
  {
   status = pop(name);     // Pop items until stack is empty.
  } while(status != STACKEMPTY);
}
