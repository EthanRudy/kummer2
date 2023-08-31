// BUBSORT.CPP
// An implementation of a bubble sort algorithm.

// compiler directives
#include<iostream.h>

// function prototypes
void bubble_sort(int array[], int arrayLength);
void display_array(int input_array[], int input_size);

int main()
{
  int nums[5] = {20, 31, 17, 47, 14};
  int nums_length = 5;

  cout << "Unsorted Array:\n";
  display_array(nums, nums_length);

  bubble_sort(nums, nums_length);

  cout << "Sorted Array:\n";
  display_array(nums, nums_length);
  return 0;
}

// Bubble sort function. Sorts an array of ints in descending order.
void bubble_sort(int array[], int arrayLength)
{
  int i, j, flag = 1;
  int temp;

  for(i = 1; (i <= arrayLength) && flag; i++)
   {
     flag = 0;
     for(j = 0; j < (arrayLength - i); j++)
	{
	  if (array[j + 1] > array[j])
	   {
	     temp = array[j + 1];
	     array[j + 1] = array[j];
	     array[j] = temp;
	     flag = 1;
	   }
	}
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
