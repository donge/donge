#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;
int a[50];
class CondorcetVoting
{ 
public: 
  int winner(vector <string> votes) { 
int i=0,j=0,k=0,count1=0,count=0,count2=0,ans=0,win=0;
int peo = votes.size();
int siz = votes[0].length();
int counter = 0;
for(k=0;k<siz;k++){
counter = 0;
for( j=0;j<siz;j++){
if(k!=j){
for(i=0;i<peo;i++){
if(votes[i][k] < votes[i][j]){
count1++;
}
if(votes[i][k] > votes[i][j]){
count2++;
}
}
cout<<"count1 = "<<count1<<"\n";
cout<<"count2 = "<<count2<<"\n";
if(count1>count2){
counter++;
}
count1=0;
count2=0;
}
}
if(counter==siz-1){      // if it is equal
ans = k;
count = 1;
break;
}
}
if(count!=1){
ans = -1;
}
return ans;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); if ((Case == -1) || (Case == 5)) test_case_5(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const int &Expected, const int &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arr0[] = {"acbd",
 "bacd",
 "bdca"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 0; verify_case(0, Arg1, winner(Arg0)); }
	void test_case_1() { string Arr0[] = {"abc", 
 "bca", 
 "cab"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = -1; verify_case(1, Arg1, winner(Arg0)); }
	void test_case_2() { string Arr0[] = {"cezdqcw"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = -1; verify_case(2, Arg1, winner(Arg0)); }
	void test_case_3() { string Arr0[] = {"abcd", "abcd", "abcd", "abcd", "abcd", "abcd",
 "cbad", "cbad", "cbad", "cbad", "cbad",
 "dbca", "cbda", "cbda"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 1; verify_case(3, Arg1, winner(Arg0)); }
	void test_case_4() { string Arr0[] = {"abbcbbbaaccaaccbbacbbbaacbccbccacaaacaacaaacbccaac",
 "accbabcaacacbcccbbccbbcaccccccbbcbbcbaccbcbcacbcbc",
 "acacaaabccaaaccabbaaaacabaaabacacbaacbcccbccbcbacb",
 "acbcbabaabbcaababaacbabcacbaccabbaaacccbcabbbcacba",
 "cbbbacbbacccbbabbbcbaabaaaacaacbcbccbaaccbcaaccbcb",
 "cbacbbcbbcbcaaabccabcabbcbacaaabccabbcbacbbacbbaca",
 "cacaabccbbbaaacccacbbcacababbcaaabccbbacbbbccacbaa",
 "bccbbabaaaababcbabbbbcbcacbcbcbacccacacacacacacaab",
 "bccabcaabcabbccaaccbcabaaabbbcaabaaabbbbabbbaabaac",
 "accccbabaaaabcbacabbcbbacaacaaaacccbbbcacaccccaaac",
 "cccbcaababbaacaaabbbaabbccccacaacbacaacbbbaacccbbb",
 "bccccaccbcbbaaaaaaaaccbababcabaaccacbbabbbcabbaaca",
 "cbacacaabbccacaabbbbbbccabcbbaccacbcacacacbccbcbcc",
 "baabcabccaaaaccbaacaaccacccbcbbaaacacaccbcaacbbbba",
 "bccaaaabcbbcbbbbbcaabaacccbccbbcbabacaaccbccaababb",
 "cacbbbbcabbcbaabbccbaccbaacbbcbbbbcabababccabbbcab",
 "bccbcacbccaacacccccaacabacbacbbbcaabacacccbbbccaac",
 "aaaccbbbacacbaaaacacaabbaacccbcccbcabbccbcacabbacb",
 "bcabcbbacbacacbbaaccabcabcbbaabacacccbbbcabbbcaacb",
 "bacbbbbaccbaabbbbbcaccbbcbcabbbccbcacccbabbbcaaacc",
 "bababcacbacacacccccbbcacccbbcbccaccaacbbcacabcabba",
 "aaabaccbbcacaacbabccccabbbcbcccccccbaacbccbaacbbbc",
 "abacbaaaaaccacbbbaccbbbabaacbcbccacccabaaaacbaabbb",
 "cbbcacbaccabbbcaacbcbabbcabcbaccabcbbbcabcbcbaacca",
 "babbacaaacbbcbbbabbaabcbabcbbaacaacbbbaaaabbcabcca",
 "cbabaacabcccaabbbacccaccbacabbaacaaabcbcccbcbcccaa",
 "aabbbcbacabbcabcbcccbccaccbcacbaacabbbccaabaabcbba",
 "caccabcccabbaacbabbaaaccccccccaaccbcaccacaabacccba",
 "bbbcabcababaabacaccacabcbccacccbbbbcbbbaccabcabaab",
 "bbbcaababbbbababababcbbbbaaabbacaabcacbbccbcaaaaaa",
 "bcbacccaaaabbcbcabbbcababbcacaabbbbcbbacbaabcbaccb",
 "bbcaccaaccacbbaaccaaaabccbbacbcbacaacbacbccaaccbba",
 "abaaacbccbbabbcaccbaccccbaaacaccccababcbccccbabcca",
 "acccaccababababacbbaccbcabcaccbabaabacbaacaaacabca",
 "aaabababccabccbcbabcabcacbbcacbcbbbabcabacbcaacacb",
 "ccacbaabbcbaccaccbbabbabbabaacccabcaaccacacccbbcab",
 "bbaabcbabbbaacacabaabcbaaabacbccccaccaaaacbacabbbc",
 "abaaaccaacbbcacacbcbccbaaacbbcbacabbbccabbbccaaaac",
 "bbacbabbcacbbacccaccbcbcabbcbaacabbbbabbaaabaacacb",
 "cacbacbccbcbabacccacabcacacabbcabbccaacacbaaacaacb",
 "bacbbacbccccabcbabcbbcbacacaaabcbaccccaabaabbacbcb",
 "abcaaccccabccaaaaccbabccacbcaaaacaccaccccccaaaabaa",
 "bacabcbccbacccbaaaabcbbaabbabaabcabacccbcabacccbcc",
 "babaccbbcbcbacccabccbcccbaaaaacccabcbccbbbbcbabcbc",
 "cccbbaccbabbbbcbcbcbaaacbbcacbcaacacacccbcabccbcaa",
 "caacbcacbccaaaaacaaababbcccacbabaaabcaacaaababacba",
 "cccccaccabcaacababbacbcbabbcaacbacbabbbccbabcbabbb",
 "ccbcababcabcbcccaccccacabcbaaacaabccbbaabaccbaccab",
 "abbbcacaccabcbccbacabbbccaccaaaacccabbcbacbbccabcb",
 "bacabccabcbbcaacbcacabcbccacbcccbcbcaaaabbaabccabb"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 12; verify_case(4, Arg1, winner(Arg0)); }
	void test_case_5() { string Arr0[] = {"h", "e", "l", "l", "o"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); int Arg1 = 0; verify_case(5, Arg1, winner(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  CondorcetVoting ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
