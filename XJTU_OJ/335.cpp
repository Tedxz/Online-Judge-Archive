/*XJTU 335*/
#include <cstdio>
#include <iostream>

using namespace std;

int n, k;
long long f[22][22];

int main() {
    cin >> n >> k;
    for (int i = 1; i <= n; ++i) 
        f[i][1] = 1;
    for (int i = 2; i <= n; ++i)
        for (int j = 1; j <= i; ++j)
            f[i][j] = f[i - 1][j - 1] * (i - j + 1) + f[i - 1][j] * j;
    cout << f[n][k] << endl;
    return 0;
}
//tag : 动态规划
