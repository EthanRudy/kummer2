#ifndef TYPESSTRINGS_H_INCLUDED
#define TYPESSTRINGS_H_INCLUDED

#include <iostream>
#include <sstream>
#include <string.h>
using namespace std;

class typesstrings
{
    public:
        typesstrings();
        string stringify(double a);
        string stringify(float a);
        string stringify(int a);
        string stringify(long int a);
};

typesstrings::typesstrings()
{}

string typesstrings::stringify(double a)
{
    stringstream ss;
    ss << a;
    return ss.str();
}

string typesstrings::stringify(float a)
{
    stringstream ss;
    ss << a;
    return ss.str();
}

string typesstrings::stringify(int a)
{
    stringstream ss;
    ss << a;
    return ss.str();
}

string typesstrings::stringify(long int a)
{
    stringstream ss;
    ss << a;
    return ss.str();
}

#endif // TYPESSTRINGS_H_INCLUDED
