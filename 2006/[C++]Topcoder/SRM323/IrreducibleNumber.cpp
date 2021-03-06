#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class IrreducibleNumber
{ 
public: 
  int getIrreducible(vector <int> A) {
	  int i;
	  for(i = A.size(); i < 3; ++i)
	  {
		  A.push_back(0);
	  }
	
	  A.push_back(A[0]+A[1]);
	  A.push_back(A[0]+A[2]);
	  A.push_back(A[1]+A[2]);
	  A.push_back(A[0]+A[1]+A[2]);
	  sort(A.begin(), A.end());
		i = 1;
	  while(A.end() != find(A.begin(),A.end(),i)) ++i;

    // My Solution

    return i;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { int Arr0[] = {1,1}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 3; verify_case(0, Arg1, getIrreducible(Arg0)); }
	void test_case_1() { int Arr0[] = {1,2}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 4; verify_case(1, Arg1, getIrreducible(Arg0)); }
	void test_case_2() { int Arr0[] = {1,3}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(2, Arg1, getIrreducible(Arg0)); }
	void test_case_3() { int Arr0[] = {4, 1, 3}; vector <int> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(3, Arg1, getIrreducible(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  IrreducibleNumber ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
