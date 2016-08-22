#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;
int map[8][8];
int t = 0;
class DukeOnChessBoard
{ 
public: 
	string dukePath(int n, string initPosition)
	{
		string ret = aaa(n, initPosition);
		int k = ret.size()-1;
		if(k <= 40) return ret.substr(0, k);
		else
			return ret.substr(0, 20) + "..." + ret.substr(k - 20, 20);

	}

  string aaa(int n, string initPosition) { 

	string res;

	int i = initPosition[0] - 'a';
	int j = initPosition[1] - '1';
	map[i][j] = 1;
	res += initPosition;
	res += '-';
	t ++;
	//while(t != n * n)
	{
		if(i + 1 < n && map[i+1][j] == 0)
		{
			initPosition[0] = initPosition[0] + 1;
			//map[i+1][j] = 1;
			res += aaa(n, initPosition);
		} 
		else if(j + 1 < n && map[i][j+1] == 0)
		{
			initPosition[1] = initPosition[1] + 1;
			//map[i][j+1] = 1;
			res += aaa(n, initPosition);
		}
		else if (j - 1 >= 0 && map[i][j-1] == 0)
		{
			initPosition[1] = initPosition[1] - 1;
			//map[i][j-1] = 1;
			res += aaa(n, initPosition);		
		}
		else if (i - 1 >= 0 && map[i-1][j] == 0)
		{
			initPosition[0] = initPosition[0] - 1;
			//map[i-1][j] = 1;
			res += aaa(n, initPosition);		
		}
	}
return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const string &Expected, const string &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { int Arg0 = 3; string Arg1 = "b2"; string Arg2 = "b2-c2-c3-b3-a3-a2-a1-b1-c1"; verify_case(0, Arg2, dukePath(Arg0, Arg1)); }
	void test_case_1() { int Arg0 = 4; string Arg1 = "d4"; string Arg2 = "d4-d3-d2-d1-c1-c2-c3...b3-b2-b1-a1-a2-a3-a4"; verify_case(1, Arg2, dukePath(Arg0, Arg1)); }
	void test_case_2() { int Arg0 = 3; string Arg1 = "a2"; string Arg2 = "a2-b2-c2-c3-b3-a3"; verify_case(2, Arg2, dukePath(Arg0, Arg1)); }
	void test_case_3() { int Arg0 = 4; string Arg1 = "d3"; string Arg2 = "d3-d4-c4-c3-c2-d2-d1...b2-b3-b4-a4-a3-a2-a1"; verify_case(3, Arg2, dukePath(Arg0, Arg1)); }
	void test_case_4() { int Arg0 = 8; string Arg1 = "a8"; string Arg2 = "a8-b8-c8-d8-e8-f8-g8...a1-a2-a3-a4-a5-a6-a7"; verify_case(4, Arg2, dukePath(Arg0, Arg1)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  DukeOnChessBoard ___test; 
  ___test.run_test(1); 
  return 0;
} 
// END CUT HERE 
