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
ull ans, p, q, tmp, k, cl, tans;
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
    freopen("b.out", "w", stdout);
    
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
        
        for (p = n; p >= 1; --p) {
            if (ceil(k / p) <= m && p >= 2) {
                q = k / p;
                tmp = k - p * q;
                tans = (((p * (p - 1)) >> 1) * q * (q - 1)) >> 1;
                tans += (tmp * tmp * q - tmp * q) >> 1;
                if (ans < tans) ans = tans;
                //cout << "#" << p << " " << q << " " << tans << endl;
            }
            if (k / p <= m) {
                q = k / p;
                tmp = k - p * q;
                if (tmp > q || p == n) continue;
                tans = (((q * (q - 1)) >> 1) * p * (p - 1)) >> 1;
                tans += (tmp * tmp * p - tmp * p) >> 1;
                if (ans < tans) ans = tans;
                //cout << "#" << p << " " << q << " " << tans << endl;
            }
        }
        
        cout << "Case #" << t << ": " << ans << endl;
    }
    return 0;
}
