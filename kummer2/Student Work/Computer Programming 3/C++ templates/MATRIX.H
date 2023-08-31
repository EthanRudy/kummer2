#ifndef _MATRIX_H
#define _MATRIX_H

#include "vector.h"
#include <stdlib.h>
#include <iostream.h>

template <class itemType>
class matrix
{
  public:

  // constructors/destructor
    matrix();                                      // default size 0 x 0
    matrix(int rows, int cols);                    // size rows x cols
    matrix(int rows, int cols, const itemType & fillValue); // set fill value
    matrix(const matrix & mat);                    // copy constructor
    ~matrix();                                     // destructor

  // operator overloads
    matrix & operator = (matrix & rhs);
    vector <itemType> & operator [] (int k);       // range-checked indexing

  // member functions
    int  numrows() const;                      // number of rows
    int  numcols() const;                      // number of columns
    void resize( int newRows, int newCols );   // resizes matrix to newRows x newCols
					       // (can result in losing values)
  private:

    int myRows;                                // # of rows (capacity)
    int myCols;                                // # of cols (capacity)
    vector < vector <itemType> > myMatrix;     // the matrix of items
};

template <class itemType>
matrix<itemType>::matrix()
: myRows(0), myCols(0), myMatrix(0)
{
}

template <class itemType>
matrix<itemType>::matrix(int rows,int cols)
: myRows(rows), myCols(cols), myMatrix(rows)
{
  for(int k=0; k < rows; k++)
  {
    myMatrix[k].resize(cols);
  }
}

template <class itemType>
matrix<itemType>::matrix(int rows, int cols, const itemType & fillValue)
: myRows(rows), myCols(cols), myMatrix(rows)
{
  int j,k;
  for(j=0; j < rows; j++)
  {
    myMatrix[j].resize(cols);
    for(k=0; k < cols; k++)
    {
      myMatrix[j][k] = fillValue;
    }
  }
}

template <class itemType>
matrix<itemType>::matrix(const matrix<itemType> & mat)
: myRows(mat.myRows), myCols(mat.myCols), myMatrix(mat.myRows)
{
  for(int k = 0; k < myRows; k++) // copy elements
  {
    // cast to avoid const problems (const -> non-const)
    myMatrix[k] = (vector <itemType> &) mat.myMatrix[k];
  }
}

template <class itemType>
matrix<itemType>::~matrix()
{
  // vector destructor frees everything
}

template <class itemType>
matrix<itemType> &
matrix<itemType>::operator = (matrix<itemType> & rhs)
{
  if (this != &rhs)                  // don't assign to self!
  {
    myMatrix.resize(rhs.myRows);     // resize to proper # of rows
    myRows = rhs.myRows;             // set dimensions
    myCols = rhs.myCols;

    // copy rhs
    for(int k=0; k < myRows; k++)
    {
      myMatrix[k] = rhs.myMatrix[k];
    }
  }
  return *this;
}

template <class itemType>
int matrix<itemType>::numrows() const
{
  return myRows;
}

template <class itemType>
int matrix<itemType>::numcols() const
{
  return myCols;
}

template <class itemType>
void matrix<itemType>::resize(int newRows, int newCols)
{
    myMatrix.resize(newRows);

    for(int k=0; k < newRows; k++)
    {
      myMatrix[k].resize(newCols);
    }
    myRows = newRows;
    myCols = newCols;
}

template <class itemType>
vector<itemType> &
matrix<itemType>::operator [] (int k)
{
  if (k < 0 || myRows <= k)
  {
    cerr << "Illegal matrix index: " << k << " max index = "
	 << myRows-1 << endl;
    abort();
  }
  return myMatrix[k];
}

#endif


