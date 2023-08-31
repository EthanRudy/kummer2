#include<fstream.h>  // necessary for file I/O
#include<iostream.h>
#include<iomanip.h>

int main()
{
 float x, sum;
 int count;
 ifstream infile;    // declares file pointer named infile

 infile.open("FLOATS.DAT",ios::in);  // open file for input

 sum = 0.0;  // initialize sum
 count = 0;  // initialize count
 if (infile)  // If no error occurred while opening file
  {           // input the data from the file.
  cout << "The numbers in the data file are as follows:\n"
       << setprecision(1); // set display to one decimal point
  cout.setf(ios::fixed);  // prevent numbers from appearing in E-notation

  do  // read numbers until 0.0 is encountered
   {
     infile >> x;        // get number from file
     cout << x << endl;  // print number to screen
     sum = sum + x;      // add number to sum
     count++;            // increment count of how many numbers read
   } while(x != 0.0);
   // Output sum and average.
   cout << "The sum of the numbers is " << sum << endl;
   cout << "The average of the numbers (excluding zero) is "
	<< sum / (count - 1) << endl;
  }
 else          // If error occurred, display message.
  {
   cout << "An error occurred while opening the file.\n";
  }
 infile.close();  // close the output file
 return 0;
}
