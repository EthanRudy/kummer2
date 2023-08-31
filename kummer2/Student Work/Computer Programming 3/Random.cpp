/*Random Numbers Program #2
Mr. Kummer
Chapter 7 and 8 
use srand((unsigned) time(NULL)), (rand()%range) + min and looping 
to generate 20 random #'s from a given min and maximum
*/
#include<iostream.h>
#include<stdlib.h>
#include<time.h>

main()
{
	int x,num,min,max,range;
	
	//srand is a function that sets the seed for rand based on time
	srand((unsigned) time(NULL));

	//get user input
	
	cout << "enter min value: ";
	cin >> min;
	cout << "enter max value: ";
	cin >> max;\

	//find range
	range=max-min+1;

	//Random number generator and output
	for(x=1;x<20;x++)
	{
		num= (rand()%range)+min;
		//cout << rand()%range;
		cout << "the random number generated is: " << num << endl;
	}
	return 0;
}