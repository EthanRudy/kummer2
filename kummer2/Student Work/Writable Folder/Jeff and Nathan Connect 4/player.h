/*
 * player.h
 *
 *  Created on: Nov 4, 2011
 *      Author: zhengj
 */
#include <math.h>
#include <string>
#include <sstream>
#include <cstring>

using namespace std;

#ifndef PLAYER_H_
#define PLAYER_H_

class player{
public:
	player();
	string pscore(int score, string name);
private:
};
player::player(){

}
string player::pscore(int score, string name){
	string pscore= "",hold ="";
	ostringstream buffer(name);
	buffer << hold;
	pscore = name + " " + buffer.str();
	return pscore;
}

#endif
