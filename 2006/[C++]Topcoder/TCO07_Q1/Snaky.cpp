#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class Snaky
{ 
public: 
  int longest(vector <string> snake) { 
	int i, j;
	int max = 0;
	int c = 0;

	for(i = 0; i < snake.size(); ++i)
	{
		for(j = 0; j < snake[0].size(); ++j)
		{
			if(snake[i][j] == 'x')
			{
				c++;
			}
			else
			{
				if(c > max) max = c;
				c = 0;
			}
		}
		if(c > max) max = c;
		c = 0;
	}

	for(j = 0; j < snake[0].size(); ++j)
	{
		for(i = 0; i < snake.size(); ++i)
		{
			if(snake[i][j] == 'x')
			{
				c++;
			}
			else
			{
				if(c > max) max = c;
				c = 0;
			}
		}
		if(c > max) max = c;
		c = 0;
	}

    return max;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
