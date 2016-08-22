#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class Bigital
{ 
public: 
	int calc(int n)
	{
		int w = 0;
		while(n)
		{
			if(n % 2 == 1)
			{
				w++;
			}
			n = n / 2;
		}
		return w;
	}
  double energy(string tStart, string tEnd) { 
	int inter = 0;
	int i;
	int s[3], e[3];
	s[0] = atoi(tStart.substr(0, 2).c_str());
	s[1] = atoi(tStart.substr(3, 5).c_str());
	s[2] = atoi(tStart.substr(6, 8).c_str());
	e[0] = atoi(tEnd.substr(0, 2).c_str());
	e[1] = atoi(tEnd.substr(3, 5).c_str());
	e[2] = atoi(tEnd.substr(6, 8).c_str());

	int walt = 0;
	while(1)
	{
		for(i = 0; i < 3; ++i)
		{
			walt += calc(s[i] / 10);
			walt += calc(s[i] % 10);
		}
		inter++;

		if(s[0] == e[0] && s[1] == e[1] && s[2] == e[2]) break;

		s[2]++;
		if(s[2] == 60) {s[1]++;s[2] = 0;}
		if(s[1] == 60) {s[0]++;s[1] = 0;}
		if(s[0] == 13) {s[0] = 1;}
	}
	
    return (double)walt/3600000;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const double &Expected, const double &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = "12:00:00"; string Arg1 = "12:00:00"; double Arg2 = 5.555555555555555E-7; verify_case(0, Arg2, energy(Arg0, Arg1)); }
	void test_case_1() { string Arg0 = "12:59:59"; string Arg1 = "01:00:00"; double Arg2 = 3.0555555555555556E-6; verify_case(1, Arg2, energy(Arg0, Arg1)); }
	void test_case_2() { string Arg0 =  "12:01:00"; string Arg1 = "12:00:00"; double Arg2 = 0.08392277777777778; verify_case(2, Arg2, energy(Arg0, Arg1)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  Bigital ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
