// AP Computer Science Marine Biology Case Study program
// Copyright (C) 2000  College Board and Educational Testing Service

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// randgen.h - comments fixed, copyright statement added 5/31/2000

#ifndef _RANDGEN_H
#define _RANDGEN_H

// RandGen objects provide a source of computer-generated random numbers
// (sometimes known as pseudo-random numbers).
//
// By default, a RandGen object will produce a different series of
// numbers (through repeated calls to the RandInt and RandDouble
// methods) every time the program is run.  When testing, though, it is
// often useful to have a program generate the same sequence of numbers
// each time it is run; this can be achieved by specifying a "seed" when
// the first RandGen object in the program is created.
//
// To construct random integers in a given range, client programs
// should use RandInt.  To construct random doubles, client programs
// should use RandReal.  The ranges for the return values for these
// functions are indicated with mathematical notation:
//    [0..max)     means a number between 0 and max,
//                 including 0 but not including max;
//    [0..max]     means a number between 0 and max, including
//                 both 0 and max.
//
// For example,
//   RandGen r;
//   r.RandInt(5)        an int between 0 and 5, including 0 but not 5,
//                       i.e., in [0, 5)
//   r.RandInt(2, 5)     an int between 2 and 5, including 2 and 5,
//                       i.e., in [2, 5]
//   r.RandReal()        a double between 0.0 and 1.0, including 0.0 but not 1.0,
//                       i.e., in [0.0, 1.0)
//   r.RandReal(4.2,6.7) a double between 4.2 and 6.7, including 4.2 but not 6.7,
//                       i.e., in [4.2, 6.7)
//
// Technical Note:
//   The "seed" used by all random number generation in a program is set
//   the first time a random number generator object is constructed by
//   the program.  All other random number generator objects created
//   later in the program will use the same seed.

class RandGen
{
  public:

    // Constructors
      // If the first RandGen object is constructed with the default
      // constructor, a different series of numbers is produced every
      // time the program is run.  If the first RandGen object is
      // constructed with a seed, the same series of numbers is produced
      // every time.

    RandGen();                          // default constructor
    RandGen(int seed);                  // produce same series every time
                                        //   (most useful during testing)

    // Accessing functions

    int RandInt(int max);                    // returns int in [0..max)
    int RandInt(int low, int max);           // returns int in [low..max]
    double RandReal();                       // returns double in [0..1)
    double RandReal(double low, double max); // returns double in [low..max)

  private:
    static int ourInitialized;          // for 'per-class' initialization
};


#include <time.h>                // for time()
#include <stdlib.h>              // for rand/srand
#include "randgen.h"

int RandGen::ourInitialized = 0;

// constructors

RandGen::RandGen()
// postcondition: system srand() used to initialize seed
//                once per program
{
  if (0 == ourInitialized)
  {
    ourInitialized = 1;        // only call srand once
    srand(unsigned(time(0)));  // randomize
  }
}

RandGen::RandGen(int seed)
// postcondition: system srand() used to initialize seed
//                once per program
{
  if (0 == ourInitialized)
  {
    ourInitialized = 1;        // only call srand once
    srand(seed);               // randomize
  }
}

// public accessing functions

int RandGen::RandInt(int max)
// precondition: max > 0
// postcondition: returns int in [0..max)
{
  return int(RandReal() * max);
}

int RandGen::RandInt(int min, int max)
 //precondition: min <= max
 //postcondition: returns int in [min..max]
{
  return min + RandInt(max - min + 1);
}

double RandGen::RandReal()
// postcondition: returns double in [0..1)
{
  // RAND_MAX is defined in <stdlib.h>
  return rand() / (double(RAND_MAX) + 1);
}

double RandGen::RandReal(double dmin, double dmax)
// precondition: dmin <= dmax
// postcondition: returns double in [dmin..dmax)
{
  double width = dmax - dmin;
  return RandReal() * width + dmin;
}

#endif    // _RANDGEN_H not defined

