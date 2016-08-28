#include <cstdio>
#include <iostream>
#include <utility>
#include <algorithm>

using namespace std;

int n, sum = 0, L = 31400, R = 0, U = 0, D = 31400;

int main() {
    cin >> n;
    int l, r, u, d;
    while (n--) {
        cin >> l >> d >> r >> u;
        L = min(L, l);
        D = min(D, d);
        R = max(R, r);
        U = max(U, u);
        sum += (r - l) * (u - d);
    }
    if ((sum == (R - L) * (U - D)) && ((R - L) == (U - D)))
        cout << "YES" << endl;
    else
        cout << "NO" << endl;
    return 0;
}
