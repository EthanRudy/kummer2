#ifndef _QUEUE_H
#define _QUEUE_H

// uncomment line below if bool not built-in type
#include "bool.h"

#include "vector.h"                         // used to implement queue
#include <stdlib.h>

const int QDEFAULT_SIZE = 10;               // default initial queue size

template <class itemType>
class queue
{
  public:

  // constructors/destructor
    queue();                                // construct empty queue
    queue(const queue & q);                 // copy constructor
    ~queue();                               // destructor

  // operator overloads
    const queue & operator = (queue & rhs);

  // member functions
    const itemType & front();               // return front (no dequeue)
    const itemType & dequeue();             // return the front element
    bool isEmpty() const;                   // return true if empty else false
    int  length() const;                    // return number of elements in queue
    void enqueue(const itemType & item);    // insert item (at rear)
    void flush();                           // empty the queue

   private:

    int mySize;                      // # of elts currently in queue
    int myFront;                     // index of first element
    int myBack;                      // index of last element
    vector <itemType> myElements;    // internal storage for elements

    // private helper functions
    void DoubleQueue();              // double storage for myElements
    void Increment(int & val) const; // add one with wraparound
};

template <class itemType>
queue <itemType>::queue()
: mySize(0), myFront(0), myBack( -1 ), myElements(QDEFAULT_SIZE)
{
}

template <class itemType>
queue <itemType>::queue(const queue <itemType> & q)
: mySize(q.mySize), myFront(q.myFront), myBack(q.myBack), myElements(q.myElements)
{
}

template <class itemType>
queue <itemType>::~queue()
{
  // vector destructor takes care of memory
}

template <class itemType>
const queue <itemType> & queue <itemType>::operator = (queue <itemType> & rhs)
{
  if( this != &rhs)
  {
    mySize = rhs.mySize;               // copy all fields of rhs
    myElements.resize(rhs.myElements.length());  // resize storage
    myFront = 0;
    myBack = mySize - 1;               // index from 0 .. mySize - 1

    int k;
    int rhsk = rhs.myFront;

    for(k=0; k < mySize; k++)
    {
      myElements[k] = rhs.myElements[rhsk];
      Increment(rhsk);
    }
  }
  return *this;
}

template <class itemType>
const itemType & queue <itemType>::front()
{
  return myElements[myFront];
}

template <class itemType>
bool queue <itemType>::isEmpty() const
{
  return mySize == 0;
}

template <class itemType>
int queue <itemType>::length() const
{
  return mySize;
}

template <class itemType>
void queue <itemType>::enqueue(const itemType & item)
{
  if(mySize >= myElements.length())    // grow if necessary to add element
  {
    DoubleQueue();
  }

  Increment(myBack);                   // add element at back of queue
  myElements[myBack] = item;
  mySize++;
}

template <class itemType>
const itemType & queue <itemType>::dequeue()
{
  int oldFront;

  if(isEmpty())
  {
    cerr << "dequeue from empty queue" << endl;
    abort();
  }

  mySize--;                       // one fewer element
  oldFront = myFront;
  Increment(myFront);
  return myElements[oldFront];
}

template <class itemType>
void queue <itemType>::flush()
{
  mySize = 0;
  myFront = 0;
  myBack = -1;
}


template <class itemType>
void queue <itemType>::Increment(int & val) const
{
  val++;
  if(val >= myElements.length() )
  {
    val = 0;
  }
}

template <class itemType>
void queue <itemType>::DoubleQueue()
{
  vector<itemType> temp(myElements.length()*2);  // new storage
  int j, k=myFront;                              // copy to 0..
  for(j=0; j < mySize; j++)
  {
    temp[j] = myElements[k];
    Increment(k);
  }
  myElements = temp;     // reset private vars to mirror new storage
  myFront = 0;
  myBack = mySize-1;
}

#endif


