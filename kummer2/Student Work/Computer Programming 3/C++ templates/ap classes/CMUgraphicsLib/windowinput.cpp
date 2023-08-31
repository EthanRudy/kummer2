/* 

CMUgraphics Package 1.1 
Copyright (c) 1998 by Geoff Washburn.  All rights reserved.

Please send all bug reports via e-mail to Mark Stehlik at 
'mjs@cs.cmu.edu'.

Redistribution and use in source and binary forms of this library, 
with or without modification, are permitted provided that the 
following conditions are met:
 
  1. Redistribution of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
  2. Redistribution in binary form must reproduce the above 
     copyright notice, this list of conditions and the following 
     disclaimer in the documentation and/or other materials 
     provided with the distribution.
  3. When redistributing a modified version of this library it must 
     carry prominent notices stating the name of individual(s) that 
     altered the files, the nature of the modifications, and the 
     date they were performed.
  4. No fee is charged for redistribution or use without prior 
     written permission from the author.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS 
OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY 
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;  OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

This code is not yet certified for mission critical applications,
such as navigation and/or control of aircraft.

This file was last modified on 10.11.1998

*/

#include <string>

// Needed in Visual C++ and CodeWarrior 3
using namespace std;

#include "error.h"
#include "graphics.h"
#include "windowinput.h"

windowinput::windowinput(HWND hwndNew, window* wpNewWind) {

	wiLeft = NULL;
	wiRight = NULL;

	hwndValue = hwndNew;
	wpValue = wpNewWind;

}

windowinput::~windowinput() {

	hwndValue = NULL;
	wpValue = NULL;

	if(wiLeft != NULL) {
		delete wiLeft;
	} 

	if(wiLeft != NULL) {
		delete wiRight;
	}

}

void windowinput::AddWindow(HWND hwndNew, window* wpNewWind) {

    if(hwndValue == hwndNew) {
	   return;
	} else if(hwndValue > hwndNew) {
		if(wiLeft != NULL) {
			wiLeft->AddWindow(hwndNew, wpNewWind);
		} else {
			wiLeft = new windowinput(hwndNew, wpNewWind);
			if(wiLeft == NULL) {
			    throw OUT_OF_MEMORY;
			}
		}
	} else {
		if(wiRight != NULL) {
			wiRight->AddWindow(hwndNew, wpNewWind);
		} else {
			wiRight = new windowinput(hwndNew, wpNewWind);
			if(wiRight == NULL) {
			    throw OUT_OF_MEMORY;
			}
		}
	}
}

window* windowinput::FindWindow(HWND hwndKey) {

    if(hwndValue == hwndKey) {
	   return wpValue;
	} else if(hwndValue > hwndKey) {
		if(wiLeft != NULL) {
			return wiLeft->FindWindow(hwndKey);
		} else {
			return NULL;
		}
	} else {
		if(wiRight != NULL) {
			return wiRight->FindWindow(hwndKey);
		} else {
			return NULL;
		}
	}
}

unsigned short windowinput::Count() {

	unsigned short usTotal = 0;

	if(wiLeft != NULL) {
	    usTotal += wiLeft->Count();
	} 
	
	if(wiRight != NULL) {
		usTotal += wiRight->Count();
	}

	usTotal++;

	return usTotal;
}

void windowinput::SetMouseState(HWND hwndKey, button btMouse, buttonstate bsNew, int iX, int iY) {

    window* windTmp;

	windTmp = FindWindow(hwndKey);
	if(windTmp != NULL) {
	    if(btMouse == LEFT) {
  	      windTmp->bsLeft = bsNew;
  	    } else {
  	      windTmp->bsRight = bsNew;  	    
  	    }  
   	    windTmp->iMouseX = iX;
	    windTmp->iMouseY = iY;
	}

}

void windowinput::SetMouseCoord(HWND hwndKey, int iX, int iY) {

    window* windTmp;

	windTmp = FindWindow(hwndKey);
	if(windTmp != NULL) {
	    windTmp->iMouseX = iX;
	    windTmp->iMouseY = iY;
	}
}

void windowinput::SetClickInfo(HWND hwndKey, clicktype ctInfo, int iX, int iY) {

    window* windTmp;
	mqueuenode *mqueTmp;

	windTmp = FindWindow(hwndKey);
    if(windTmp != NULL) {
        mqueTmp = new mqueuenode;
		if(mqueTmp == NULL) {
			throw OUT_OF_MEMORY;
		}
		mqueTmp->ctInfo = ctInfo;
		mqueTmp->iX = iX;
		mqueTmp->iY = iY;

		windTmp->mqueInput.Insert(mqueTmp);
	}
}

void windowinput::SetKeyInfo(HWND hwndKey, keytype ktInfo, char cValue) {

	window* windTmp;
	kqueuenode *kqueTmp;

	windTmp = FindWindow(hwndKey);
    if(windTmp != NULL) {
        kqueTmp = new kqueuenode;
		if(kqueTmp == NULL) {
			throw OUT_OF_MEMORY;
		}
		kqueTmp->ktInfo = ktInfo;
		kqueTmp->cValue = cValue;

		windTmp->kqueInput.Insert(kqueTmp);
	}
}