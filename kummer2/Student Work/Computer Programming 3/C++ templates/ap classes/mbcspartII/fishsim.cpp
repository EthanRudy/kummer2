// AP Computer Science Marine Biology Case Study program
// Copyright (C) 2000  College Board and Educational Testing Service

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// fishsim.cpp - copyright statement added 5/31/2000

#include <iostream.h>
	//using namespace std;

	//using namespace std;

#include "apstring.h"
#include "environ.h"
#include "display.h"
#include "simulate.h"

#include <fstream.h>
	

int main()
{
  // replace filename below with appropriate file (full path if necessary)
  ifstream input("fish.dat");
  Environment env(input);

  // Display display(100,100); // for graphics display
  Display display; // for text display
  apstring s;

  Simulation sim;

  int step;
  int numSteps;

  display.Show(env);

  cout << "--- initialized --- " << endl;

  cout << "How many steps? ";
  cin >> numSteps;
  getline(cin, s);

  for (step = 0; step < numSteps; step++)
  {
    sim.Step(env);
    display.Show(env);
    cout << " step " << step << " (press return)";
    getline(cin, s);
  }

  return 0;
}
