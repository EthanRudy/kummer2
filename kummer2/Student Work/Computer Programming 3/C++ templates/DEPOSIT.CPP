#include <iostream.h>

main()
{
  float amount_to_deposit;

  cout << "How much do you want to deposit to open the account? ";
  cin  >> amount_to_deposit;

  if(amount_to_deposit < 1000.00 )
   {
    if(amount_to_deposit < 100.00 )
     { cout << "You should consider the EconoCheck account.\n"; }
    else
     { cout << "You should consider the FreeCheck account.\n"; }
   }
  else
   { cout << "You should consider an interest-bearing account.\n"; }
  return 0;
}
