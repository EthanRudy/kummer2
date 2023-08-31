/*
 * pong.h
 *
 *  Created on: Nov 8, 2011
 *      Author: kruegerc
 */

#ifndef PONG_H_
#define PONG_H_
#include<CMUgraphics.h>
#include<sstream>
#include<string>
#include<stdlib.h>
using namespace std;
 class pong
 {
 public:
	 pong(window &mywindow);
	 void movepaddle1(int xpos);
	 void movepaddle2(int xpos);
	 int getpaddle1();
	 int getballx();
	 void setball(int ballx,int bally);
	 int getscore1();
	 int getscore2();
	 int getbally();
	 int getpaddle2();
	 void moveball();
	 void refresh(window &mywindow);
private:
	 int p1score,p2score,pnum;
	 int p1x,p1y,p1w,p1h;
	 int p2x,p2y,p2w,p2h;
	 int bx,by,bmx,bmy;
 };
int pong::getpaddle1()
 {
	 return p1x;
 }
int pong::getscore1()
 {
	 return p1score;
 }
int pong::getscore2()
 {
	 return p2score;
 }
void setball(int ballx,int bally)
{
	bx = ballx;
	by = bally;
}
int pong::getballx()
 {
	 return bx;
 }
int pong::getbally()
 {
	 return by;
 }
int pong::getpaddle2()
 {
	 return p2x;
 }
void pong::movepaddle1(int xpos)
 {
	 p1x=xpos;
 }
void pong::movepaddle2(int xpos)
 {
	  p2x=xpos;
 }
pong::pong(window &mywindow)
{
	mywindow.ChangeTitle("Pong");
	p1x = 290;
	p2x = 290;
	p1w = 120;
	p1h = 10;
	p2w = 120;
	p2h = 10;
	p1y = 10;
	p2y = 620;
	bx = 320;
	by = 320;
	bmx = 17;
	bmy = 20;
	p1score = 0;
	p2score = 0;
}
void pong::refresh(window &mywindow)
{
	stringstream tv;
mywindow.SetBrush(WHITE);
mywindow.SetPen(WHITE);
mywindow.DrawRectangle(0,0,640,640);
mywindow.SetBrush(BLACK);
mywindow.SetPen(BLACK);
mywindow.DrawRectangle(p1x,p1y,p1x+p1w,p1y+p1h);
mywindow.DrawRectangle(p2x,p2y,p2x+p2w,p2y+p2h);
mywindow.DrawCircle(bx,by,10);
mywindow.SetFont(12, BOLD, BY_NAME, "Arial");
tv<<"Player 1:"<<p1score;
mywindow.DrawString(0, 80, tv.str());
tv.str("");
tv<<"Player 2:"<<p2score;
mywindow.DrawString(0, 100, tv.str());

}
void pong::moveball()
{
	bx = bx + bmx;
	by = by + bmy;
	if(bx<5)
	{bx = 5;
	bmx = 17;}
	if(bx>635)
	{bx = 635;
	bmx = -17;}
	if (by>620)
	{
		if (bx-p2x<110 and bx - p2x>-10)
		{
		by = 620;
		bmy = -20;
		}
		else
		{
			bmy = -20;
			p1score++;
		}
	}
	if (by<20)
	{
		if (bx-p1x<110 and bx - p1x>-10)
		{
		by = 20;
		bmy = 20;
		}
		else
		{
			bmy = 20;
			p2score++;
		}

	}




}
#endif /* PONG_H_ */
