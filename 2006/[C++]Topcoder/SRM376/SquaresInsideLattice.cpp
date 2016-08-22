#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class SquaresInsideLattice
{ 
public: 
  long long howMany(int width, int height) { 
    long long res = 0;
	int min = width < height ? width : height;
	int i;

	for (i = 0; i < min; ++i)
	{
		res += (width - i) * (height - i);
		if ((i+1) % 2 == 0)
		{
			res += (width - i) * (height - i);
		}
	}

	for(i = 3; i <= min; ++i)
	{
			int j = i / 2;

			res += j * 2 * (width - i + 1) * (height - i + 1);

	}
    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const long long &Expected, const long long &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { int Arg0 = 1; int Arg1 = 1; long long Arg2 = 1LL; verify_case(0, Arg2, howMany(Arg0, Arg1)); }
	void test_case_1() { int Arg0 = 2; int Arg1 = 3; long long Arg2 = 10LL; verify_case(1, Arg2, howMany(Arg0, Arg1)); }
	void test_case_2() { int Arg0 = 3; int Arg1 = 3; long long Arg2 = 20LL; verify_case(2, Arg2, howMany(Arg0, Arg1)); }
	void test_case_3() { int Arg0 = 27; int Arg1 = 19; long long Arg2 = 23940LL; verify_case(3, Arg2, howMany(Arg0, Arg1)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  SquaresInsideLattice ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
