#include<iostream.h>
#include<fstream.h>
int main()
{
	ofstream outfile;
	int num;
	char name[20];
	float wage;
	cout<<"enter number of people:";
	cin>>num;
	cin.ignore();

	outfile.open("bob.dat",ios::out);
	if(outfile)
	{
		for(int i=0;i<num;i++)
		{
			cout<<"Enter name:";
			cin.get(name,20);
			cin.ignore();
			outfile<<name<<endl;
			cout<<"Enter wage:";
			cin>>wage;
			cin.ignore();
			outfile<<wage<<endl;
		}
		outfile.close();
	}
	else
	{
		cout<<"Error opening file.\n";
	}
	return 0;
}