#include<iostream.h>
#include<iomanip.h>

main()
{
 int shipping_method;
 double shipping_cost;

 cout << "How do you want the order shipped?\n";
 cout << "1 - Ground\n";
 cout << "2 - 2-day air\n";
 cout << "3 - Overnight air\n";
 cout << "Enter the number of the shipping method you want: ";
 cin >> shipping_method;

 switch(shipping_method)
  {
    case 1:
	shipping_cost = 5.00;
	break;
    case 2:
	shipping_cost = 7.50;
	break;
    case 3:
	shipping_cost = 10.00;
	break;
    default:
	shipping_cost = 0.00;
	break;
  }

 if (shipping_cost == 0)
   {
     cout << "Illegal selection--no result calculated" << endl;
   }
 else
   {
     cout.setf(ios::showpoint);
     cout << "Add $" << setprecision(2) << shipping_cost
	  << " to the order total to cover shipping cost." << endl;
   }

 return 0;
}
