#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class HockeyFault
{ 
public: 
  int numPlayers(int width, int height, int x, int y, vector <int> px, vector <int> py) { 
    int res = 0;
	int r = height / 2.0;
	for(int i = 0; i < px.size(); ++i)
	{
		int xx = px[i];
		int yy = py[i];
		if( (xx - x) * (xx - x) + (yy - y - r) * (yy - y - r) >  (r * r) &&
			(xx - x - width) * (xx - x - width) + (yy - y - r) * (yy - y - r) >  (r * r) &&
			((xx < x || xx > x + width) || (yy < y || yy > y + height)) ) 
		{
			continue;
		}
		res++;
	}

    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
