#include <cstdio>
#include <cstring>
#include <iostream>
#define MAX 10
using namespace std;

char s[MAX][MAX];

int get(int X, int Y, int dx, int dy)
{
	int ret = 0;
	for (int i = 0; i < 4; ++i)
	{
		if (s[X + i * dx][Y + i * dy] == 'O') ret = 0;
		else if (s[X + i * dx][Y + i * dy] == 'X') ret = 1;
		else if (s[X + i * dx][Y + i * dy] == '.') return -1;
	}
	for (int i = 0; i < 3; X += dx, Y += dy, ++i)
		if (s[X][Y] != s[X+dx][Y+dy]
		&& (s[X][Y] != 'T' && s[X+dx][Y+dy] != 'T')) return -1;
	return ret;
}

int main()
{
	int T;
	freopen("A-small-attempt0.in", "r", stdin);
	freopen("out1.txt", "w", stdout);
	scanf("%d", &T);
	for (int t = 1; t <= T; ++t)
	{
		int fin = 1, win = -1;
		for (int i = 0; i < 4; ++i)
		{
			scanf("%s", s[i]);
			for (int j = 0; j < 4; ++j)
				if (s[i][j] == '.') fin = 0;
		}
		for (int i = 0; i < 4; ++i)
			win = max(win, get(i, 0, 0, 1));
		for (int i = 0; i < 4; ++i)
			win = max(win, get(0, i, 1, 0));
		win = max(win, get(0, 0, 1, 1));
		win = max(win, get(0, 3 , 1, -1));
		if (win == -1)
		{
			if (!fin) printf("Case #%d: Game has not completed\n", t);
			else printf("Case #%d: Draw\n", t);
		}
		else
		{
			if (win == 0) printf("Case #%d: O won\n", t);
			else printf("Case #%d: X won\n", t);
		}
	}
	return 0;
}
