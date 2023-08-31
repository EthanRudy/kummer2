#include<iostream.h>
#include<stdlib.h>
#include<time.h>

void Get_Nums(int arrnums[]);
int Find_Avg(int arrnums[]);

int main()
{
	int an[20];
	float avg;

	Get_Nums(an);
	avg=Find_Avg(an);

	cout<<avg<<endl;

	return 0;
}


void Get_Nums(int arrnums[])
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
	for(x=0;x<20;x++)
	{
		arrnums[x]= (rand()%range)+min;
		//cout << rand()%range;
		cout << "the random number generated is: " << arrnums[x] << endl;
	}
	
}

int Find_Avg(int arrnums[])
{
	int sum=0;
	for(int x=0;x<20;x++)
	{
		sum=sum+arrnums[x];
	}
	return sum/20;
	}

