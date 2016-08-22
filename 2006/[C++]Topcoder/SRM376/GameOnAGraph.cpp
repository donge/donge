#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class GameOnAGraph
{ 
public: 
  vector <int> getMarks(vector <string> adj, string colors, string marks, int N) { 
    vector <int> res;

    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const vector <int> &Expected, const vector <int> &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: " << print_array(Expected) << endl; cerr << "\tReceived: " << print_array(Received) << endl; } }
	void test_case_0() { string Arr0[] = {"0110","1000","1000","0000"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "WBBW"; string Arg2 = "1000"; int Arg3 = 1; int Arr4[] = {1, 1, 1, 0 }; vector <int> Arg4(Arr4, Arr4 + (sizeof(Arr4) / sizeof(Arr4[0]))); verify_case(0, Arg4, getMarks(Arg0, Arg1, Arg2, Arg3)); }
	void test_case_1() { string Arr0[] = {"00000","00000","00000","00000","00000"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "BBWWW"; string Arg2 = "99999"; int Arg3 = 1; int Arr4[] = {0, 0, 9, 9, 9 }; vector <int> Arg4(Arr4, Arr4 + (sizeof(Arr4) / sizeof(Arr4[0]))); verify_case(1, Arg4, getMarks(Arg0, Arg1, Arg2, Arg3)); }
	void test_case_2() { string Arr0[] = {"01","10"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "BW"; string Arg2 = "56"; int Arg3 = 2; int Arr4[] = {6, 6 }; vector <int> Arg4(Arr4, Arr4 + (sizeof(Arr4) / sizeof(Arr4[0]))); verify_case(2, Arg4, getMarks(Arg0, Arg1, Arg2, Arg3)); }
	void test_case_3() { string Arr0[] = {"010101","101010","010101","101010","010101","101010"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "BWBWBW"; string Arg2 = "012345"; int Arg3 = 10; int Arr4[] = {59049, 177147, 59049, 177147, 59049, 177147 }; vector <int> Arg4(Arr4, Arr4 + (sizeof(Arr4) / sizeof(Arr4[0]))); verify_case(3, Arg4, getMarks(Arg0, Arg1, Arg2, Arg3)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  GameOnAGraph ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
