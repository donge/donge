#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;
int d[26];
class DietPlan
{ 
public: 
  string chooseDinner(string diet, string breakfast, string lunch) { 
    string res;
	int i;

	for(i = 0; i < diet.size(); ++i)
	{
		d[diet[i]-'A']++;
	}

	for(i = 0; i < breakfast.size(); ++i)
	{
		if(d[breakfast[i]-'A'] > 0)
		{
			d[breakfast[i]-'A']--;
		}
		else
		{
			return "CHEATER";
		}
	}
	for(i = 0; i < lunch.size(); ++i)
	{
		if(d[lunch[i]-'A'] > 0)
		{
			d[lunch[i]-'A']--;
		}
		else
			return "CHEATER";
	}

	for(i = 0; i < 26; ++i)
	{
		if(d[i]>0)
			res += ('A'+i);
	}

    

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const string &Expected, const string &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arg0 = "ABCD"; string Arg1 = "AB"; string Arg2 = "C"; string Arg3 = "D"; verify_case(0, Arg3, chooseDinner(Arg0, Arg1, Arg2)); }
	void test_case_1() { string Arg0 = "ABEDCS"; string Arg1 = ""; string Arg2 = ""; string Arg3 = "ABCDES"; verify_case(1, Arg3, chooseDinner(Arg0, Arg1, Arg2)); }
	void test_case_2() { string Arg0 = "EDSMB"; string Arg1 = "MSD"; string Arg2 = "A"; string Arg3 = "CHEATER"; verify_case(2, Arg3, chooseDinner(Arg0, Arg1, Arg2)); }
	void test_case_3() { string Arg0 = ""; string Arg1 = ""; string Arg2 = ""; string Arg3 = ""; verify_case(3, Arg3, chooseDinner(Arg0, Arg1, Arg2)); }
	void test_case_4() { string Arg0 = "IWANTSODER"; string Arg1 = "SOW"; string Arg2 = "RAT"; string Arg3 = "DEIN"; verify_case(4, Arg3, chooseDinner(Arg0, Arg1, Arg2)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  DietPlan ___test; 
  ___test.run_test(0); 
  return 0;
} 
// END CUT HERE 
