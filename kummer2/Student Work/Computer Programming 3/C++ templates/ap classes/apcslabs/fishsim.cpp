#include <iostream>
#include <fstream>
using namespace std;
#include "apstring.h"
#include "environ.h"
#include "FishDisplayG.h"
#include "simulate.h"

int main()
{

  apstring fishfile;
  cout << "Enter file name for fish: ";
  cin  >> fishfile;
  // replace filename below with appropriate file (full path if necessary)
  ifstream input(fishfile.c_str());
  Environment env(input);

  Display display(env.NumRows(), env.NumCols());  

  Simulation sim;

  int step;
  int numSteps;
  apstring s;

  display.Show(env);

  cout << "--- initialized --- " << endl;

  cout << "How many steps: ";
  cin >> numSteps;

  display.Show(env);

//  getline(cin, s);

  for (step = 0; step < numSteps; step++)
  {
    sim.Step(env);
    display.Show(env);
    Sleep(100);
//    getline(cin, s);
  }

  return 0;
}
