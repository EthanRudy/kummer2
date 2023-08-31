// bucket.h

#ifndef _BUCKET_H
#define _BUCKET_H

const float WEIGHT_OF_WATER = 8.3;

class bucket
{
  public:
	 // constructors
	 bucket();
	 bucket(bucket & Object);

	 // member functions
	 void  SetGallonSize(float Size);
	 void  FillBucket(float Amount);
	 float GetWeight();

  private:
	 // data
	 float MySize,
	       MyAmount;

};

bucket::bucket()
{
  MySize = 0;
  MyAmount = 0;
}

bucket::bucket(bucket & Object)
{
  MySize = Object.MySize;
  MyAmount = Object.MyAmount;
}

void bucket::SetGallonSize(float Size)
{
  MySize = Size;
}

void bucket::FillBucket(float Amount)
{
  if(Amount <= MySize)
  {
    MyAmount = Amount;
  }
  else
  {
    MyAmount = MySize;
  }
}

float bucket::GetWeight()
{
  return(MyAmount*WEIGHT_OF_WATER);
}

#endif
