#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class PoolFiller
{ 
public: 
	vector <string> l;
	int get(int x, int y, int d)
	{
		int i, j;
		int max = 0;
		if(d == 1) for(i = 0; i < x; ++i) 
		{
			if(l[i][y]- l[x][y] > max) max = l[i][y]- l[x][y];
		} 
		else if(d == 2) for(i = x; i < l.size(); ++i) 
		{
			if(l[i][y]- l[x][y] > max) max = l[i][y]- l[x][y];
		} 
		else if(d == 3) for(i = 0; i < y; ++i) 
		{
			if(l[x][i]- l[x][y] > max)  max =  l[x][i]- l[x][y];
		} 
		else if(d == 4) for(i = y; i < l[0].size(); ++i) 
		{
			if(l[x][i]- l[x][y] > max)  max =  l[x][i]- l[x][y];
		} 
		return max;
	}
  int getCapacity(vector <string> layout) { 
    int res = 0;
	int i,j;
	l = layout;
	for(i = 0; i < layout.size(); ++i)
	{
		for(j = 0; j < layout[0].size(); ++j)
		{
			int a = get(i,j,1) < get(i,j,2) ? get(i,j,1) : get(i,j,2);
			int b = get(i,j,3) < get(i,j,4) ? get(i,j,3) : get(i,j,4);
			res += a < b ? a: b;
		}
	}

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arr0[] = {
"16661",
"61116",
"16661"
}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 15; verify_case(0, Arg1, getCapacity(Arg0)); }
	void test_case_1() { string Arr0[] = {
"999999",
"955119",
"955119",
"999999"
}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 48; verify_case(1, Arg1, getCapacity(Arg0)); }
	void test_case_2() { string Arr0[] = {
"111111111",
"115111611",
"131516161",
"115111611",
"111111111"
}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 7; verify_case(2, Arg1, getCapacity(Arg0)); }
	void test_case_3() { string Arr0[] = {
"1111111111111",
"1555555555551",
"1511111111151",
"1511199911151",
"1511192911151",
"1511199911151",
"1511111111151",
"1555555555551",
"1111111111111"
}

; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 151; verify_case(3, Arg1, getCapacity(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  PoolFiller ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
