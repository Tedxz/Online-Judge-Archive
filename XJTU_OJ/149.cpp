/*XJTU 149*/
#include <cstdio>
#include <iostream>
#include <algorithm>
#include <cmath>

using namespace std;

int T, x, ans, n;

inline void getInt(int &x) {
    char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    for (x = 0; c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
}

int main() {
    getInt(T);
    while (T--) {
        getInt(n);
        ans = 0;
        for (int i = sqrt(n); i; --i) {
            x = n / i;
            if (i * x == n)
                ans += i + x;
        }
        if ((int)sqrt(n) * (int)sqrt(n) == n)
            ans -= (int)sqrt(n);
        printf("%d\n", ans);
    }
    return 0;
}
