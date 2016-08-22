#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class ChessboardPattern
{ 
public: 
  vector <string> makeChessboard(int rows, int columns) { 
    vector <string> res;
	int i, j;


	bool ok = true;
	if(rows % 2 == 0) ok = false;
	for( i = 0; i < rows; ++i)
	{
		string tmp;

		for( j = 0; j < columns; ++j)
		{
			if(ok)
			{
				tmp += '.';
				ok = false;
			}
			else
			{
				tmp += 'X';
				ok = true;
			}
		}
		if(columns % 2 == 0) 
		{
			if(ok) ok = false;
			else ok = true;
		}

		res.push_back(tmp);
	}
    // My Solution

    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
