#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
#include <numeric>
using namespace std;

class RaceManagement
{ 
public: 
  double getPayoutFactor(vector <int> probability, vector <int> amounts, int minimumMoney) { 
    double res;
	int sum = 0;
	double tie = 1.0;
	double nowin = 1.0;
	int i = 0;
	int n = probability.size();
	for(i = 0; i < n; ++i)
	{
		nowin *= (100 - probability[i]) / 100.0;
		tie *= probability[i] / 100.0;
	}

	if(n == 1) tie = 0;

	int total = accumulate(amounts.begin(), amounts.end(), 0);

	double X = minimumMoney - (tie + nowin) * total;
	double Y = 0;
	for(i = 0; i < n; ++i)
	{
		X = X - (probability[i] / 100.0 - tie) * (total-amounts[i]);
		Y = Y - (probability[i] / 100.0 - tie) * amounts[i];
	}
	cout << tie << endl;
	cout << X << endl;
	cout << Y << endl;
	if(Y == 0) return -2;
	res =  X / Y;
	if(res < 0) return -1;
    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
