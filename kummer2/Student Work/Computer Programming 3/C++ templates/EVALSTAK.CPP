// EVALSTAK.CPP
// A stack-based calculator
// By Todd Knowlton

// compiler directives
#include <iostream.h>
#include <stdlib.h>
#include "stack.h"

// global variables
stack <int> NumericStack;
const int OPERATOR = 2;
const int NUMERIC  = 1;
const int QUIT     = 0;

// function prototypes
int process_input(char ch);
int do_operation(char ch, int v1, int v2);
void display_stack();

// main function
int main()
{
  char user_input[10];         // character array for user input
  int value;                   // int to hold value if user enters an integer
  int entry_status = NUMERIC;  // Flag to indicate whether the user's
			       // was a number, an operator, or quit.

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

     if(entry_status == NUMERIC)   // If entry_status is numeric,
      {                            // convert the number in the string
       value = atoi(user_input);   // to an actual integer and
       NumericStack.push(value);   // push the value on the stack.
      }
   } while (entry_status != QUIT); // Loop until user enters Quit command.
   return 0;
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
      v1 = NumericStack.pop();   // Because all of the operators require two
      v2 = NumericStack.pop();   // operands, pop two values off the stack.
      result = do_operation(ch, v1, v2); // Call function to do operation.
      cout << result << endl;    // Output result of operation.
      NumericStack.push(result); // Push result on the stack.
      break;
    case 'D':
    case 'd':
      status = OPERATOR;
      display_stack();
      break;
    case 'Q':  // If user entered a Q
    case 'q':  // or a q, do the lines below.
      NumericStack.flush(); // Empty the stack
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
      result = v2 + v1;
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

// Function that displays the contents of the stack.
void display_stack()
{
  stack <int> TempStack;  // temporary stack
  int TempObject;         // temporary variable for holding stack items

  while(!NumericStack.isEmpty())
   {                                   // While the numeric stack is not
     TempObject = NumericStack.pop();  // empty, pop a value off, display
     cout << TempObject << endl;       // the value, and push the value
     TempStack.push(TempObject);       // on to the temporary stack.
   }

  cout << "BOTTOM OF STACK" << endl;

  while(!TempStack.isEmpty())
   {                                   // While the temporary stack is not
     TempObject = TempStack.pop();     // empty, pop a value off and push it
     NumericStack.push(TempObject);    // back on to the numeric stack.
   }
} // end of function display_stack