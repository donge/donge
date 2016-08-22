#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class PlatformJumper
{ 
public: 
  int maxCoins(vector <string> platforms, int v, int g) { 
    int res;

    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arr0[] = {"3 10 7", "5 15 7", "8 9 12" }; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; int Arg2 = 10; int Arg3 = 14; verify_case(0, Arg3, maxCoins(Arg0, Arg1, Arg2)); }
	void test_case_1() { string Arr0[] = {"0 0 1", "2 4 1", "4 0 1"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 1; int Arg2 = 2; int Arg3 = 2; verify_case(1, Arg3, maxCoins(Arg0, Arg1, Arg2)); }
	void test_case_2() { string Arr0[] = {"0 0 1", "5000 5000 10"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 100; int Arg2 = 87; int Arg3 = 10; verify_case(2, Arg3, maxCoins(Arg0, Arg1, Arg2)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  PlatformJumper ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
