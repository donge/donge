#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class PlayerExtraction
{ 
public: 
  vector <string> extractPlayers(vector <string> photo, int k, int threshold) { 
    vector <string> res;

    // My Solution

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const vector <string> &Expected, const vector <string> &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: " << print_array(Expected) << endl; cerr << "\tReceived: " << print_array(Received) << endl; } }
	void test_case_0() { string Arr0[] = {"33JUBU33",
 "3U3O4433",
 "O33P44NB",
 "PO3NSDP3",
 "VNDSD333",
 "OIVNFD33"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 3; int Arg2 = 16; string Arr3[] = {"4 5", "13 9", "14 2" }; vector <string> Arg3(Arr3, Arr3 + (sizeof(Arr3) / sizeof(Arr3[0]))); verify_case(0, Arg3, extractPlayers(Arg0, Arg1, Arg2)); }
	void test_case_1() { string Arr0[] = {"6VS",
 "D66"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 6; int Arg2 = 1; string Arr3[] = {"1 1", "4 3" }; vector <string> Arg3(Arr3, Arr3 + (sizeof(Arr3) / sizeof(Arr3[0]))); verify_case(1, Arg3, extractPlayers(Arg0, Arg1, Arg2)); }
	void test_case_2() { string Arr0[] = {"44444H44S4",
 "K444K4L444",
 "4LJ44T44XH",
 "444O4VIF44",
 "44C4D4U444",
 "4V4Y4KB4M4",
 "G4W4HP4O4W",
 "4444ZDQ4S4",
 "4BR4Y4A444",
 "4G4V4T4444"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 4; int Arg2 = 16; string Arr3[] = {"3 8", "4 16", "5 4", "16 3", "16 17", "17 9" }; vector <string> Arg3(Arr3, Arr3 + (sizeof(Arr3) / sizeof(Arr3[0]))); verify_case(2, Arg3, extractPlayers(Arg0, Arg1, Arg2)); }
	void test_case_3() { string Arr0[] = {"8D88888J8L8E888",
 "88NKMG8N8E8JI88",
 "888NS8EU88HN8EO",
 "LUQ888A8TH8OIH8",
 "888QJ88R8SG88TY",
 "88ZQV88B88OUZ8O",
 "FQ88WF8Q8GG88B8",
 "8S888HGSB8FT8S8",
 "8MX88D88888T8K8",
 "8S8A88MGVDG8XK8",
 "M88S8B8I8M88J8N",
 "8W88X88ZT8KA8I8",
 "88SQGB8I8J88W88",
 "U88H8NI8CZB88B8",
 "8PK8H8T8888TQR8"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 8; int Arg2 = 9; string Arr3[] = {"1 17", "3 3", "3 10", "3 25", "5 21", "8 17", "9 2", "10 9", "12 23", "17 16", "18 3", "18 11", "18 28", "22 20", "23 26", "24 15", "27 2", "28 26", "29 16" }; vector <string> Arg3(Arr3, Arr3 + (sizeof(Arr3) / sizeof(Arr3[0]))); verify_case(3, Arg3, extractPlayers(Arg0, Arg1, Arg2)); }
	void test_case_4() { string Arr0[] = {"11111",
 "1AAA1",
 "1A1A1",
 "1AAA1",
 "11111"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 1; int Arg2 = 3; string Arr3[] = {"5 5", "5 5" }; vector <string> Arg3(Arr3, Arr3 + (sizeof(Arr3) / sizeof(Arr3[0]))); verify_case(4, Arg3, extractPlayers(Arg0, Arg1, Arg2)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  PlayerExtraction ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
