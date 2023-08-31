#include<iostream.h>

main()
{
  int i,j,k,l;
  cout << "i j k l\n";
  for (i = 0; i <= 1; i++)
    for (j = 0; j <= 1; j++)
      for (k = 0; k <= 1; k++)
	for (l = 0; l <= 1; l++)
	  cout << i << ' ' << j << ' ' << k << ' ' << l << '\n';
  return 0;
}