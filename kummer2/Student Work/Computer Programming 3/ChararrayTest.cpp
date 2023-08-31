#include<iostream.h>
#include<string.h>


int main()
{
	char bob[20];
	int size,i=0;



	cout<<"Enter data:"<<endl;
	cin.get(bob,20);
	cin.ignore();
	size=strlen(bob);

	cout<<bob<<"-"<<size<<endl;


	do
	{

		cout<<bob[i]<<endl;

		i++;

	}while(i<size);





	return 0;
}