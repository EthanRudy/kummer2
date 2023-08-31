// MATRIXEX.CPP

#include "matrix.h"

int main()
{
  matrix <char> CharMatrix(3,3,' ');
  matrix <char> OriginalMatrix;
  int row, col;
  char c;

  for(row = 0; row < 3; row++)
  {
    for(col = 0; col < 3; col++)
    {
      cout << "Please enter a character for matrix position ("
	   << row << ", " << col << ") :";
      cin >> c;
      CharMatrix [row][col] = c;
    }
  }

  OriginalMatrix = CharMatrix;

  cout << "The CharMatrix has " << CharMatrix.numrows() << " rows and "
       << CharMatrix.numcols() << " columns.\n";

  CharMatrix.resize(2,2);

  cout << "CharMatrix now has " << CharMatrix.numrows() << " rows and "
       << CharMatrix.numcols() << " columns.\n";

  cout << "\nThe original matrix looked like:\n";

  for(row = 0; row < OriginalMatrix.numrows(); row++)
  {
    for(col = 0; col < OriginalMatrix.numcols(); col++)
    {
      cout << OriginalMatrix [row][col] << ' ';
    }
    cout << endl;
  }

  cout << "\nThe resized matrix looks like:\n";

  for(row = 0; row < CharMatrix.numrows(); row++)
  {
    for(col = 0; col < CharMatrix.numcols(); col++)
    {
      cout << CharMatrix [row][col] << ' ';
    }
    cout << endl;
  }

  return 0;
}