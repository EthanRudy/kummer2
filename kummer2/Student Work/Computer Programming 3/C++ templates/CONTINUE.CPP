#include <iostream.h>

main()
{
 int i;
 for(i = 1; i <= 10; i++)
  {
   if (i == 5)
    continue;
   cout << i << '\n';
  }
 return 0;
}
