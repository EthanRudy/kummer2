// Airline Flight Cost Analysis
// By Brian Davis and Todd Woolery

#include<iostream.h>  // necessary for input/output
#include<iomanip.h>   // necessary for setprecision manipulator

// main function
main ()
{
 // constants to set specifications for a Boeing 747-400
 // Source: The World Almanac and Book of Facts 1995
 char const plane_name[] = "Boeing 747-400";
 int const plane_speed = 533;
 int const number_of_seats = 398;
 int const max_flight_length = 4331;
 int const cost_per_hour = 6939;

 int num_pass;            // number of passengers on the plane
 float num_miles;         // flight distance
 float avg_ticket_price;  // average ticket price for flight
 float flight_cost;       // cost for the flight
 float cost_per_pass;     // cost per passenger
 float total_fares;       // total fares collected for the flight
 float profit;            // profit for the flight
 float hours;             // length of flight in hours

 cout << "\nAIRLINE FLIGHT ANALYSIS\n";
 cout << "Airplane name: " << plane_name << endl;
 cout << "Enter the number of passengers on the flight (maximum "
      << number_of_seats << "): ";
 cin >> num_pass;
 cout << "Enter the distance (in miles) of the flight (maximum "
      << max_flight_length << "): ";
 cin >> num_miles;
 cout << "Enter the average ticket price: ";
 cin >> avg_ticket_price;

 hours = num_miles / plane_speed;  // calculate time required for flight
 flight_cost = hours * cost_per_hour; // calculate cost of flight
 cost_per_pass = flight_cost / num_pass; // calculate cost per passenger
 total_fares = num_pass * avg_ticket_price; // calculate total fares
 profit = total_fares - flight_cost; // calculate flight profit

 cout.setf(ios::showpoint);  // force decimal point to be displayed
 cout.setf(ios::fixed);      // prevent scientific notation
 cout << "\nAnalysis for " << plane_name << endl;
 cout << "\nThe flight will take approximately " << setprecision(2)
      << hours << " hours.\n";
 cout << "The cost of the flight will be $" << flight_cost 
      << ", with a \n";
 cout << "cost per passenger of $" << cost_per_pass << ".\n";
 cout << "The total fares collected from ticket sales is $" 
      << total_fares << ",\n";
 cout << "resulting in a profit of $" << profit << ".\n";
 return 0;
}
