/*XJTU 148*/
#include <cstdio>
#include <iostream>
#include <algorithm>

using namespace std;

const int MAX_N = 10010;

int T, n, m, a[MAX_N], x;
int *p;

inline void getInt(int &x) {
    char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    for (x = 0; c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
}

int main() {
    getInt(T);
    while (T--) {
        getInt(n); getInt(m);
        for (int i = 1; i < n; ++i) {
            getInt(a[i]);
            a[i] += a[i - 1];
        }
        for (int i = 0; i < m; ++i) {
            getInt(x);
            p = lower_bound(a, a + n, x);
            if (*p == x)
                printf("%d\n", p - a + 1);
            else
                printf("%d %d\n", p - a, p - a + 1);
        }
    }
    return 0;
}
