//  *********************************************************************************

// Gamecode.h		Version 6a		8/12/03
// Header file to declare the three game loop functions
#ifndef gamecode_h
#define gamecode_h

int GameInit();

int GameMain();

void GameShutdown();

void InitRandom ();
int GetRandNum (int LLimit, int ULimit);



// For reading keyboard
#define KEYPRESSED(vk_code) ((GetAsyncKeyState(vk_code) & 0x8000) ? 1 : 0)

#define SCREENWIDTH 800
#define SCREENHEIGHT 600
#define COLOURDEPTH 16


#endif