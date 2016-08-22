#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class ConstructionFromMatches
{ 
public: 
  int minimumCost(vector <int> cost, vector <int> top, vector <int> bottom) { 
    int res = 0;
	vector<int> a(12,0);
	int l = top.size();
	int i=0, j;
	for(i = 0; i < top.size(); ++i)
	{
		int c = top[i] / 4;
		int d = top[i] % 4;
		a[c-1] += (4-d);
		a[c] += d;
	}
	for(i = 0; i < bottom.size(); ++i)
	{
		int c = bottom[i] / 4;
		int d = bottom[i] % 4;
		a[c-1] += (4-d);
		a[c] += d;
	}

	for(i = l; i>0; )
	{
		for(j = cost.size()-1; j>=0; j--)
		{
			while(a[j]>0)
			{
				a[j]--;
				i--;
				if(i == 0)
				break;
			}
			if(i == 0)
				break;
		}
	}

	int total = 0;
	for(i = 0; i < 12;++ i)
	{
		total += a[i];
	}
	if(total != 5 * l + 2) return -1;

    // My Solution
	for(i = 0; i < 12;++ i)
	{
res += a[i]*cost[i];
		cout << a[i] <<":";
	}

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { int Arr0[] = {1, 2}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arr1[] = {7}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); int Arr2[] = {5}; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); int Arg3 = 10; verify_case(0, Arg3, minimumCost(Arg0, Arg1, Arg2)); }
	void test_case_1() { int Arr0[] = {1}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arr1[] = {5}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); int Arr2[] = {5}; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); int Arg3 = -1; verify_case(1, Arg3, minimumCost(Arg0, Arg1, Arg2)); }
	void test_case_2() { int Arr0[] = {1, 5, 9}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arr1[] = {7, 10}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); int Arr2[] = {8, 9}; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); int Arg3 = 56; verify_case(2, Arg3, minimumCost(Arg0, Arg1, Arg2)); }
	void test_case_3() { int Arr0[] = {1, 3, 4, 7, 9}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arr1[] = {13, 14, 13, 11, 9, 7, 11, 8, 8, 10}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); int Arr2[] = {18, 14, 17, 10, 8, 4, 8, 13, 14, 13}; vector <int> Arg2(Arr2, Arr2 + (sizeof(Arr2) / sizeof(Arr2[0]))); int Arg3 = 194; verify_case(3, Arg3, minimumCost(Arg0, Arg1, Arg2)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  ConstructionFromMatches ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
