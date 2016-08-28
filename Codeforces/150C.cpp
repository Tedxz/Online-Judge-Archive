#include <cstdio>
#include <iostream>
#include <cmath>

using namespace std;

const int MAX_N = 100005;

int n;
int a[MAX_N], g[MAX_N][23];
bool u[1050000];
long long ans;

inline int log2(int x) {
    return (int)floor(log(x) / log(2));
}
inline int f(int i, int j) {
    int l = j - i + 1;
    return g[i][log2(l)] | g[j - (1 << log2(l)) + 1][log2(l)];
}
inline void getInt(int &x) {
    static char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    for (x = 0; (c >= '0') && (c <= '9'); c = getchar()) x = x * 10 + c - '0';
}

int main() {
    getInt(n);
    for (int i = 1; i <= n; ++i) {
       getInt(a[i]);
    }
    
    for (int i = 1; i <= n; ++i)
        g[i][0] = a[i];
    for (int j = 1, t = n; (t >>= 1); ++j) {
        for (int i = 1; i <= n; ++i) {
            g[i][j] = g[i][j - 1];
            if (i + (1 << (j - 1)) <= n)
                g[i][j] |= g[i + (1 << (j - 1))][j - 1];
        }
    }
    for (int i = 1; i <= n; ++i) {
        for (int j = i; j <= n; ++j) {
            int p = f(i, j);
            if (!u[p]) {
                ++ans;
                u[p] = true;
            }
            if ((p | f(i, n)) == p)
                break;
            while ((j + 30 < n) && ((p | f(i, j + 30)) == p))
                j += 30;
        }
    }
    cout << ans << endl;
    
    return 0;
}
