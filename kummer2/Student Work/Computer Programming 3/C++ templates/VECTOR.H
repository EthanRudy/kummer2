#ifndef _VECTOR_H
#define _VECTOR_H

#include <stdlib.h>
#include <iostream.h>

template <class itemType>
class vector
{
  public:

  // constructors/destructor
    vector( );                        // default constructor (size==0)
    vector( int size );               // initial size of vector is size
    vector( int size, const itemType & fillValue ); // set size and value
						    // with which to fill
						    // vector
    vector( const vector & vec );     // copy constructor
    ~vector( );                       // destructor

  // operator overloads
    const vector & operator = ( const vector & vec );
    itemType & operator [ ] ( int index );   // indexing with range checking

  // member functions
    int  length( ) const;                   // capacity of vector
    void resize( int newSize );             // change size dynamically;
					    // can result in losing values

  private:
    int  mySize;                            // # elements in array
    itemType * myList;                      // array used for storage
};

template <class itemType>
vector<itemType>::vector()
: mySize(0), myList(0)
{
}

template <class itemType>
vector<itemType>::vector(int size)
: mySize(size), myList(new itemType[size])
{
}

template <class itemType>
vector<itemType>::vector(int size, const itemType & fillValue)
: mySize(size), myList(new itemType[size])
{
  for(int k = 0; k < size; k++)
  {
    myList[k] = fillValue;
  }
}

template <class itemType>
vector<itemType>::vector(const vector<itemType> & vec)
: mySize(vec.length()), myList(new itemType[mySize])
{
  for(int k = 0; k < mySize; k++)  // copy elements
  {
    myList[k] = vec.myList[k];
  }
}

template <class itemType>
vector<itemType>::~vector ()
{
  delete [] myList;
}

template <class itemType>
const vector<itemType> &
vector<itemType>::operator = (const vector<itemType> & rhs)
{
  if (this != &rhs)                         // don't assign to self!
  {
    delete [] myList;                       // get rid of old storage
    mySize = rhs.length();
    myList = new itemType [mySize];         // allocate new storage

    // copy rhs
    for(int k=0; k < mySize; k++)
    {
      myList[k] = rhs.myList[k];
    }
  }
  return *this;                             // permit a = b = c = d
}

template <class itemType>
int vector<itemType>::length() const
{
  return mySize;
}

template <class itemType>
itemType & vector<itemType>::operator [] (int k)
{
  if (k < 0 || mySize <= k)
  {
    cerr << "Illegal vector index: " << k << " max index = "
	 << mySize-1 << endl;
    abort();
  }
  return myList[k];
}

template <class itemType>
void vector<itemType>::resize(int newSize)
{
  int numToCopy = newSize < mySize ? newSize : mySize;

  // allocate new storage and copy element into new storage

  itemType * newList = new itemType[newSize];
  for(int k=0; k < numToCopy; k++)
  {
    newList[k] = myList[k];
  }
  delete [] myList;                         // de-allocate old storage
  mySize = newSize;                         // assign new storage/size
  myList = newList;
}

#endif


