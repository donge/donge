#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class ReversingBrackets
{ 
public: 
  string removeBrackets(string s) { 
    string res;
	int b = -1, e = -1;

	for(int i = 0; i < s.size(); ++i) {
		if(s[i] == '[') b = i;
		if(s[i] == ']') e = i;
	}

	if(b == -1 && e == -1) return s;

	res = s.substr(0, b);

	for(int j = e-1; j > b; j--) {
		res += s[j]; 
	}
	res += s.substr(e+1);

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const string &Expected, const string &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = "he[row oll]ld"; string Arg1 = "hello world"; verify_case(0, Arg1, removeBrackets(Arg0)); }
	void test_case_1() { string Arg0 = "ab[edc]f"; string Arg1 = "abcdef"; verify_case(1, Arg1, removeBrackets(Arg0)); }
	void test_case_2() { string Arg0 = "topcoder"; string Arg1 = "topcoder"; verify_case(2, Arg1, removeBrackets(Arg0)); }
	void test_case_3() { string Arg0 = "[desrever lla]"; string Arg1 = "all reversed"; verify_case(3, Arg1, removeBrackets(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  ReversingBrackets ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
