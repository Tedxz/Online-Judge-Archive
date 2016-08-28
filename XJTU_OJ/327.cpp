/*XJTU 327*/
#include <cstdio>
#include <iostream>
#include <cmath>

using namespace std;

int n, m, x[10010], y[10010], t[10010];
int f[10010], p[10010];

inline int abs(int x) {
    return x > 0 ? x : -x;
}

inline void getInt(int &x) {
    char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    for (x = 0; c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
}

int main() {
    getInt(n); getInt(m);
    n *= 2;
    for (int i = 1; i <= m; ++i) {
        getInt(t[i]); getInt(x[i]); getInt(y[i]);
    }
    t[0] = -100000; t[m + 1] = t[m] + 10000;
    for (int i = 1; i <= m + 1; ++i)
        for (int j = i - 1; j >= f[i] && (t[p[i]] - t[j] <= n); --j)
            if (t[i] - t[j] >= abs(x[i] - x[j]) + abs(y[i] - y[j]))
                if (f[i] <= f[j])
                    f[i] = f[j] + 1, p[i] = j;
    printf("%d\n", f[m + 1] - 1);
    return 0;
}
//tag : 动态规划， 打地鼠
