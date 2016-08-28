#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <ctime>

using namespace std;

typedef long long ull;

void sleep(int x) {
    int t = clock();
    while (clock() < t + x);
    return;
}

int T, n, m;
ull ans, p, q, tmp, k, cl;
ull min(ull a, ull b) {
    if (a < b) return a;
    return b;
}
ull max(ull a, ull b) {
    if (a > b) return a;
    return b;
}
void swap(ull &a, ull &b) {
    ull t = a;
    a = b;
    b = t;
}


int main() {
    freopen("a.txt", "r", stdin);
    freopen("a.out", "w", stdout);
    
    cl = clock();
    cin >> T;
    for (int t = 1; t <= T; ++t) {
        ans = 0;
        cin >> n >> m >> k;
        cout << n << " " << m << " " << k << endl;
        if (n > m) swap(n, m);
        if (k <= 3 || n < 2) {
            cout << "Case #" << t << ": " << 0 << endl;
            continue;
        }
        p = (int)(sqrt(k) + 1e-4);
        p = min(p, n);
        q = min((ull)(k / p + 1e-4), m);
        ans = (((p * (p - 1)) >> 1) * q * (q - 1)) >> 1;
        k -= p * q;
        if (p == n) {
            while (k > 0) {
                tmp = min(k, p);
                k -= tmp;
                ans += (tmp * tmp * q - tmp * q) >> 1;
                ++q;
            }
        } else {
            while (k > 0) {
                if (q == m) { //must s.t. m==n
                    if (m != n) while (9);
                    swap(p, q);
                }
                tmp = min(k, p);
                k -= tmp;
                ans += (tmp * tmp * q - tmp * q) >> 1;
                ++q;
            }
        }
        cout << "Case #" << t << ": " << ans << endl;
    }
    return 0;
}
