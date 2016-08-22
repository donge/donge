#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class WhiteCells
{ 
public: 
  int countOccupied(vector <string> board) { 
    int res = 0;
	int i, j;
	for(i = 0; i < board.size(); ++i)
	for(j = 0; j < board[0].size(); ++j)
	{
		if((i + j) % 2 == 0 && board[i][j] == 'F')
		{
			res++;
		}
	}
    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arr0[] = {"........",
 "........",
 "........",
 "........",
 "........",
 "........",
 "........",
 "........"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 0; verify_case(0, Arg1, countOccupied(Arg0)); }
	void test_case_1() { string Arr0[] = {"FFFFFFFF",
 "FFFFFFFF",
 "FFFFFFFF",
 "FFFFFFFF",
 "FFFFFFFF",
 "FFFFFFFF",
 "FFFFFFFF",
 "FFFFFFFF"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 32; verify_case(1, Arg1, countOccupied(Arg0)); }
	void test_case_2() { string Arr0[] = {".F.F...F",
 "F...F.F.",
 "...F.F.F",
 "F.F...F.",
 ".F...F..",
 "F...F.F.",
 ".F.F.F.F",
 "..FF..F."}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 1; verify_case(2, Arg1, countOccupied(Arg0)); }
	void test_case_3() { string Arr0[] = {"........",
 "..F.....",
 ".....F..",
 ".....F..",
 "........",
 "........",
 ".......F",
 ".F......"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(3, Arg1, countOccupied(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  WhiteCells ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
