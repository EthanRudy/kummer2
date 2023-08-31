#ifndef _AQUAFISH_H
#define _AQUAFISH_H

class AquaFish
{
  public:
    AquaFish(int tankSize);
    void Swim();               // Swim one meter.
    int BumpCount() const;     // Return the bump count.

  private:
    int myPosition;
    int myBumpCount;
    int myTankSize;
    bool debugging;
};

#endif
