#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;
int n, m;
bool ch[51][51];
vector<string> d;
void dfs(int x, int y, char last) {
if (!(0<=x&&x<n && 0<=y&&y<m)) return;
if (ch[x][y] || d[x][y] < last) return;
ch[x][y] = 1;
dfs(x-1,y,d[x][y]);
dfs(x+1,y,d[x][y]);
dfs(x,y-1,d[x][y]);
dfs(x,y+1,d[x][y]);
}

class FloodRelief
{ 
public: 
  int minimumPumps(vector <string> input) { 


int i, j, k, x, y;
d = input; n = d.size(); m = d[0].size();
for (k = 0;; k++) {
x = -1;
for (i = 0; i < n; i++) {
for (j = 0; j < m; j++) {
if (ch[i][j]) continue;
if (x == -1) {
x = i; y = j;
}
else if (d[x][y] > d[i][j]) {
x = i; y = j;
}
}
}
if (x == -1) break;
dfs(x,y,d[x][y]);
}
return k;

  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arr0[] = {"ccccc",
 "cbbbc",
 "cbabc",
 "cbbbc",
 "ccccc"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 1; verify_case(0, Arg1, minimumPumps(Arg0)); }
	void test_case_1() { string Arr0[] = {"cbabcbabc",
 "cbabcbabc",
 "cbabcbabc",
 "cbabcbabc"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(1, Arg1, minimumPumps(Arg0)); }
	void test_case_2() { string Arr0[] = {"ccccccccccc",
 "caaaaaaaaac",
 "caaaaaaaaac",
 "caazpppzaac",
 "caapdddpaac",
 "caapdddpaac",
 "caapdddpaac",
 "caazpppzaac",
 "caaaaaaaaac",
 "caaaaaaaaac",
 "ccccccccccc"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(2, Arg1, minimumPumps(Arg0)); }
	void test_case_3() { string Arr0[] = {"ab",
 "ba"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 2; verify_case(3, Arg1, minimumPumps(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  FloodRelief ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
