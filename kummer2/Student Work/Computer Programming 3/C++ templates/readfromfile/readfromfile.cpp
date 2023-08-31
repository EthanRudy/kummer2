#include<iostream.h>
#include<fstream.h>
#include<stdlib.h>

struct data
{
	char telenum[9];
	int age;
};


void get_data(int &c);

void show_data(int c);

data arrdata[10];


int main()
{
	int c;

	char tn[9],agech[4];

	get_data(c);

	show_data(c);


	return 0;
}



void get_data(int &c)
{	
	//variable declarations
	ifstream in_file;
	
	char filename[] = "telenumsandage.txt";
	char n[9];
	char s[4];

	//get files
	in_file.open(filename);

	/*reset array
	for ( c = 0 ; c < 10 ; c++)
	{
		arrdata[c].telenum ="000-0000";
		arrdata[c].age = 0;
	}
	*/
	
	c = 0;

	/////////////////////////////////////////////////////
	//set one line of lines[] to one line of the files
	//until the end of file
	while( !in_file.eof() )
	{
		in_file.get(arrdata[c].telenum , 9);
		in_file.ignore();
		 
		in_file.get(s, 4);
		arrdata[c].age = atoi(s);
		in_file.ignore();
		c++;
	}
	
	//close file
	in_file.close();
}
void show_data(int c)
{
	
	for(int i=0;i<c;i++)
	{
		cout<<arrdata[i].telenum<<endl;
		cout<<arrdata[i].age<<endl<<endl<<endl;
		
	}
}