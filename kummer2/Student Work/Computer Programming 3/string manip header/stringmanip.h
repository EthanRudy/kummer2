/*
 * Dan Labarowski
 * Honors Computer Programming III
 * November 17, 2009
 * stringmanip.h
 * The member functions of this header will convert a string to a float or a float to a string
 */

#ifndef STRINGMANIP_H_
#define STRINGMANIP_H_

#include <sstream>
#include <string>
using namespace std;

class stringmanip
{
public:
	//note that no constructor was created as no data is passed between the members of this class
	float stof(string); //member functions
	string ftos(float);
};

float stringmanip::stof(string incomingstring)
{
	float output;
	istringstream iss (incomingstring,istringstream::in);
	iss>>output;
	return output;
}

string stringmanip::ftos(float incomingfloat)
{
	std::stringstream out; //set out as a stringstream object
	out<<incomingfloat;
	return out.str();
	out.str("");
}

#endif
