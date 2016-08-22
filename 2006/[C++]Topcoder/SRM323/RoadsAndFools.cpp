#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class RoadsAndFools
{ 
public: 
  string determineOrientation(int length, vector <int> frontSides) { 
    string res;
	int i;
	int de = true;
	int cr = true;
	for(i = 1; i < frontSides.size(); ++i) 
	{
		if(frontSides[i -1] > frontSides[i]) de = false; 
	}

	for(i = 1; i < frontSides.size(); ++i) 
	{
		if(frontSides[i -1] < frontSides[i]) cr = false; 
	}
	
	if(de && cr)
	{
		if(frontSides.size() >2 ) return "NO SOLUTION";
		else if(frontSides.size() == 2)
			frontSides[0] = length - frontSides[0];	
	}

	int ok = de || cr;
	if(!ok) return "NO SOLUTION";

	sort(frontSides.begin(), frontSides.end());

	if(frontSides.size()==1 && length-frontSides[0]!=frontSides[0])return "MULTIPLE SOLUTIONS";

	for(i = 1; i < frontSides.size()-1; ++i)
	{
		if( frontSides[i-1] <length-frontSides[i] && length-frontSides[i] < frontSides[i+1])
			return "MULTIPLE SOLUTIONS";
	}
	
	for(i = 0; i < frontSides.size(); ++i)
			res = res + (char)('0'+frontSides[i]) + " ";

    return res.substr(0,res.size()-1);
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); if ((Case == -1) || (Case == 5)) test_case_5(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const string &Expected, const string &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { int Arg0 = 5; int Arr1[] = {1, 2, 3}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); string Arg2 = "1 2 3"; verify_case(0, Arg2, determineOrientation(Arg0, Arg1)); }
	void test_case_1() { int Arg0 = 5; int Arr1[] = {5, 2, 0}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); string Arg2 = "MULTIPLE SOLUTIONS"; verify_case(1, Arg2, determineOrientation(Arg0, Arg1)); }
	void test_case_2() { int Arg0 = 5; int Arr1[] = {4, 4}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); string Arg2 = "1 4"; verify_case(2, Arg2, determineOrientation(Arg0, Arg1)); }
	void test_case_3() { int Arg0 = 5; int Arr1[] = {4, 4, 4}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); string Arg2 = "NO SOLUTION"; verify_case(3, Arg2, determineOrientation(Arg0, Arg1)); }
	void test_case_4() { int Arg0 = 5; int Arr1[] = {3}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); string Arg2 = "MULTIPLE SOLUTIONS"; verify_case(4, Arg2, determineOrientation(Arg0, Arg1)); }
	void test_case_5() { int Arg0 = 10; int Arr1[] = {5}; vector <int> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); string Arg2 = "5"; verify_case(5, Arg2, determineOrientation(Arg0, Arg1)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  RoadsAndFools ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
