#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

struct t {
	string n;
	double w;
	double l;
	double k;
};

int mw = 0, mt = 0;

double calc(struct t &m1)
{
	double ss = m1.l + m1.w;
	if(ss >= mt)
	{
		return (mw + (ss - mt) / 2.0) - m1.w;
	}
	else
		return mw - (m1.w + (mt - ss) / 2.0);
}

bool com(struct t &m1,struct t &m2) {

	m1.k = calc(m1);
	m2.k = calc(m2);
	if(m1.k < m2.k)		
		return 1;
	else if (m1.k > m2.k)	
		return 0;
	else if(m1.n < m2.n)
		return 1;
	else
		return 0;
}

class BasketballStandings
{ 
public: 
  vector <string> constructTable(vector <string> teams) { 
    vector <string> res;
	vector <struct t> tm(teams.size());
	int i;
	double max = -1;
	for(i = 0; i < teams.size(); ++i)
	{
		stringstream ss(teams[i]);
		ss >> tm[i].n >> tm[i].w >> tm[i].l;
		
		double w = tm[i].w;
		double t = tm[i].w + tm[i].l;
		if(i == 0) { mw = w; mt = t; }
		if( calc(tm[i]) < 0)
		{
			mw = w;
			mt = t;
		}
	}
	sort(tm.begin(), tm.end(), com);
	
	for(i = 0; i < teams.size(); ++i)
	{
		char s[100];
		sprintf(s, "%s %.1f", tm[i].n.c_str(), tm[i].k);
		res.push_back(s);
	}
    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const vector <string> &Expected, const vector <string> &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: " << print_array(Expected) << endl; cerr << "\tReceived: " << print_array(Received) << endl; } }
	void test_case_0() { string Arr0[] = {"A 1 1", "A 8 8","D 0 0", "B 7 7", "C 99 99", "BAA 13 13"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"A 0.0", "A 0.0", "B 0.0", "BAA 0.0", "C 0.0", "D 0.0" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(0, Arg1, constructTable(Arg0)); }
	void test_case_1() { string Arr0[] = {"B 11 10", "A 10 10", "C 10 11", "D 20 5"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"D 0.0", "B 7.0", "A 7.5", "C 8.0" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(1, Arg1, constructTable(Arg0)); }
	void test_case_2() { string Arr0[] = {"MAVS 54 11", "SUNS 50 16", "SPURS 46 20", "JAZZ 43 23"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"MAVS 0.0", "SUNS 4.5", "SPURS 8.5", "JAZZ 11.5" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(2, Arg1, constructTable(Arg0)); }
	void test_case_3() { string Arr0[] = {"TEAMA 17 15", "TEAMB 14 11", "TEAMC 3 0",
 "TEAMD 99 94", "LOSER 10 85", "WINNER 76 34"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"WINNER 0.0", "TEAMD 18.5", "TEAMB 19.5", "TEAMC 19.5", "TEAMA 20.0", "LOSER 58.5" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(3, Arg1, constructTable(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  BasketballStandings ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
