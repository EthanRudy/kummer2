#ifndef _CIRCLE_H
#define _CIRCLE_H

const float PI=3.14159;

class circle
{
 public:
	  // constructors
	  circle();                         // default constructor
	  circle(const circle &);           // copy constructor

	  // member functions
	  void   SetRadius(float);
	  double Area();

 private:
	  // data
	  float radius;
};

// default constructor
circle::circle()
{
  radius = 0.0;
}

// copy constructor
circle::circle(const circle & Object)
{
  radius = Object.radius;
}

// Method to set the radius of the circle
void circle::SetRadius(float IncomingRadius)
{
  radius = IncomingRadius;
}

// Method to find the area of the circle
double circle::Area()
{
 return(PI*radius*radius);
}

#endif
