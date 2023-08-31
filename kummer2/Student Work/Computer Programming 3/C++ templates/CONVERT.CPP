#include<fstream.h>  // necessary for file I/O
#include<iostream.h>

int main()
{
 char ch;            // Declare character variable used for input.
 ifstream infile;    // Declare file pointer for input file.
 ofstream outfile;   // Declare file pointer for output file.

 infile.open("LOWER.TXT",ios::in);   // Open file for input.
 outfile.open("UPPER.TXT",ios::out); // Open file for output.

 if ((!infile) || (!outfile))  // If file error on either file,
  {                            // print message and stop program.
    cout << "Error opening file.\n";
    return 0;
  }

 infile.unsetf(ios::skipws); // prevents spaces from being skipped

 while (!infile.eof())  // Loop while not the end of the file.
  {
   infile >> ch;        // Get character from file.
   if (!infile.eof())
    {
     if ((ch > 96) && (ch < 123))  // if character is lowercase a-z,
      {                            // subtract 32 to make uppercase.
       ch = ch - 32;
      }
     outfile << ch;     // Write character to output file.
    }
  } // end of while loop

 infile.close();  // Close the input file.
 outfile.close(); // Close the output file.
 return 0;
}
