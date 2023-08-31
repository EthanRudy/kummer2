#include<iostream.h>

main()
{
 int white, black, friendly, acceptable;

 white = 1;     // dog is white
 black = 0;     // dog is not black
 friendly = 0;  // dog is not friendly

 // The following statement produces incorrect results due to the
 // order of operations.
 acceptable = (white || black && friendly);
 cout << acceptable << '\n';

 // The parentheses in the following statement overrides the
 // order of operations and the statement produces the correct result.
 acceptable = ((white || black) && friendly);
 cout << acceptable << '\n';

 return 0;
}
