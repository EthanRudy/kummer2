// AP Computer Science Marine Biology Case Study program
// Copyright (C) 2000  College Board and Educational Testing Service

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// simulate.cpp - copyright statement added 5/31/2000

#include "simulate.h"
#include "apvector.h"
#include "environ.h"

// constructor

Simulation::Simulation()
// postcondition: simulation is ready to run
{

}

// public modifying functions

void Simulation::Step(Environment & env)
// postcondition: one step of simulation in env has been made
{
  apvector<Fish> fishList;
  int k;

  fishList = env.AllFish();
  for (k = 0; k < fishList.length(); k++)
  {
    fishList[k].Move(env);
  }
}

void Simulation::Run(Environment & env, int steps)
// postcondition: simulation on env run for # steps passed as steps
{
  int k;

  for (k = 0; k < steps; k++)
  {
    Step(env);
  }
}

