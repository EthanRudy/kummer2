#include < iostream >

#include < time.h >

using namespace std;

int main() 
{

	char sdate[9];

	char stime[9];

	_strdate_s( sdate );

	_strtime_s( stime );

	cout << "time: " << stime << " date: " << sdate << endl;

	return 0;
}


