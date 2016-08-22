#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class ProseFlip
{ 
public: 
  vector <string> getFlip(vector <string> text) { 
    vector <string> res;
	int i, j;
	for(j = 0; j < text[0].size(); ++j) 
	{
		string s;
		for(i = 0; i < text.size(); ++i)
		{
			s += text[i][j];
		}
		res.push_back(s);
	}
    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
