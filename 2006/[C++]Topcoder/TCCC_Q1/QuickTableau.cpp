#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class QuickTableau
{ 
public: 
  int numSwaps(vector <int> table) { 
    int res;

    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { int Arr0[] = {
 1,  2,  3,  4,
 5,  6,  7,  8,
 9, 10, 11, 12,
13, 14, 15, 16
}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 0; verify_case(0, Arg1, numSwaps(Arg0)); }
	void test_case_1() { int Arr0[] = {
16, 15, 14, 13,
12, 11, 10,  9,
 8,  7,  6,  5,
 4,  3,  2,  1
}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 6; verify_case(1, Arg1, numSwaps(Arg0)); }
	void test_case_2() { int Arr0[] = {
 2,  1,  3,  4,
 5,  6,  7,  8,
 9, 10, 11, 12,
13, 14, 15, 16
}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 1; verify_case(2, Arg1, numSwaps(Arg0)); }
	void test_case_3() { int Arr0[] = {
 4,  3,  2,  1,
 5,  6,  7,  8,
 9, 10, 11, 12,
13, 14, 15, 16
}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(3, Arg1, numSwaps(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  QuickTableau ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
