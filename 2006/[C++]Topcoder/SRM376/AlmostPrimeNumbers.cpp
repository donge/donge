#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class AlmostPrimeNumbers
{ 
public: 
  int getNext(int m) { 
    int res = m;
	int i = 0;
	while(1)
	{
		res++;
		int ok = 1;
		for(i = 2; i <= 10; ++i )
		{
			if ((res % i) == 0) 
			{
				ok = 0;
				break;
			}
		}
		if(ok)
		{
			for(i = 2; i * i <= res; ++i)
			{
				if(res % i == 0)
				{
					return res;
				}
			}
		}
	}
    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
