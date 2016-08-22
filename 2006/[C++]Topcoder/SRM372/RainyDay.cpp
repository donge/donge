#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class RainyDay
{ 
public:

int minRains(string forecast, int uncovered)
{
int steps = 2 * uncovered;
if (steps >= forecast.size())
return count(forecast.begin(), forecast.end(), 'R');
forecast += forecast.substr(0, steps);
int result = count(forecast.begin(), forecast.begin() + steps, 'R');
int min = result;
for (int i = steps; i < forecast.size(); ++i)
{
if (forecast[i - steps] == 'R')
--result;
if (forecast[i] == 'R')
++result;
if (result < min)
min = result;
}
return min;
}

  int minimumRainTime(string path, string forecast) { 
int curPos = path.find('Y');
int homePos = path.find('H');
int inc = homePos > curPos ? 1 : -1;
if (forecast.find('.') == string::npos)
{
int c = 0;
for (int i = curPos + inc; i != homePos; i += inc)
c += path[i] == '.';
return c * 2;
}
if (forecast.find('R') == string::npos)
return 0;
int result = 0;
for (int i = curPos + inc; i != homePos; i += inc)
{
if (path[i] == 'C')
continue;
int j = i + inc;
for ( ; path[j] =='.' ; j += inc);
int minimumRains = minRains(forecast, inc == 1 ? (j - i) : 1);
result += inc == 1 ? minimumRains : minimumRains * (j - i) * inc;
i = j - inc;
}
return result;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = "Y..H"; string Arg1 = "R.RR"; int Arg2 = 3; verify_case(0, Arg2, minimumRainTime(Arg0, Arg1)); }
	void test_case_1() { string Arg0 = "Y.C.H"; string Arg1 = "RRRR."; int Arg2 = 2; verify_case(1, Arg2, minimumRainTime(Arg0, Arg1)); }
	void test_case_2() { string Arg0 = "Y..C.H"; string Arg1 = "RRR.R."; int Arg2 = 3; verify_case(2, Arg2, minimumRainTime(Arg0, Arg1)); }
	void test_case_3() { string Arg0 = "CCH..Y"; string Arg1 = "RRRR.R"; int Arg2 = 2; verify_case(3, Arg2, minimumRainTime(Arg0, Arg1)); }
	void test_case_4() { string Arg0 = "CCH.........Y"; string Arg1 = "............."; int Arg2 = 0; verify_case(4, Arg2, minimumRainTime(Arg0, Arg1)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  RainyDay ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
