#ifndef _STACK_H
#define _STACK_H

// uncomment line below if bool not built-in type
//#include "bool.h"

#include "vector.h"                    // used for stack implementation
#include <stdlib.h>                    // abort() function

const int SDEFAULT_SIZE = 10;          // default initial stack size

template <class itemType>
class stack
{
  public:

  // constructors/destructor
    stack();                           // construct empty stack
    stack(const stack & s);            // copy constructor
    ~stack();                          // destructor

  // operator overloads
    const stack & operator = ( const stack & rhs );

  // member functions
    const itemType & top();            // return top element (NO pop)
    const itemType & pop();            // pop top element
    bool isEmpty() const;              // return true if empty, else false
    int  length() const;               // return number of elements in stack
    void push(const itemType & item);  // push item onto top of stack
    void flush();                      // empty the stack

  private:
    int myTop;                         // index of top element
    vector <itemType> myElements;      // storage for stack
};

template <class itemType>
stack<itemType>::stack()
: myTop(-1), myElements(SDEFAULT_SIZE)
{
}

template <class itemType>
stack<itemType>::stack(const stack<itemType> & s)
: myTop(s.myTop), myElements(s.myElements)
{
}

template <class itemType>
stack<itemType>::~stack()
{
  // vector destructor frees memory
}

template <class itemType>
const stack<itemType> & stack<itemType>::operator = (const stack<itemType> & rhs)
{
  if(this != &rhs)
  {
    myTop = rhs.myTop;
    myElements = rhs.myElements;
  }
  return *this;
}

template <class itemType>
bool stack<itemType>::isEmpty() const
{
  return myTop == -1;
}

template <class itemType>
int stack<itemType>::length() const
{
  return myTop+1;
}

template <class itemType>
void stack<itemType>::push(const itemType & item)
{
  if( myTop + 1 >= myElements.length() )    // grow vector if necessary
  {
    myElements.resize(myElements.length() * 2);
  }
  myTop++;                                  // new top most element
  myElements[myTop] = item;
}

template <class itemType>
const itemType & stack<itemType>::pop()
{
  if(isEmpty())
  {
    cerr << "error, popping an empty stack" << endl;
    abort();
  }
  myTop--;
  return myElements[myTop+1];
}

template <class itemType>
const itemType & stack<itemType>::top()
{
  if(isEmpty())
  {
    cerr << "error, popping an empty stack" << endl;
    abort();
  }
  return myElements[myTop];
}

template <class itemType>
void stack<itemType>::flush()
{
  myTop = -1;
}

#endif
