#include<iostream>
#include<iomanip>
using namespace std;


int main()
{
	int d;

	float cd,ct;

	cout<< "Enter change due: ";
	cin>>cd;
	ct=cd*100;
	d=(int)(ct/100);
	ct=ct-d*100;
	
	cout<<endl;
	cout<<setfill('*')<<setw(26)<<""<<endl;
	
	cout<<setiosflags(ios::fixed|ios::showpoint)<<setprecision(2);
	cout<<setiosflags(ios::left)<<setfill(' ')<<setw(10)<<"Dollars"<<setiosflags(ios::right)<<setw(4)<<d<<setw(4)<<"$"<<setw(6)<<(float)d<<endl;
	
	cout<<"*************************"<<endl;
	


	return 0;
}