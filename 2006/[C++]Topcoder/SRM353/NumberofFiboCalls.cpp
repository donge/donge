#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;
int t0 = 0, t1 = 0; 
class NumberofFiboCalls
{ 
public: 
	int fib(int n)
	{
		if(n == 0)
		{
			t0++;
			return 0;
		}
		if(n == 1)
		{
			t1++;
			return 1;
		}
		return fib(n - 1) + fib(n - 2);
	}

	vector <int> fiboCallsMade(int n) {
		vector <int> res;
		fib(n);
		res.push_back(t0);
		res.push_back(t1);

    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
