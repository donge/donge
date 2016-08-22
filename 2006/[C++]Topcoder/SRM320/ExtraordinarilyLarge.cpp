#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class ExtraordinarilyLarge
{ 
public: 
	int f(int i)
	{
		if(i == 0 || i == 1) return 1;
		return i * f(i-1);
	}

  string compare(string x, string y) { 
    string res;
	int i;
	int xx = x[0]-'0';
	int yy = y[0]-'0';


		while(x[x.size()-1] =='!' && y[y.size()-1] =='!') 
		{
			x = x.substr(0, x.size()-1);
			y = y.substr(0, y.size()-1);
		}



	for(i = 1; i < x.size(); ++i)
	{
		if(x[i] == '!') 
		{
			if(xx > 11 ) return "x>y";
			xx = f(xx);
		}
		else
		{
			xx = xx * 10 + (x[i]-'0');
		}
	}

	for(i = 1; i < y.size(); ++i)
	{
		if(y[i] == '!') 
		{
			if(yy > 11 ) return "x<y";
			yy = f(yy);
		}
		else
		{
			yy = yy * 10 + (y[i]-'0');
		}
	}
    
	if(xx > yy) return "x>y";
	if(xx < yy) return "x<y";

    return "x=y";
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
