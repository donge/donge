#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class DocumentSearch
{ 
public: 
  int nonIntersecting(vector <string> doc, string search) { 
	  int res = 0;
	  string all;
	  int i, j = 0, k = 0;
	  for(i = 0; i < doc.size(); ++i)
	  {
		  all += doc[i];
	  }
	while (1)
	{
	  if(all[j] == search[k])
	  {
		  k++;
		  j++;
		  if(k == search.size())
		  {
			  k = 0;
			  res++;
		  }
	  }
	  else
	  {
		 j = j - k + 1;
	  }

	  if(j == all.size()) break;
	} 
	  return res;
  } 
  
  // BEGIN CUT HERE
public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arr0[] = {"ababababa"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "ababa"; int Arg2 = 1; verify_case(0, Arg2, nonIntersecting(Arg0, Arg1)); }
	void test_case_1() { string Arr0[] = {"ababababa"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "aba"; int Arg2 = 2; verify_case(1, Arg2, nonIntersecting(Arg0, Arg1)); }
	void test_case_2() { string Arr0[] = {"abcdefghijklmnop",
		"qrstuvwxyz"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "pqrs"; int Arg2 = 1; verify_case(2, Arg2, nonIntersecting(Arg0, Arg1)); }
	void test_case_3() { string Arr0[] = {"aaa", "aa", "a", "a"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "aa"; int Arg2 = 3; verify_case(3, Arg2, nonIntersecting(Arg0, Arg1)); }
	
	// END CUT HERE
	
}; 

// BEGIN CUT HERE 
int main()
{
	DocumentSearch ___test; 
	___test.run_test(-1); 
	return 0;
} 
// END CUT HERE 
