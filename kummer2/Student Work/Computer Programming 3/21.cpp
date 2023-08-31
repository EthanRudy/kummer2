#include <iostream.h>	//sets up for cin and cout
#include <iomanip.h>	//allows manipulation of the I/O

int main()
{
	float a,b,c;

	cout<<"Enter First #: ";
	cin>>a;
	cout<<endl;
	cout<<"Enter Second #: ";
	cin>>b;

	c=a-b;

	cout<<setiosflags(ios::fixed|ios::showpoint)<<setprecision(2);	//round to nearest hundredth

	cout<<endl;
	cout<<setw(20)<<a<<endl;
	cout<<setw(10)<<"-"<<setw(10)<<b<<endl;
	cout<<setw(20)<<"________"<<endl;
	cout<<setw(20)<<c<<endl;
	cout<<endl;

	return 0;
}

