// GameTimer.cpp		Version 7			8/12/03	
// The definition file for the methods in "GameTimer", declared in gametimer.h

#include "GameTimer.h"


GameTimer::GameTimer()
{
	if(QueryPerformanceFrequency(&freq)==0)		// Find the timer frequency
	{
		freq.QuadPart=0;									// Set to zero if function failed

	}

	mdGameRate = 1.0;
}


void GameTimer::mark()
{
//	mdMinimumFrameTime=0;

	if (freq.QuadPart<=0)		// If frequency is zero (if QueryPerformanceCounter failed)
	{
		last.QuadPart=0;			// Set everything to zero
		mdFrameTime=0;
	}
	else
	{
		LARGE_INTEGER now;

		QueryPerformanceCounter(&now);		// Get current time

		mdFrameTime=0.0;						// Set to zero, ready for loop
		while(mdFrameTime<=mdMinimumFrameTime)	// Causes a delay until minimum frame time has elapsed
		{

			mdFrameTime=(now.QuadPart - last.QuadPart)/(double)freq.QuadPart;
											// Find time elapsed since last mark, and divide by
											// frequency to convert to seconds

			mdFrameTime = mdFrameTime * mdGameRate;
			
			QueryPerformanceCounter(&now);		// Get current time
		}
		last=now;						// Update mark time with current time
	}
}

void GameTimer::setMinimumFrameTime(double minTime)
{
	if(minTime>0.0)
	{
		mdMinimumFrameTime = minTime;
	}
	else 
		mdMinimumFrameTime=0.0;
	
}
