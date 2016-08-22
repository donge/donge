#pragma warning(disable: 4786) 
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
using namespace std;

class BoggleScore
{ 
public: 
	int bfs(int i ,int j, vector <string> &grid, string word)
	{
		int t = 0;
		if(i == 4 || j == 4) return 0;
		if(i == -1 || j == -1) return 0;
		if(word == "") return 1;
	
		if(grid[i][j] == word[0])
		{
			if(1 == bfs(i+1, j, grid, word.substr(1))) t++;
			if(1 == bfs(i-1, j, grid, word.substr(1))) t++;
			if(1 == bfs(i, j+1, grid, word.substr(1))) t++;
			if(1 == bfs(i, j-1, grid, word.substr(1))) t++;

			if(1 == bfs(i+1, j+1, grid, word.substr(1))) t++;
			if(1 == bfs(i+1, j-1, grid, word.substr(1))) t++;
			if(1 == bfs(i-1, j+1, grid, word.substr(1))) t++;
			if(1 == bfs(i-1, j+1, grid, word.substr(1))) t++;
		}
		return t;
	}


	int search(string word, vector <string> &grid)
	{
		int i, j;
		int k = 0;
		int time = 0;
		int t = 0;
		for(i = 0; i < 4; ++i)
		{
			for(j = 0; j < 4; ++j)
			{
				t = bfs(i ,j , grid, word))
				time+= t;
			}
		}

		return time;
	}


	long long bestScore(vector <string> grid, vector <string> words) { 
		long long  res  = 0;
		long long mod = 1E13;
		int i, j;
		int t = 0;
		for(i = 0; i < words.size(); ++i)
		{
			if(t = search(words[i], grid && t > 0))
			{
				cout << "success" << endl;cout << time << endl;
				long long pow = words[i].size();
				pow *= pow;
				pow *= t;
				res += pow;
				if (res >= mod)
				{
					res %= mod;
				}
			}
		}

		
		return res;
	} 
	
}; 

