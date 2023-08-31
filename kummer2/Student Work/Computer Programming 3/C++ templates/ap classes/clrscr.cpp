//  clrscr.cpp
//
//  adapted from 
//  Vincent Fatica
//  vefatica@syr.edu
//  Syracuse University Mathematics
//  http://barnyard.syr.edu/~vefatica/
//
//  by Shannon Bauman
//  August 9, 1998
//
//  clear entire console screen buffer

#include <windows.h>
#include <conio.h>

int clrscr()
{

  HANDLE hndl = GetStdHandle(STD_OUTPUT_HANDLE);
  CONSOLE_SCREEN_BUFFER_INFO csbi;
  GetConsoleScreenBufferInfo(hndl, &csbi);
  DWORD written;
  DWORD N = csbi.dwSize.X * csbi.dwCursorPosition.Y +
            csbi.dwCursorPosition.X + 1;
  COORD curhome = {0,0};

  FillConsoleOutputCharacter(hndl, ' ', N, curhome, &written);
  csbi.srWindow.Bottom -= csbi.srWindow.Top;
  csbi.srWindow.Top = 0;
  SetConsoleWindowInfo(hndl, TRUE, &csbi.srWindow);
  SetConsoleCursorPosition(hndl, curhome);

  return 0;
}
