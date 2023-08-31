// EVALSTAK.CPP
// A stack-based calculator.
// By Todd Knowlton

// compiler directives
#include<iostream.h>
#include<stdlib.h>

// global structure and variables
  struct stack_node
    {
     int value;
     stack_node *next;
    };

  stack_node *top_ptr;

  const int OPERATOR = 2;
  const int NUMERIC = 1;
  const int QUIT = 0;

// function prototypes
int process_input(char ch);
int do_operation(char ch, int v1, int v2);
void push(int value);
int pop();
void display_stack();
void delete_stack();

// main function
void main()
{
  char user_input[10]; // character array for user input
  int value;           // int to hold value if user enters an integer
  int entry_status = NUMERIC;   // Flag to indicate whether the user's
                                // was a number, an operator, or quit.
  top_ptr = NULL; // pointer to top of stack

  cout << "Enter an integer or operator (+,-,*,/) at the prompts below.\n";
  cout << "Enter D to display stack.\n";
  cout << "Enter Q to quit.\n";

  do
   {
     cout << ": ";           // display prompt
     cin.get(user_input,10); // get user input
     cin.ignore(80,'\n');
     // Pass the first character of the user's input to the process_input
     // function. The function will perform the appropriate operation
     // if the user entered an operator or if the user issued a command.
     // If the user entered an integer, entry_status will be NUMERIC.
     entry_status = process_input(user_input[0]);

     if(entry_status == NUMERIC)  // If entry_status is numeric,
      {                           // convert the number in the string
       value = atoi(user_input);  // to an actual integer and
       push(value);               // push the value on the stack.
      }
   } while (entry_status != QUIT); // Loop until user enters Quit command.
} // end of main function

// Function that processes the user's input. Only the first character of
// the user's input is passed to this function.
int process_input(char ch)
 {
  int v1, v2; // Variables to hold values while operation is taking place.
  int result; // Used to hold the result of an operation.
  int status; // Holds the status value returned by the function.

  switch(ch)
   {
    case '+':  // If user entered a +
    case '-':  // a -
    case '*':  // a *
    case '/':  // or a /, do the lines below.
      status = OPERATOR; // Set status to indicate user entered an operator.
      v1 = pop();   // Because all of the operators require two operands,
      v2 = pop();   // pop two values off the stack.
      result = do_operation(ch, v1, v2); // Call function to do operation.
      cout << result << endl;  // Output result of operation.
      push(result); // Push result on the stack.
      break;
    case 'D':  // If user entered a D
    case 'd':  // or a d, do the lines below.
      status = OPERATOR; // Set status to indicate user entered an operator.
      display_stack(); // Call function to display entire stack.
      break;
    case 'Q':  // If user entered a Q
    case 'q':  // or a q, do the lines below.
      delete_stack();  // Dispose of the stack.
      status = QUIT;   // Set status to indicate user wants to quit.
      break;
    default :  // If anything not covered above is entered, assume
      status = NUMERIC; // the user entered an integer.
      break;
   }
  return(status); // Return the status to the calling function.
 } // end of function process_input

// Function that performs the mathematical operations.
int do_operation(char op, int v1, int v2)
 {
  int result;
  switch(op)
   {
    case '+':  // If operator is +, add the values.
      result = v1 + v2;
      break;
    case '-':  // If operator is -, subtract the values.
      result = v2 - v1;
      break;
    case '*':  // If operator is *, multiply the values.
      result = v2 * v1;
      break;
    case '/':  // If operator is /, divide the values.
      result = v2 / v1;
      break;
   }
  return(result); // Return the result of the operation.
 } // end of function do_operation

// Function to push a value on the stack.
void push(int value)
 {
  stack_node *new_node;

  new_node = new stack_node;    // Allocate memory for new node.
  if(new_node != NULL)          // If no error occurred during allocation,
   {                            // add node to stack.
    new_node->value = value;    // Copy value into the node.

    if(top_ptr == NULL)
     {                          // If no nodes exist, set the node's next
      new_node->next = NULL;    // pointer to NULL.
     }
    else
     {                          // If nodes exist, set the node's next
      new_node->next = top_ptr; // pointer to point to the current top
     }                          // of stack.
    top_ptr = new_node; // Make new node the new top of stack.
   }
  else  // If memory error occurs, display message.
   {
    cout << "Memory Error: Value not pushed on stack.\n";
   }
 } // end of function push

// Function that pops a value off the stack.
int pop()
 {
  stack_node *temp_ptr;
  int value;

  if(top_ptr != NULL)  // If the stack is not empty, pop off the top value.
   {
    temp_ptr = top_ptr->next;  // Set temporary pointer to node below top.
    value = top_ptr->value;    // Get value from the top of stack.
    delete top_ptr;            // Delete top node.
    top_ptr = temp_ptr;        // Set top of stack to the temporary pointer.
   }
  else                 // If the stack is empty, display message.
   {
    cout << "STACK EMPTY\n";
   }
  return(value); // Return value popped off the stack.
 } // end of function pop

// Function that displays the contents of the stack.
void display_stack()
 {
  stack_node *current_ptr;

  current_ptr = top_ptr;   // Move current_ptr to top of stack.

  if(current_ptr != NULL) // If stack is not empty, display the stack.
   {
    do
     {
      cout << current_ptr->value << endl;  // Output the value.
      current_ptr = current_ptr->next; // Set current_ptr to next node.
     } while(current_ptr != NULL); // Loop until end of list.
   }
  else                    // If stack is empty, display message.
   {
    cout << "\nSTACK EMPTY\n";
   }
 } // end of function display_stack

// Function that frees the memory used by the stack's linked list.
void delete_stack()
 {
  stack_node *temp_ptr;
  stack_node *current_ptr;

  current_ptr = top_ptr;  // Move current_ptr to head of the list.

  do    // Traverse list until the end is reached.
   {
    temp_ptr = current_ptr->next;   // Set temporary pointer to point
                                    // to the remainder of the list.
    delete current_ptr;   // Delete current node.
    current_ptr = temp_ptr;   // Set current_ptr to next node after the
   } while(temp_ptr != NULL); // deleted one.
 } // end of function delete_stack
