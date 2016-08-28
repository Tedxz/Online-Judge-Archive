/*XJTU 294*/
#include <cstdio>
#include <iostream>

using namespace std;

double values[] = { 100, 50, 20, 10, 5, 1, 0.5, 0.1, -1 };
double x;

int main() {
	while (cin >> x) {
		x += 0.01;
		int ans = 0;
		for (int i = 0; values[i] > 0; ++i) {
			ans += (int)(x / values[i]);
			x -= values[i] * (int)(x / values[i]);
		}
		cout << ans << endl;
	}
	return 0;
}
//tag : 贪心
