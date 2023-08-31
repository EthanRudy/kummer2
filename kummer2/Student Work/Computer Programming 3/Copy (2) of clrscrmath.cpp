#include<iostream.h>
#include<windows.h>
#include<math.h>

int main()
{
	char name[21];

	double base, exp, ans;


	cout<<"Enter your full name: ";
	cin.get(name,21);
	cin.ignore();

	system("CLS");

	cout<<"Enter base: ";
	cin>>base;

	cout<<"Enter exponent: ";
	cin>>exp;

	ans=pow(base,exp);

	cout<<"Answer: "<<ans<<endl;

	ans=sqrt(base);

	cout<<"Answer: "<<ans<<endl;
	



	return 0;
}


