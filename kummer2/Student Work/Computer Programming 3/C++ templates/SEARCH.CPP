// SEARCH.CPP
// This program searches a 100-element array of numbers using a sequential
// search and a binary search.

#include<fstream.h>  // necessary for file I/O
#include<iostream.h>
#include<iomanip.h>

// Function prototypes.
int load_numbers_from_disk(int x[100]);
void sequential_search(int x[100], int search_num);
void binary_search(int x[100], int upperbound, int lowerbound, int search_num);

// main function
int main()
{
 int x[100];
 int search_num;

 if(load_numbers_from_disk(x)) // Load array with numbers from data file.
  {
   cout << "\nEnter the number for which you want to search: ";
   cin >> search_num;
   binary_search(x, 0, 100, search_num); // Do binary search.
   sequential_search(x, search_num);     // Do sequential search.
  }
 else
  {
   cout << "An error occurred while opening the file.\n";
  }
 return 0;
}

// Function to load the array with numbers from a data file.
int load_numbers_from_disk(int x[100])
{
 int index;
 int status;
 ifstream infile;    // declares file pointer named infile

 infile.open("NUMBERS.DAT",ios::in);  // open file for input

 if (infile)  // If no error occurred while opening file
  {           // input the data from the file.
   for(index = 0; index <= 99; index++)
    {
     infile >> x[index];
    }
   infile.close();
   status = 1;
  }
 else          // If error occurred, display message.
  {
   status = 0;
  }
 return(status);
}

// Sequential search function.
void sequential_search(int x[100], int search_num)
{
 int index = 0;

 while((index < 100) && (search_num != x[index]))
  {  // Loop while the number is not found and while more elements remain.
   if(x[index] != search_num)
    {         // If current element is not the one for which we are
     index++; // searching, increment subscript index.
    }
  }
 if(index < 100) // If loop ended before index reached 100, then the
  {              // number was found.
   cout << "A sequential search found the number in "
	<< index + 1 << " comparisons.\n";
  }
 else
  {
   cout << "Number not found by sequential search after "
	<< index << " comparisons.\n";
  }
}

// Binary search function
// Function accepts an array, a range of elements for the search,
// and the number for which we are searching.
void binary_search(int x[100], int lowerbound, int upperbound, int search_num)
{
 int search_pos;
 int compare_count = 1; // Variable used to count the comparisons.

 // Calculate initial search position.
 search_pos = (lowerbound + upperbound) / 2;

 while((x[search_pos] != search_num) && (lowerbound <= upperbound))
  {
   compare_count++;
   if(x[search_pos] > search_num) // If the value in the search
    {                             // position is greater than the number
     upperbound = search_pos - 1; // for which we are searching, change
    }                             // upperbound to the search position
   else                           // minus one.
    {                             // Else, change lowerbound to search
     lowerbound = search_pos + 1; // position plus one.
    }
   search_pos = (lowerbound + upperbound) / 2;
  }
 if(lowerbound <= upperbound)
  {
   cout << "A binary search found the number in "
	<< compare_count << " comparisons.\n";
  }
 else
  {
   cout << "Number not found by binary search after "
	<< compare_count << " comparisons.\n";
  }
}
