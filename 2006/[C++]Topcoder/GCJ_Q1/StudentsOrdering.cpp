#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class StudentsOrdering
{ 

public: 
  string findOrder(vector <string> students) { 
	vector< pair<int, string> > boy, girl;
	int i = 0;
	int size = students.size();
	for(i = 0; i < size; ++i) 
	{
		string name;
		int height;
		string sex;
		stringstream ss(students[i]);

		ss >> name >> height >> sex;

		if(sex == "boy") boy.push_back(make_pair(height, name));
		else girl.push_back(make_pair(height, name));
	}
	/////
	sort(boy.begin(), boy.end());
	sort(girl.begin(), girl.end());

	string t1 = slove(boy, girl);
	string t2 = slove(girl, boy);

	if(t1=="" || t2!="" && t2 < t1) t1 = t2;
	return t1;
  } 

  string slove(vector< pair<int, string> > f, vector< pair<int, string> > l)
  {
	  string res;
	  int i = 0;
	
	  if(f.size() < l.size() || f.size() > l.size() + 1 || f.size() == 0 ) return "";

	  for(i = 0; i < l.size(); ++i)
		{
		if(f[i].first > l[i].first) return "";
		if(i+1 < f.size() && f[i+1].first < l[i].first) return "";
		}
	  if(f.size() > l.size() && l.size() > 0)
		if(f[i].first < l[i-1].first) return "";

	  for(i = 0; i < l.size(); ++i)
	  {
		  res = res + f[i].second +"-"+ l[i].second + "-";
	  }
	if(f.size() > l.size())
			res = res + f[i].second;
		else return res.substr(0, res.size()-1);

	return res;
  }

  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const string &Expected, const string &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: \"" << Expected << '\"' << endl; cerr << "\tReceived: \"" << Received << '\"' << endl; } }
	void test_case_0() { string Arr0[] = {"a 100 boy", "a 100 girl", "bb 200 boy", "cc 200 boy", "dd 200 girl", "aa 200 girl"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "a-a-aa-bb-dd-cc"; verify_case(0, Arg1, findOrder(Arg0)); }
	void test_case_1() { string Arr0[] = {"Alex 180 boy", 
 "Josh 158 boy", 
 "Mary 180 girl", 
 "An 158 girl", 
 "Mary 180 girl", 
 "Ted 158 boy"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "Josh-An-Ted-Mary-Alex-Mary"; verify_case(1, Arg1, findOrder(Arg0)); }
	void test_case_2() { string Arr0[] = {"Alex 180 boy", 
 "Josh 170 boy", 
 "An 158 girl", 
 "Mary 180 girl", 
 "Ted 175 boy"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = ""; verify_case(2, Arg1, findOrder(Arg0)); }
	void test_case_3() { string Arr0[] = {"Mary 175 girl"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arg1 = "Mary"; verify_case(3, Arg1, findOrder(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  StudentsOrdering ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE
