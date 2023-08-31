#include<fstream.h>  // necessary for file I/O
#include<iostream.h>
#include<iomanip.h>  // necessary for setprecision manipulator

int main()
{
 float x;            // Declare variable used for input.
 ifstream infile;    // Declare file pointer named infile.

 infile.open("PRICES.DAT",ios::in);  // Open file for input.

 if (infile)  // If no error occurred while opening file,
  {           // input the data from the file.
  cout << "The prices in the file are: \n" << setprecision(2);
  do  // Loop while not the end of the file.
   {
     infile >> x;          // Get number from file.
     if (!infile.eof())
      {                    // If not the end of file,
       cout << x << endl;  // print the number to the screen.
      }
   } while (!infile.eof());
  }
 else          // If error occurred, display message.
  {
   cout << "An error occurred while opening the file.\n";
  }
 infile.close();  // Close the input file.
 return 0;
}

