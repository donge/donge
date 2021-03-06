#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class CodeRed
{ 
public: 
  int count(string text) { 
    int res;

    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = "the detective questioned his credibility"; int Arg1 = 1; verify_case(0, Arg1, count(Arg0)); }
	void test_case_1() { string Arg0 = "Server ERRED in Redirecting Spam"; int Arg1 = 2; verify_case(1, Arg1, count(Arg0)); }
	void test_case_2() { string Arg0 = "  read the RED sign   said fReD"; int Arg1 = 2; verify_case(2, Arg1, count(Arg0)); }
	void test_case_3() { string Arg0 = "pure delight"; int Arg1 = 0; verify_case(3, Arg1, count(Arg0)); }
	void test_case_4() { string Arg0 = "re"; int Arg1 = 0; verify_case(4, Arg1, count(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  CodeRed ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
