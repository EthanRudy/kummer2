/* 
See "CMUgraphics.h" for version info and copyright information
This file was last modified on 06.12.2000
*/

#include <CMUgraphics.h>

bool operator==(color a, color b) {
  return ((a.ucRed == b.ucRed) && (a.ucGreen == b.ucGreen) && (a.ucBlue == b.ucBlue));
}

bool operator!=(color a, color b) {
  return !(a == b);  
}
