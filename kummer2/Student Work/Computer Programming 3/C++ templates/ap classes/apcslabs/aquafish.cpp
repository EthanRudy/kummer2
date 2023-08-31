#include <iostream.h>
#include "aquafish.h"
#include "randomgen.h"

AquaFish::AquaFish(int tankSize)
  : myPosition(tankSize/2),
    myTankSize(tankSize),
    myBumpCount(0),
    debugging(true)
{

}

void AquaFish::Swim()
{
  RandGen randomVals;
  int flip;

  if (myPosition == myTankSize - 1)
  {
    myPosition--;
  }
  else if (myPosition == 0)
  {
    myPosition++;
  }
  else
  {
    flip = randomVals.RandInt(2);

    if (flip == 0)
    {
      myPosition++;
    }
    else
    {
      myPosition--;
    }
  }

  if (debugging)
  {
    cout << "*** Position = " << myPosition << endl;
  }

  if (myPosition == 0 || myPosition == myTankSize - 1)
  {
    myBumpCount++;
  }
}

int AquaFish::BumpCount() const
{
  return myBumpCount;
}
