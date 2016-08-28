/*XJTU 314*/
#include <cstdio>
#include <iostream>

using namespace std;

long long a, b, c;

long long pow(long long a, long long b, long long p) {
	long long res = 1;
	for (; b; b >>= 1, a = a * a % p)
		if (1 & b) res = res * a % p;
	return res;
}

int main() {
	cin >> a >> b >> c;
	cout << pow(a, b, c) << endl;
	return 0;
}
//tag : 动态规划
