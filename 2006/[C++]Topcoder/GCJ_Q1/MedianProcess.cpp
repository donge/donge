#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class MedianProcess
{ 
public: 
  int getScore(vector <int> values) { 

	if(values.size() == 0) return 0;
	sort(values.begin(), values.end());

	if(values.size() % 2 == 1)
	{
		int m = values[(values.size()-1) / 2];
		values.erase(values.begin() + (values.size()-1) / 2);
		return m + getScore(values);
	}

	if(values.size() % 2 == 0)
	{
		int m = values[values.size()-1];
		values.erase(values.end()-1);
		return getScore(values) - m;

	}
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_1(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
//	void test_case_0() { int Arr0[] = {}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 0; verify_case(0, Arg1, getScore(Arg0)); }
	void test_case_1() { int Arr0[] = {2}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(1, Arg1, getScore(Arg0)); }
	void test_case_2() { int Arr0[] = {2,3}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = -1; verify_case(2, Arg1, getScore(Arg0)); }
	void test_case_3() { int Arr0[] = {1,1,1,1}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 0; verify_case(3, Arg1, getScore(Arg0)); }
	void test_case_4() { int Arr0[] = {371,-56,933,519,583,520,938,-398,75,-269,895,-790,982,-941,937,888,-416,-360,714,-594,-783,431,595}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = -12234; verify_case(4, Arg1, getScore(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  MedianProcess ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
