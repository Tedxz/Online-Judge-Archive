//Codeforces 279D
//״ѹDP 
#include <cstdio>
#include <iostream>
#include <utility>
#include <cstring>
using namespace std;

#define bit(x) (1 << (x))
#define odd(x) (1 & (x))
#define MP make_pair
#define X first
#define Y second
typedef pair<int, int> pii;

const int MAX_N = 24, INF = 0x3F3F3F3F;

int n, a[MAX_N], ans;
int f[2][bit(MAX_N)];

void minimize(int &x, const int &y) {
    if (x > y)
        x = y;
}

int main() {
    std::ios::sync_with_stdio(false);
    cin >> n;
    for (int i = 1; i <= n; ++i)
        cin >> a[i];
    if (a[1] == 0 && n > 1) goto nosol;
    if (a[1] == 0) {
        ans = 1;
        goto pnt;
    }
    for (int i = n; i; a[i--] /= a[1])
        if (a[i] % a[1]) {
            goto nosol;
        }
    
    memset(f, 0x3F, sizeof f);
    f[odd(1)][bit(1)] = 1;
    for (int p = 1; p < n; ++p) {
        memset(f[odd(p + 1)], 0x3F, sizeof f[0]);
        for (int bm = 0; bm < bit(p + 1); ++bm) {
            if (f[odd(p)][bm] == INF) continue;
            if (a[p + 1] == 0) {
                minimize(f[odd(p + 1)][bm & bit(0)], f[odd(p)][bm] + 1);
                goto nxt;
            }
            
            for (int i = 1; i <= p; ++i)
                for (int j = i; j <= p; ++j) {
                    if (a[i] + a[j] == a[p + 1])
                        if (bm & bit(i) && bm & bit(j)) {
                            minimize(f[odd(p + 1)][bm + bit(p + 1)], f[odd(p)][bm] + 1);
                            for (int k = 1; k <= p + 1; ++k) {
                                if (bm & bit(k)) {
                                    minimize(f[odd(p + 1)][bm - bit(k) + bit(p + 1)], f[odd(p)][bm]);
                                }
                            }
                            goto nxt;
                        }
                }
            nxt:;
        }
    }
    
pnt:
    ans = INF;
    for (int i = 0; i < bit(n + 1); ++i)
        minimize(ans, f[odd(n)][i]);
    if (ans == INF) goto nosol;
    cout << ans << endl;
    return 0;
nosol:
    cout << "-1" << endl;
    return 0;    
}
