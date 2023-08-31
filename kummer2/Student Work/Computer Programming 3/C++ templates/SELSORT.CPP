// SELSORT.CPP
// An implementation of a selection sort algorithm.

// compiler directives
#include<iostream.h>

// function prototypes
void selection_sort(int input_array[], int input_size);
void display_array(int input_array[], int input_size);

int main()
{
  int nums[5] = {20, 31, 17, 47, 14};
  int nums_length = 5;

  cout << "Unsorted Array:\n";
  display_array(nums, nums_length);

  selection_sort(nums, nums_length);

  cout << "Sorted Array:\n";
  display_array(nums, nums_length);
  return 0;
}

// Selection sort procedure. Sorts an array of ints in descending order.
void selection_sort(int input_array[], int input_size)
{
  int i, j;
  int small, temp;
  
  for (i = input_size - 1; i > 0; i--)
   {
    small = 0;  // Initialize small to first element.
    
    // Find the smallest element between the positions 1 and i.
    for (j = 1; j <= i; j++)	
     {
      if (input_array[j] < input_array[small])	
       {
        small = j;
       }
     }
    // Swap the smallest element found with element in position i.
    temp = input_array[small];
    input_array[small] = input_array[i];
    input_array[i] = temp;
   }
}

// Function that simply displays each element of input_array.
void display_array(int input_array[], int input_size)
{
  int i;
  
  for (i = 0; i < input_size; i++)
   {
    cout << input_array[i] << ' ';
   }
  cout << "\n\n";
}
