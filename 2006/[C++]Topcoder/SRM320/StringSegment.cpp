#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class StringSegment
{ 
public: 
  double average(string s) { 
    double res = 0;
	char c = s[0];
	int num = 1;
	for(int i = 1; i < s.size(); ++i)
	{
		if(s[i] != c)
		{
			num++;
			c = s[i];
		}
	}
	cout << num << endl;

    return  (double)s.size() / (double)num;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const double &Expected, const double &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = "aaabbaaac"; double Arg1 = 2.25; verify_case(0, Arg1, average(Arg0)); }
	void test_case_1() { string Arg0 = "aabbccdd"; double Arg1 = 2.0; verify_case(1, Arg1, average(Arg0)); }
	void test_case_2() { string Arg0 = "abba"; double Arg1 = 1.3333333333333333; verify_case(2, Arg1, average(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  StringSegment ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
