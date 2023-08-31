/*
Mr.Kummer
4/3/2006
Use RandGen to output 10 #'s from a range a user gives.
*/

#include<iostream.h>
#include"randgen.h"


int main()
{
	RandGen r;
	
	int min,max, rannum[10];

	cout<<"Enter minimum: ";
	cin>> min;
	cout<<"Enter maximum: ";
	cin>> max;

	for(int i=0; i<10;i++)
	{
		rannum[i]=r.RandInt(min,max);
		cout<<i+1<<" - "<<rannum[i]<<endl;
	}

	return 0;
}
	




