#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class TrueStatements
{ 
public: 
  int numberTrue(vector <int> statements) { 
    int res;
	vector<int> a(51, 0);
	
	for(int i = 0; i < statements.size(); ++i)
	{
		a[statements[i]]++; 
	}

	for(int j = 50; j >=0; j --)
	{
		if (a[j] == j) return j;
	}
    return -1;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
