#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
#include <cmath>
using namespace std;

class RadarFinder
{ 
public: 
  int possibleLocations(int x1, int y1, int r1, int x2, int y2, int r2) { 
    int res;
	double x2y = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
	if(x2y > r1 + r2) return 0;
	if(x2y == r1 + r2) return 1;
	if(x2y < r1 + r2)
	{
		if(abs(r1 - r2) < x2y) return 2;
		if(abs(r1 - r2) == x2y && x2y != 0) return 1;
		if(x2y == 0 && r1 == r2) return -1;
		else return 0;

	}

    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { int Arg0 = 0; int Arg1 = 0; int Arg2 = 13; int Arg3 = 40; int Arg4 = 0; int Arg5 = 37; int Arg6 = 2; verify_case(0, Arg6, possibleLocations(Arg0, Arg1, Arg2, Arg3, Arg4, Arg5)); }
	void test_case_1() { int Arg0 = 0; int Arg1 = 0; int Arg2 = 3; int Arg3 = 0; int Arg4 = 7; int Arg5 = 4; int Arg6 = 1; verify_case(1, Arg6, possibleLocations(Arg0, Arg1, Arg2, Arg3, Arg4, Arg5)); }
	void test_case_2() { int Arg0 = 0; int Arg1 = 0; int Arg2 = 5; int Arg3 = 10; int Arg4 = 10; int Arg5 = 3; int Arg6 = 0; verify_case(2, Arg6, possibleLocations(Arg0, Arg1, Arg2, Arg3, Arg4, Arg5)); }
	void test_case_3() { int Arg0 = 0; int Arg1 = 0; int Arg2 = 1; int Arg3 = 0; int Arg4 = 0; int Arg5 = 1; int Arg6 = -1; verify_case(3, Arg6, possibleLocations(Arg0, Arg1, Arg2, Arg3, Arg4, Arg5)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  RadarFinder ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
