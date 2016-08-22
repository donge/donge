#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class SyllableSorting
{ 
public: 
	 vector <string> split(string words) {
		vector <string>  ret;
		int i = 0;
		int n = 0;
		int v = 0;
		for(i = 0; i < words.size(); ++i)
		{
			if(words[i] == 'a' || words[i] == 'e' || words[i] == 'i' || words[i] == 'o' || words[i] == 'u')
			{
				v = 1;
			}
			
			if(v && (words[i] != 'a' && words[i] != 'e' && words[i] != 'i' && words[i] != 'o' && words[i] != 'u'))
			{
				//cout << words.substr(n, i-n) << endl;
				ret.push_back(words.substr(n, i-n));
				v = 0;
				n = i;
			}
		}
		//cout << words.substr(n, i) << endl;
		ret.push_back(words.substr(n, i));

		return ret;
	}


  vector <string> sortWords(vector <string> words) { 
    vector< vector <string> > un;
    vector< vector <string> > so;
	vector <string> res = words;
	int i, j;
	for(i = 0; i < words.size(); ++i)
	{
		vector <string> a = split(words[i]);
		un.push_back(a);
		sort(a.begin(), a.end());
		so.push_back(a);
		for(j = 0; j < a.size();++j)
		{
			cout << a[j] << endl;
		}
	}


	//sort(res.begin(), res.back(), less);

	for(i = 0; i < res.size() - 1; ++i)
		for(j = i + 1; j < res.size(); ++j)
	{
		if(so[i]  > so[j]) 
		{
			string t1 = res[i];
			vector <string>  t2 = so[i];
			vector <string>  t3 = un[i];

			res[i] = res[j];
			so[i] = so[j];
			un[i] = un[j];

			res[j] = t1;
			so[j] = t2;
			un[j] = t3;
		}
		else if(so[i] == so[j])
		{
			if(un[i] > un[j])
			{
				string t1 = res[i];
				vector <string>  t2 = so[i];
				vector <string>  t3 = un[i];

				res[i] = res[j];
				so[i] = so[j];
				un[i] = un[j];

				res[j] = t1;
				so[j] = t2;
				un[j] = t3;
			}
		}
	}

    return res;
  } 
  
// BEGIN CUT HERE
	public:
	void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0(); if ((Case == -1) || (Case == 1)) test_case_1(); if ((Case == -1) || (Case == 2)) test_case_2(); if ((Case == -1) || (Case == 3)) test_case_3(); if ((Case == -1) || (Case == 4)) test_case_4(); }
	private:
	template <typename T> string print_array(const vector<T> &V) { ostringstream os; os << "{ "; for (typename vector<T>::const_iterator iter = V.begin(); iter != V.end(); ++iter) os << '\"' << *iter << "\","; os << " }"; return os.str(); }
	void verify_case(int Case, const vector <string> &Expected, const vector <string> &Received) { cerr << "Test Case #" << Case << "..."; if (Expected == Received) cerr << "PASSED" << endl; else { cerr << "FAILED" << endl; cerr << "\tExpected: " << print_array(Expected) << endl; cerr << "\tReceived: " << print_array(Received) << endl; } }
	void test_case_0() { string Arr0[] = {"xiaoxiao", "yamagawa", "gawayama"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"gawayama", "yamagawa", "xiaoxiao" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(0, Arg1, sortWords(Arg0)); }
	void test_case_1() { string Arr0[] = {"bcedba", "dbabce", "zyuxxo"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"bcedba", "dbabce", "zyuxxo" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(1, Arg1, sortWords(Arg0)); }
	void test_case_2() { string Arr0[] = {"hgnibqqaxeiuteuuvksi", "jxbuzui", "zrotyqeruiydozui",
 "ywuuzkto", "lmopbookoagyco", "vredfvavvexliu"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"hgnibqqaxeiuteuuvksi", "vredfvavvexliu", "lmopbookoagyco", "jxbuzui", "zrotyqeruiydozui", "ywuuzkto" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(2, Arg1, sortWords(Arg0)); }
	void test_case_3() { string Arr0[] = {"crazgo", "cwsoygiokiuo", "yueoseeu", "tuadiojvugeoe",
 "naumxditui", "sgukkelyoi", "nrohjuasoia", "mgabmo"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"mgabmo", "crazgo", "cwsoygiokiuo", "tuadiojvugeoe", "nrohjuasoia", "sgukkelyoi", "naumxditui", "yueoseeu" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(3, Arg1, sortWords(Arg0)); }
	void test_case_4() { string Arr0[] = {"wheewjuguoi", "coutcu", "hqivaa", "sgiibgwi", "ypaqpki",
 "bgyikouapae", "wqakeu", "skolfo", "pzesaa", "ypivhi"}; vector <string> Arg0(Arr0, Arr0 + (sizeof(Arr0) / sizeof(Arr0[0]))); string Arr1[] = {"sgiibgwi", "bgyikouapae", "coutcu", "wheewjuguoi", "hqivaa", "wqakeu", "skolfo", "pzesaa", "ypaqpki", "ypivhi" }; vector <string> Arg1(Arr1, Arr1 + (sizeof(Arr1) / sizeof(Arr1[0]))); verify_case(4, Arg1, sortWords(Arg0)); }

// END CUT HERE

}; 

// BEGIN CUT HERE 
int main()
{
  SyllableSorting ___test; 
  ___test.run_test(-1); 
  return 0;
} 
// END CUT HERE 
