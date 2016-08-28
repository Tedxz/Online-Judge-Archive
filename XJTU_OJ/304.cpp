/*XJTU 304*/
#include <cstdio>
#include <iostream>

using namespace std;

int n, m;
char buf[100];

int main() {
	while (cin >> n >> m) {
		for (int i = 0; i <= m; ++i)
			gets(buf);
		cout << m - n + 1 << endl;
	}
	return 0;
}
//tag : 水题
