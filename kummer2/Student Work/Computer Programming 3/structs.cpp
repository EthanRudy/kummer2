#include<iostream.h>


struct emp
{
	char name[20];
	int age;
	double wage;
};

void getInfo(int &n, emp bob[]);

void showInfo(int n, emp bob[]);

int main()
{
	int num;

	emp arremp[10];

	getInfo(num,arremp);
	
	showInfo(num,arremp);
	
	return 0;
}

void getInfo(int &n, emp bob[])
{
	cout<<" enter # of employees: ";
	cin>>n;
	for(int i=1;i<=n;i++)
	{
		cin.ignore();
		cout<<" enter name of employee: ";
		cin.get(bob[i].name,20);
		cin.ignore();
		cout<<" enter age of employee: ";
		cin>>bob[i].age;
		cout<<" enter wage of employee: ";
		cin>>bob[i].wage;
	}

}

void showInfo(int n, emp bob[])
{

	cout<<" name of employee    age of employee   wage of employee"<<endl;
	for(int i=1;i<=n;i++)
	{
	
		cout<<bob[i].name<<"     "<<bob[i].age<<"   "<<bob[i].wage<<endl;
	}

}


