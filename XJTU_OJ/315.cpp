/*XJTU 315*/
#include <cstdio>
#include <iostream>
#include <cmath>

using namespace std;

int T, n;
double x[10010], y[10010];

int main() {
	cin >> T;
	while (T--) {
		cin >> n;
		for (int i = 0; i < n; ++i)
			cin >> x[i] >> y[i];
		x[n] = x[0]; y[n] = y[0];
		double ans = 0.0;
		for (int i = 0; i < n; ++i)
			ans += x[i] * y[i + 1] - y[i] * x[i + 1];
		printf("%.2lf\n", abs(ans) / 2);
	}
	return 0;
}
//tag : 计算几何, 多边形面积
