#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class LuckyTicketSubstring
{ 
public: 
	int test(string s)
	{
		int sum = 0, i;
		for(i = 0; i < s.size() / 2; ++i)
		{
			sum += (s[i]-'0');
		}
		for(i = s.size() / 2; i < s.size(); ++i)
		{
			sum -= (s[i]-'0');
		}
		if (sum == 0) return 1;
		else return 0;
	}
  int maxLength(string s) { 
	int i = 0, j = 0;
	int max = 0;
	for(i = 0; i < s.size(); ++i)
	{
		string sub = s.substr(i);
		//cout << sub << endl;
		for(j = 2; j <= sub.size(); j+=2)
		{
			string ss = sub.substr(0, j);
			if (test( ss ) && ss.size() > max)
			{
				max = ss.size();
			}
		}

	}

    return max;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = "123231"; int Arg1 = 6; verify_case(0, Arg1, maxLength(Arg0)); }
	void test_case_1() { string Arg0 = "74233285"; int Arg1 = 4; verify_case(1, Arg1, maxLength(Arg0)); }
	void test_case_2() { string Arg0 = "986561517416921217551395112859219257312"; int Arg1 = 36; verify_case(2, Arg1, maxLength(Arg0)); }
	void test_case_3() { string Arg0 = "1"; int Arg1 = 0; verify_case(3, Arg1, maxLength(Arg0)); }
	void test_case_4() { string Arg0 = "112"; int Arg1 = 2; verify_case(4, Arg1, maxLength(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  LuckyTicketSubstring ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
