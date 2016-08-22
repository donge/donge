#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class CheapestTabComplete
{ 
public: 
  int getFewest(vector <string> names, string w) { 
    int res;
	int i = 0, j  = 0;
	int min;
	int mins = 99999;
	for(i = 0; i < names.size(); ++i)
	{
		if(!ispre(names[i], w)) continue;

		min  = i + w.size() -names[i].size() + 1;
if(mins > min) mins = min;
		for(j = 1; j < names[i].size(); ++j)
		{
			string s = names[i].substr(0,j+1);
			int sum = 0;
			for(int k = 0; k < i; ++k)
				if(ispre(s, names[k])) sum++;

			if(j+sum+ w.size() -names[i].size() < min) min = j+ sum+ w.size() -names[i].size();

		}


	}if(mins > min) mins = min;

	return mins+1 < w.size()+1 ? mins+1 : w.size()+1;

	
  }


	bool ispre(string a, string b)
	{
		if(a.size() > b.size()) return false;

		for(int i = 0; i < a.size(); i++)
		{
			if(a[i] != b[i]) return false;
		}

		return true;
	}



  

}; 


// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
