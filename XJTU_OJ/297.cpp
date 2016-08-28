/*XJTU 297*/
#include <cstdio>
#include <iostream>
#include <cmath>

using namespace std;

int n, a[2], ans = 0;

int main() {
	scanf("%d", &n);
	for (int i = 1; n; n--, i = 1 - i) {
		scanf("%d", &a[i]);
		a[i] = max(a[i], a[i] + a[1 - i]);
		ans = max(ans, a[i]);
	}
	printf("%d\n", ans);
	return 0;
}
//tag : 水题, 前缀和
