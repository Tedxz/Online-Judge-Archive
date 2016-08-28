#include <cstdio>
#include <cstring>
#include <iostream>
#include <cstdlib>

using namespace std;

const int MAX = 11;

int T;
int finish, win;
char s[MAX][MAX];

int get(int dx, int dy, int X, int Y) {
	int res = 0;
	char tem;
	for (int i = 0; i < 4; ++i)
	{
		if ('O' == s[X + i * dx][Y + i * dy]) res = 0, tem = 'O';
		else if ('X' == s[X + i * dx][Y + i * dy]) {
            tem = 'X';
            res = 1;
		} else if ('.' == s[X + i * dx][Y + i * dy]) return -1;
	}
	for (int i = 0; i < 4; X += dx, Y += dy, ++i)
		if (s[X][Y] != 'T' && s[X][Y] != tem)
			return -1;
	return res;
}

int main()
{
	freopen("A-large.in", "r", stdin);
	freopen("out.txt", "w", stdout);
	scanf("%d", &T);
	for (int t = 1; t <= T; ++t) {
		finish = 1; win = -1;
		for (int i = 0; i < 4; ++i) {
			scanf("%s", s[i]);
			for (int j = 0; j < 4; ++j) {
				if (s[i][j] == '.') finish = 0;
            }
		}
		for (int i = 0; i < 4; ++i)
			win = max(win, get(0, 1, i, 0));
		for (int i = 0; i < 4; ++i)
			win = max(win, get(1, 0, 0, i));
		win = max(win, get(1, 1, 0, 0));
		win = max(win, get(1, -1, 0, 3));
        printf("Case #%d: ", t);
		if (win == -1) {
			if (!finish)
                printf("Game has not completed\n", t);
			else
                printf("Draw\n", t);
		} else {
			if (win == 0)
                printf("O won\n", t);
			else
                printf("X won\n", t);
		}
	}
	return 0;
}
