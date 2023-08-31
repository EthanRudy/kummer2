#include <iostream.h>

main()
{
 int i,j;
 cout << "BEGIN\n";
 for(i = 1; i <= 3; i++)
  {
   cout << " Outer loop: i = " << i << '\n';
   for(j = 1; j <= 4; j++)
    cout << "     Inner loop: j = " << j << '\n';
  }
 cout << "END\n";
 return 0;
}
