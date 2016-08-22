#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class ProgrammingDevice
{ 
public: 
  int minPackets(vector <int> offset, vector <int> size, int maxData) { 
    int res;
	int i,j;
	for(i = 0; i < offset.size(); ++i)
	{
		size[i] += offset[i];
	}


for(i = 0; i < offset.size()-1; ++i)
for(j = i+1; j < offset.size(); ++j)
{
	if(offset[i] > offset[j])
	{
		int tmp = offset[i];
		offset[i] =  offset[j];
		offset[j] = tmp;

		tmp = size[i];
		size[i] =  size[j];
		size[j] = tmp;
	}

}

	int t = 1;
    int w = offset[0] + maxData;
	bool b = false;
	int old = 0;

	for(i = 0; i < offset.size(); ++i)
	{
		int x = 0;
		while (w < size[i])
		{
			if(x) b = false;
			if (b)
			{
				if(offset[i] + maxData < size[i])
				{
					w = size[i]- ((size[i] - offset[i]) % maxData);
					t += (size[i] - offset[i]) / maxData;
				}
				else
				{
					w = offset[i] + maxData;
					t++;
				}
				x = 1;
			}
			else
			{
				if(w + maxData < size[i])
				{
					t += (size[i] - w) / maxData;
					w = size[i]- ((size[i] - w) % maxData);
					
				}
				else
				{
				  w += maxData;
				  t++;
				}
				x = 1;
			}
		}
		b = true;
	}

    // My Solution

    return t;
  } 
  

}; 



// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
