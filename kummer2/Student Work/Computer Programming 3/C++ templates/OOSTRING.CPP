#include <string.h>
#include <assert.h>
#include "oostring.h"

const int MAX_LENGTH = 1024;        // largest size string for input

oostring::oostring()
{
    Capacity = 1;
    CString = new char[Capacity];
    CString[0] = '\0';           // make c-style string zero length
}


oostring::oostring(const char * s)
{
    Capacity = strlen(s) + 1;
    CString = new char[Capacity];
    strcpy(CString,s);
}

oostring::oostring(const oostring & str)
{
    Capacity = str.length() + 1;
    CString = new char[Capacity];
    strcpy(CString,str.CString);
}

oostring::~oostring()
{
    delete [] CString;                // free memory
}

const oostring & oostring::operator = (const oostring & rhs)
{
    if (this != &rhs)                             // check aliasing
    {
	if (Capacity < rhs.length() + 1)        // more memory needed?
	{
	    delete[] CString;                   // delete old string
	    Capacity = rhs.length() + 1;        // add 1 for '\0'
	    CString = new char[Capacity];
	}
	strcpy(CString,rhs.CString);
    }
    return *this;
}


const oostring & oostring::operator = (const char * s)
{

    int len = 0;                         // length of newly constructed string
    assert(s != 0);                      // make sure s non-NULL
    len = strlen(s);                     // # of characters in string

    // free old string if necessary

    if (Capacity < len + 1)
    {
	delete[] CString;	// delete old string
	Capacity = len + 1;	// add 1 for '\0'
	CString = new char[Capacity];
    }
    strcpy(CString,s);
    return *this;
}

const oostring & oostring::operator = (char ch)
{
    if (Capacity < 2)
    {
	delete [] CString;
	Capacity = 2;
	CString = new char[Capacity];
    }
    CString[0] = ch;	// make string one character long
    CString[1] = '\0';
    return *this;
}

int oostring::length( ) const
{
  int myLength = 0;

  while(CString[myLength] != '\0')
    myLength++;

  return(myLength);
}

char * oostring::c_str() const
{
    return CString;
}

char & oostring::operator [] (int k)
{
    if (k < 0 || strlen(CString) <= k)
    {
	cerr << "index out of range: " << k << " string: " << CString
	    << endl;
	assert(0 <= k && k < strlen(CString));
    }
    return CString[k];
}

ostream & operator << (ostream & os, const oostring & str)
{
    return os << str.c_str();
}

istream & operator >> (istream & is, oostring & str)
{
    char buf[MAX_LENGTH];
    is >> buf;
    is.ignore(sizeof(buf),'\n');
    str = buf;
    return is;
}


istream & getline(istream & is, oostring & str)
{
    char buf[MAX_LENGTH];
    is.get(buf,sizeof(buf));
    is.ignore(sizeof(buf),'\n');
    str = buf;
    return is;
}

const oostring & oostring::operator += (const oostring & str)
{

    oostring copystring(str);         // copy to avoid aliasing problems

    int newLength = length() + str.length(); // self + added string
    int lastLocation = length();	     // index of '\0'

    // check to see if local buffer not big enough
    if (newLength >= Capacity)
    {
	Capacity = newLength + 1;
	char * newBuffer = new char[Capacity];
	strcpy(newBuffer,CString); // copy into new buffer
	delete [] CString;	     // delete old string
	CString = newBuffer;
    }

    // now catenate str (copystring) to end of CString
    strcpy(CString+lastLocation,copystring.c_str() );

    return *this;
}

const oostring & oostring::operator += (const char * s)
{

    int newLength = length() + strlen(s);    // self + added string
    int lastLocation = length();	     // index of '\0'

    // check to see if local buffer not big enough
    if (newLength >= Capacity)
    {
	Capacity = newLength + 1;
	char * newBuffer = new char[Capacity];
	strcpy(newBuffer,CString); // copy into new buffer
	delete [] CString;	     // delete old string
	CString = newBuffer;
    }

    // now catenate s to end of CString
    strcpy(CString+lastLocation,s);

    return *this;
}

const oostring & oostring::operator += ( char ch )
{
    oostring temp;	// make string equivalent of ch
    temp = ch;
    *this += temp;
    return *this;
}

oostring operator + (const oostring & lhs, const oostring & rhs)
{
    oostring result(lhs); // copies lhs to result
    result += rhs;	  // catenate rhs
    return result;	  // returns a copy of result
}

oostring operator + ( char ch, const oostring & str )
{
    oostring result;	  // make string equivalent of ch
    result = ch;
    result += str;
    return result;
}

oostring operator + ( const oostring & str, char ch )
{
    oostring result(str);
    result += ch;
    return result;
}


oostring oostring::substr(int pos, int len) const
{
    oostring result(*this);           // make sure enough space allocated

    if(pos < 0)                       // start at front when pos < 0
    {
      pos = 0;
    }

    if(pos >= strlen(CString))
    {
      result = "";       // empty string
      return result;
    }

    int lastIndex = pos + len - 1;      // last char's index (to copy)
    if(lastIndex >= strlen(CString))    // off end of string?
    {
      lastIndex = strlen(CString)-1;
    }

    int j,k;
    for(j=0,k=pos; k <= lastIndex; j++,k++)
    {
	result.CString[j] = CString[k];
    }
    result.CString[j] = '\0';         // properly terminate C-string
    return result;
}

int oostring::find(const oostring & str)  const
{
    int len = str.length();
    int lastIndex = length() - len;
    int k;
    for(k=0; k <= lastIndex; k++)
    {
	if (strncmp(CString + k,str.c_str(),len) == 0) return k;
    }
    return(-1);
}

int oostring::find( char ch ) const
{
    int k;
    for(k=0; k < strlen(CString); k++)
    {
	if (CString[k] == ch)
	{
	    return k;
	}
    }
    return(-1);
}


bool operator == ( const oostring & lhs, const oostring & rhs )
{
    return strcmp(lhs.c_str(), rhs.c_str()) == 0;
}

bool operator != ( const oostring & lhs, const oostring & rhs )
{
    return ! (lhs == rhs);
}

bool operator <  ( const oostring & lhs, const oostring & rhs )
{
    return strcmp(lhs.c_str(), rhs.c_str()) < 0;
}

bool operator <= ( const oostring & lhs, const oostring & rhs )
{
    return lhs < rhs || lhs == rhs;
}
bool operator >  ( const oostring & lhs, const oostring & rhs )
{
    return rhs < lhs;
}

bool operator >= ( const oostring & lhs, const oostring & rhs )
{
    return rhs <= lhs;
}

int oostring::converttoint() const
{
	return(atoi(CString));
}

double oostring::converttofloat() const
{
	return(atof(CString));
}