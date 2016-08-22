#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;
int map[5000][5000];
class SpiralRoute
{
public: 
  vector <int> thronePosition(int width, int length) { 
    vector <int> res(2);
	int walk[4][2] = {{0, 1} , {-1, 0}, { 0, -1}, {1 , 0}};
	int i = length-1;
	int j = 0;
	int oldi = 0;
	int oldj = 0;
	int k;
	map[i][j] = 1;

	while(1)
	{
		int good = 1;
		for(k = 0; k < 4; ++k)
		{
			while(1)
			{
				if((i + walk[k][0] == length || i + walk[k][0] < 0) || 
                   (j + walk[k][1] == width || j + walk[k][1] < 0) ||
                    map[i + walk[k][0]][j + walk[k][1]] == 1
                     )
				   break;
				else
				{
					i = i + walk[k][0];
					j = j + walk[k][1];
					map[i][j] = 1;
					good = 0;
				}
			}
		}

		if(good) 
		{
			res[0] = length-1-j;
			res[1] = i;
			return res;
		}
	}
    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const vector <int> &Expected, const vector <int> &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: " << print_array(Expected) << endl; cerr << "\tReceived: " << print_array(Received) << endl; } }
	void test_case_0() { int Arg0 = 6; int Arg1 = 4; int Arr2[] = {1, 2 }; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); verify_case(0, Arg2, thronePosition(Arg0, Arg1)); }
	void test_case_1() { int Arg0 = 6; int Arg1 = 5; int Arr2[] = {3, 2 }; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); verify_case(1, Arg2, thronePosition(Arg0, Arg1)); }
	void test_case_2() { int Arg0 = 1; int Arg1 = 11; int Arr2[] = {0, 10 }; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); verify_case(2, Arg2, thronePosition(Arg0, Arg1)); }
	void test_case_3() { int Arg0 = 12; int Arg1 = 50; int Arr2[] = {5, 6 }; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); verify_case(3, Arg2, thronePosition(Arg0, Arg1)); }
	void test_case_4() { int Arg0 = 5000; int Arg1 = 5000; int Arr2[] = {2499, 2500 }; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); verify_case(4, Arg2, thronePosition(Arg0, Arg1)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  SpiralRoute ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
