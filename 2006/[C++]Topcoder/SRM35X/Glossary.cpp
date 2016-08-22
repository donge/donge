#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;
class RuntimeStringCmp { 
public: 
//constants for the comparison criterion 
enum cmp_mode {normal, nocase}; 
private: 
//actual comparison mode 
const cmp_mode mode; 
//auxiliary function to compare case insensitive 
static bool nocase_compare (char c1, char c2) 
{ 
return toupper(c1) < toupper(c2); 
} 
public: 
//constructor: initializes the comparison criterion 
RuntimeStringCmp (cmp_mode m=normal) : mode(m) { 
} 
//the comparison 
bool operator() (const string& s1, const string& s2) const { 
if (mode == normal) { 
return s1<s2; 
} 
else { 
return lexicographical_compare (s1.begin(), s1.end(), 
s2.begin(), s2.end(), 
nocase_compare); 
} 
} 
}; 

class Glossary
{ 
public: 
 string pad(char c)
 {
	string s = "                     ";
	s[0] = c;
	return s;
 }
 string padd(string s)
 {
	string ss;
	ss = "  "+s;
	while(ss.size() < 21)
	{
		ss += " ";
	}
	return ss;
 }

  string pad1(char c)
 {
	string s = "                   ";
	s[0] = c;
	return s;
 }
 string padd1(string s)
 {
	string ss;
	ss = "  "+s;
	while(ss.size() < 19)
	{
		ss += " ";
	}
	return ss;
 }

  vector <string> buildGlossary(vector <string> items) { 
    vector <string> res;
    vector <string> l;
	vector <string> r;
	int i, j;
	RuntimeStringCmp ignorecase (RuntimeStringCmp::nocase); 

	sort(items.begin(), items.end(), ignorecase);

	for(j = 'A'; j <= 'M'; ++j)
	{
		int have = 0;
		for(i = 0; i < items.size(); ++i)
		{
			char c = toupper(items[i][0]);
			if(c == j)
			{
				if(have == 0)
				{
					l.push_back(pad(c));
					l.push_back("-------------------  ");
					have = 1;
				}
				l.push_back(padd(items[i]));
			}

		}
	}
	for(j = 'N'; j <= 'Z'; ++j)
	{
		int have = 0;
		for(i = 0; i < items.size(); ++i)
		{
			char c = toupper(items[i][0]);
			if(c == j)
			{
				if(have == 0)
				{
					r.push_back(pad1(c));
					r.push_back("-------------------");
					have = 1;
				}
				r.push_back(padd1(items[i]));
			}

		}
	}

	int size = l.size() > r.size() ? l.size() : r.size();
	for(i = 0; i < size; ++i)
	{
		string c;
		if(i < l.size() && i < r.size())
		{
			c = l[i] + r[i];
			//cout << l[i] << endl << r[i] << endl;
		}
		else if(i >= l.size() && i < r.size())
		{
			c = "                     " + r[i];
		}
		else if(i < l.size() && i >= r.size())
		{
			c = l[i] + "                   ";
		}
		res.push_back(c);
	}

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const vector <string> &Expected, const vector <string> &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: " << print_array(Expected) << endl; cerr << "\tReceived: " << print_array(Received) << endl; } }
	void test_case_0() { string Arr0[] = {"Canada", "France", "Germany", "Italy", "Japan", "Russia", 
 "United Kingdom", "United States"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"C                    R                  ", "-------------------  -------------------", "  Canada               Russia           ", "F                    U                  ", "-------------------  -------------------", "  France               United Kingdom   ", "G                      United States    ", "-------------------                     ", "  Germany                               ", "I                                       ", "-------------------                     ", "  Italy                                 ", "J                                       ", "-------------------                     ", "  Japan                                 " }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(0, Arg1, buildGlossary(Arg0)); }
	void test_case_1() { string Arr0[] = {"alpha", "beta", "gamma", "delta", "omega"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"A                    O                  ", "-------------------  -------------------", "  alpha                omega            ", "B                                       ", "-------------------                     ", "  beta                                  ", "D                                       ", "-------------------                     ", "  delta                                 ", "G                                       ", "-------------------                     ", "  gamma                                 " }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(1, Arg1, buildGlossary(Arg0)); }
	void test_case_2() { string Arr0[] = {"AVL tree", "backtracking", "array", "balanced tree", "binary search"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"A                                       ", "-------------------                     ", "  array                                 ", "  AVL tree                              ", "B                                       ", "-------------------                     ", "  backtracking                          ", "  balanced tree                         ", "  binary search                         " }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(2, Arg1, buildGlossary(Arg0)); }
	void test_case_3() { string Arr0[] = {"XXXXXXXXXXXXXXXXX", 
 "YYYYYYYYYYYYYYYYY",
 "ZZZZZZZZZZZZZZZZZ"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"                     X                  ", "                     -------------------", "                       XXXXXXXXXXXXXXXXX", "                     Y                  ", "                     -------------------", "                       YYYYYYYYYYYYYYYYY", "                     Z                  ", "                     -------------------", "                       ZZZZZZZZZZZZZZZZZ" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(3, Arg1, buildGlossary(Arg0)); }
	void test_case_4() { string Arr0[] = {"Asteria", "Astraeus", "Atlas", "Clymene", "Coeus", "Crius", 
 "Cronus", "Dione", "Epimetheus", "Helios", "Hyperion", "Iapetus", 
 "Leto", "Mnemosyne", "Oceanus", "Ophion", "Phoebe", "Prometheus", 
 "Rhea", "Tethys", "Theia", "Themis"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"A                    O                  ", "-------------------  -------------------", "  Asteria              Oceanus          ", "  Astraeus             Ophion           ", "  Atlas              P                  ", "C                    -------------------", "-------------------    Phoebe           ", "  Clymene              Prometheus       ", "  Coeus              R                  ", "  Crius              -------------------", "  Cronus               Rhea             ", "D                    T                  ", "-------------------  -------------------", "  Dione                Tethys           ", "E                      Theia            ", "-------------------    Themis           ", "  Epimetheus                            ", "H                                       ", "-------------------                     ", "  Helios                                ", "  Hyperion                              ", "I                                       ", "-------------------                     ", "  Iapetus                               ", "L                                       ", "-------------------                     ", "  Leto                                  ", "M                                       ", "-------------------                     ", "  Mnemosyne                             " }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(4, Arg1, buildGlossary(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  Glossary ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
