#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class OptimalGroupMovement
{ 
public: 
  int minimumCost(string board) { 
    int i;
	int count = 0;
	int max = 0, maxr = 0;
	for(i = 0; i < board.size();++i)
	{
		if(board[i] == 'X')
		{
			count++;
		}
		else
		{
			if(count > max)
			{
				max = count;
				maxr = i;
			}
			count = 0;
		}
	}
	cout << max << ":" << maxr << endl;
    // My Solution

	int l = 0;
	int cost = 0;
	int sum = 0;
	for(i = (maxr-max) - 1; i >=0; i--)
	{
		if(board[i] == '.')
		{
			sum += (l * l * cost); 
			l = 0;
			cost++;
		}
		else
		{
			l++;
		}
	}
	sum += (l * l * cost); 
	cost = 0;
	l = 0;
	cout << sum;
	for(i = maxr; i <board.size(); i++)
	{
		if(board[i] == '.')
		{
			sum += (l * l * cost); 
			l = 0;
			cost++;
		}
		else
		{
			l++;
		//	cost++;
		}
	}
		sum += (l * l * cost); 

    return sum;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = ".XXX.XXXX."; int Arg1 = 9; verify_case(0, Arg1, minimumCost(Arg0)); }
	void test_case_1() { string Arg0 = "X"; int Arg1 = 0; verify_case(1, Arg1, minimumCost(Arg0)); }
	void test_case_2() { string Arg0 = "XXXXX...X..X.X"; int Arg1 = 14; verify_case(2, Arg1, minimumCost(Arg0)); }
	void test_case_3() { string Arg0 = ".X.X.X..X.X.X.......XX..X.X..X"; int Arg1 = 70; verify_case(3, Arg1, minimumCost(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  OptimalGroupMovement ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
