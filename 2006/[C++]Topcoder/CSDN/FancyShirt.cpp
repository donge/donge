#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class FancyShirt
{ 
public: 
  vector <int> whichShirt(vector <int> fanciness, vector <int> price) { 
    vector <int> res, fanc, pri;
	int i, j;
	int p = 0, f = 0;
	int need = 0;
	if(fanciness.size() < 1) return res;
	fanc = fanciness;
	pri = price;
	sort(fanciness.begin(), fanciness.end());
	f = fanciness[fanciness.size() -1];
	sort(price.begin(), price.end());
	p = price[price.size() -1];
	cout << f << endl << p << endl;
	for(i = 0; i < fanc.size(); ++i)
	{
		if(f == fanc[i] || p == pri[i])
		{
			pri.erase(pri.begin()+i);
			fanc.erase(fanc.begin()+i);
			i--;
			cout << i << endl;
		}
	}
	if(fanc.size() == 0) return res;

	vector <int> ff = fanc;
	sort(ff.begin(), ff.end());
	need = ff[ff.size()-1];
	int min = 99999;
	for(i = 0; i < pri.size(); ++i)
	{
		if(fanc[i] == need && pri[i] < min)
		{
			min = pri[i];
		}
	}
	res.push_back(need);
	res.push_back(min);
    // My Solution

    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
