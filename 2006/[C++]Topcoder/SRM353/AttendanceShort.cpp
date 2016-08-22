#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class AttendanceShort
{ 
public: 
  vector <string> shortList(vector <string> names, vector <string> attendance) { 
    vector <string> res;
	for(int i = 0; i < attendance.size(); ++i)
	{
		int p = 0;
		int times = 0;
		for(int j = 0; j < attendance[i].size(); ++j)
		{
			switch (attendance[i][j])
			{
			case 'P':
				times++;
				p++;
				break;
			case 'A': 
				times++;
			default:
				continue;
			}
		}

		if(p* 4 < times * 3)
		{
			res.push_back(names[i]);
		}
	}

    return res;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
