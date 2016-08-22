#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class KnightTour
{ 
public: 
  string checkTour(vector <string> cells) { 
	int m[6][6];
	int i, j;


	int fr = 0;
	int fc = 0;
	int r = 0;
	int c = 0;
	int oor = 0;
	int oc = 0;
	for(i = 0; i < 6; ++i) 
		for(j = 0; j < 6; ++j) 
			m[i][j] = 0;

	for(i = 0; i < cells.size(); ++i)
	{
		r = cells[i][1] - '1';
		c = cells[i][0] - 'A';
		
		int k = (oor - r) * (oc - c);
		if(k < 0) k = 0 - k;
		
		if(i == 0) {fr = r; fc = c;}
		if( k != 2 && i > 0) return "Invalid";

		if(m[r][c] == 1)
		{
			return "Invalid";
		}
		else 
		{
			m[r][c] = 1;
		}
		oor = r;
		oc = c;
	}

		int k = (fr - r) * (fc - c);
		if(k < 0) k = 0 - k;
		if( k != 2 && i > 0) return "Invalid";

    // My Solution
    return "Valid";
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
