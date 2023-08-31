#include <iostream.h>
#include "aquafish.h"

int main()
{
  int tankSize;
  int stepsPerSim;
  int step;

  cout << "Tank size? ";
  cin >> tankSize;
  cout << "Steps per simulation? ";
  cin >> stepsPerSim;

  AquaFish fish(tankSize);

  for (step = 0; step < stepsPerSim; step++)
  {
    fish.Swim();
  }

  cout << "Bump count = " << fish.BumpCount() << endl;

  return 0;
}
