#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

static int md[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

class BirthNumbersValidator
{ 
public:
	bool check(string n) {
		bool leap = false;
		int y = (n[0] - '0') * 10 + (n[1] -'0');
		if(y <= 6) y+= 2000;
		else y+= 1900;
		
		if(y % 4 == 0 && y % 100 != 0 || y % 400 == 0) leap = true;

		cout << y << endl;
		int m = (n[2] - '0') * 10 + (n[3] -'0');
		cout << m << endl;
		int d = (n[4] - '0') * 10 + (n[5] -'0');
		cout << d << endl;

		long long num;
		//int num;
		stringstream ss;
		ss << n;
		ss >> num;

		if(leap)
		{
			if((m == 2 || m == 52 )&& d > 0 && d <= 29 && num % 11 == 0) return true;
			else if( m>0 && m <13 && d > 0 && d <= md[m-1] && num % 11 == 0) return true;
			else if( m>50 && m <63 && d > 0 && d <= md[m-51] && num % 11 == 0) return true;
			
		}
		else
		{
			cout << "no leap" << endl;
			if( m>0 && m <13 && d > 0 && d <= md[m-1] && num % 11 == 0) return true;
			else if( m>50 && m <63 && d > 0 && d <= md[m-51] && num % 11 == 0) return true;
		}
	

		return false;
	}

  vector <string> validate(vector <string> test) { 
    vector <string> res;
	int i, j;

	for(i = 0; i < test.size(); ++i)
	{
		if(check(test[i])) res.push_back("YES");
		else res.push_back("NO");
	}
    // My Solution

    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
