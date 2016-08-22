#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class SupermarketDiscount
{ 
public: 
  int minAmount(vector <int> goods) { 
    int res = 0;
	sort(goods.begin(), goods.end());

	if(goods[0] >= 50)
		res = goods[0] + goods[1] + goods[2] - 30;
	else if(goods[1] >= 50)
		res = goods[0] + goods[1] + goods[2] - 20;
	else if(goods[2] >= 50)
	{
		if(goods[0] + goods[1] >= 50)
			res = goods[0] + goods[1] + goods[2] - 20;
		else 
			res = goods[0] + goods[1] + goods[2] - 10;
	}
	else if(goods[0] + goods[1] + goods[2] >= 50)
		res = goods[0] + goods[1] + goods[2] - 10;
	else
		res = goods[0] + goods[1] + goods[2];
    // My Solution

    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
