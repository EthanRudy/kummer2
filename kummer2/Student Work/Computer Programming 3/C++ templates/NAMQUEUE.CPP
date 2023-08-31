// NAMQUEUE.CPP
// An example of using a queue.

// compiler directives
#include<iostream.h>
#include<string.h>

// global declarations
  struct queue_node  // node for item in queue
    {
     char name[20];
     queue_node *next;
    };

  queue_node *head_ptr;  // pointer to head of queue
  queue_node *tail_ptr;  // pointer to tail of queue

  // constants for error conditions
  const int QUEUE_EMPTY = 2;
  const int QUEUE_ERROR = 1;
  const int NOERROR = 0;

// function prototypes
void handle_choice(int choice);
int add_customer(char *name);
void display_queue();
int next_customer(char *name);
void delete_queue();

// main function
int main()
{
  int choice;

  tail_ptr = NULL; // Initialize pointers to
  head_ptr = NULL; // NULL since no queue exists.
  do
   {
    cout << endl;
    cout << "1 - Add a person to the queue\n";
    cout << "2 - Take next customer\n";
    cout << "3 - Display queue\n";
    cout << "4 - Quit\n";
    cout << "Enter choice: ";
    cin >> choice;
    if(choice != 4)  // If user does not want to quit,
     {               // do handle_choice.
      handle_choice(choice);
     }
   } while(choice != 4); // Loop until user chooses Quit.
   if(head_ptr != NULL)
    {                 // If queue isn't empty,
     delete_queue();  // delete the queue to free the memory.
    }
   return 0;
} // end of main function

// Function that handles the user's choice.
void handle_choice(int choice)
{
  char name[20];
    switch(choice)
     {
      case 1:  // User chose to add a customer to the queue.
	cin.ignore(80,'\n');
	cout << "\nEnter customer's name: ";
	cin.get(name, 20);
	if(add_customer(name) == QUEUE_ERROR)
	 {
	  cout << "\nQUEUE ERROR\n\n";
	 }
	break;
      case 2:  // User chose to get next customer from queue.
	if(next_customer(name) == QUEUE_EMPTY)
	 {
	  cout << "\nQUEUE EMPTY\n\n";
	 }
	else
	 {
	  cout << "\nThe next customer is " << name << endl;
	 }
	break;
      case 3:  // User chose to display the queue.
	if(head_ptr != NULL)
	 {
	  display_queue();
	 }
	else
	 {
	  cout << "\nQUEUE EMPTY\n\n";
	 }
	break;
      default:
	cout << "\nInvalid choice: Enter 1, 2, 3 or 4.\n\n";
	break;
     }
}

// Function to add a customer to the queue.
int add_customer(char *name)
{
  int status = NOERROR;

  queue_node *new_node;

  new_node = new queue_node;  // Allocate memory for the new node.
  if(new_node == NULL)
   {                     // If memory allocation problem, set error
    status = QUEUE_ERROR; // status and proceed to exit the function.
   }
  else                   // else copy data into the node and add to queue.
   {
    strcpy(new_node->name, name);
    if(tail_ptr == NULL)
     {                        // If queue is empty, make the new
      new_node->next = NULL;  // node the head and tail.
      tail_ptr = new_node;
      head_ptr = new_node;
     }
    else
     {                           // If queue is not empty, add the
      tail_ptr->next = new_node; // customer to the queue.
      new_node->next = NULL;
      tail_ptr = new_node;
     }
   }
  return(status); // return error status
}

// Function to display entire queue.
void display_queue()
{
 queue_node *current_ptr;

 current_ptr = head_ptr;   // Move current_ptr to head of queue.

 cout << endl; // Display blank line before output.
 if(current_ptr != NULL) // If queue is not empty, start displaying.
  {
   do
    {
     cout << current_ptr->name << endl;
     current_ptr = current_ptr->next; // set current_ptr to point to next node
    } while(current_ptr != NULL); // loop until end of list
  }
 else
  {
   cout << "QUEUE EMPTY\n\n";
  }
}

// Function that gets next customer from queue.
int next_customer(char *name)
{
  queue_node *temp_ptr;
  int status = NOERROR;

  if(head_ptr != NULL)  // If queue is not empty, get next customer.
   {
    strcpy(name, head_ptr->name); // Copy data out of head node.
    temp_ptr = head_ptr->next;  // Set temp pointer to node after head.
    delete head_ptr;      // Delete head node.
    head_ptr = temp_ptr;   // Move head_ptr to new head of queue.
    if(head_ptr == NULL)
     {                  // IMPORTANT!! If last customer is removed from
      tail_ptr = NULL;  // queue, set tail_ptr to NULL.
     }
   }
  else                 // If queue is empty, set error status.
   {
    status = QUEUE_EMPTY;
   }
  return(status);
}

// Function that frees the memory used by the queue.
void delete_queue()
{
 char name[20];
 int status = NOERROR;

 do
  {
   status = next_customer(name);     // Remove customers until
  } while(status != QUEUE_EMPTY);    // queue is empty.
}
