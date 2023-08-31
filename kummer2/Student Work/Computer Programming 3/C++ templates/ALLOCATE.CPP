#include<iostream.h>
#include<string.h>

struct chemical_element
  {
    char element_name[20];
    double atomic_weight;
  };

int main()
{
  chemical_element *my_ptr;  // Declare pointer to point to the 
                             // dynamically-allocated structure.
  my_ptr = new chemical_element; // Allocate memory for structure.

  if(my_ptr != NULL)  // Check to make sure allocation was successful.
   {
    // Initialize members of the structure.
    strcpy(my_ptr->element_name, "Nitrogen");
    my_ptr->atomic_weight = 14.0067;
    
    // Display members of the dynamically-allocated structure.
    cout << "Element Name: " << my_ptr->element_name << endl; 
    cout << "Atomic Weight: " << my_ptr->atomic_weight << endl;

    delete my_ptr;  // Free memory used by the data.
   }
  else
   {
    cout << "Memory allocation was unsuccessful.\n";
   }
  return 0;
}
