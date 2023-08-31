#ifndef _OOSTRING_H
#define _OOSTRING_H

#include <iostream.h>
// uncomment line below if bool not built-in type
#include "bool.h"
#include <stdlib.h>

class oostring
{
  public:

  // constructors/destructor

    oostring( );                         // construct empty string ""
    oostring( const char * s );          // construct from string literal
    oostring( const oostring & str );    // copy constructor
    ~oostring( );                        // destructor


  // accessors

    int      length() const;                 // number of chars
    int      find(const oostring & str) const; // index of first occurrence of str
    int      find(char ch) const;            // index of first occurrence of ch
    oostring substr(int pos, int len) const; // substring of len chars
					     // starting at pos
    char * c_str( ) const;                   // explicit conversion to char *


  // assignment
    const oostring & operator = ( const oostring & str ); // assign str
    const oostring & operator = ( const char * s );       // assign s
    const oostring & operator = ( char ch );              // assign ch


  // indexing
    char & operator [] ( int k );             // range-checked indexing

  // modifiers
    const oostring & operator += ( const oostring & str ); // append str
    const oostring & operator += ( const char * s);        // append s
    const oostring & operator += ( char ch );              // append char

    int converttoint() const;
    double converttofloat() const;

  private:
      int   Capacity;                   // capacity of string
      char * CString;                   // storage for characters
};

// The following free (non-member) functions operate on strings
//
// I/O functions

ostream & operator << ( ostream & os, const oostring & str );
istream & operator >> ( istream & is, oostring & str );
istream & getline( istream & is, oostring & str );

// comparison operators:

bool operator == ( const oostring & lhs, const oostring & rhs );
bool operator != ( const oostring & lhs, const oostring & rhs );
bool operator <  ( const oostring & lhs, const oostring & rhs );
bool operator <= ( const oostring & lhs, const oostring & rhs );
bool operator >  ( const oostring & lhs, const oostring & rhs );
bool operator >= ( const oostring & lhs, const oostring & rhs );

// concatenation operator +

oostring operator + ( const oostring & lhs, const oostring & rhs );
oostring operator + ( char ch, const oostring & str );
oostring operator + ( const oostring & str, char ch );

#endif

