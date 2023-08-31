#include<fstream.h>  // necessary for file I/O
#include<iostream.h>
#include<stdlib.h>   // necessary for atoi function

int main()
{
 char user_name[25];
 char user_age[4];
 int age;
 ifstream infile;    // declares file pointer named infile

 infile.open("NAME_AGE.DAT",ios::in);  // open file for input

 if (infile)  // If no error occurred while opening file
  {           // input the data from the file.
   infile.get(user_name,25); // read the name from the file
   infile.ignore(80,'\n');
   infile.get(user_age,4);   // read the age from the file as a string
   infile.ignore(80,'\n');
   age = atoi(user_age);
   cout << "The name read from the file is " << user_name << ".\n";
   cout << "The age read from the file is " << age << ".\n";
  }
 else          // If error occurred, display message.
  {
   cout << "An error occurred while opening the file.\n";
  }
 infile.close();  // close the input file
 return 0;
}