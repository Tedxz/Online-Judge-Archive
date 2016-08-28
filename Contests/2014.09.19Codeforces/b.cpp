#include <cstdio>
#include <iostream>

using namespace std;

int n, m, k;
int a[1007], ans = 0;

int lowbit(int x) {
    return x & -x;
}

int bitcount(int x) {
    int i;
    for (i = 0; x; x -= lowbit(x), ++i);
    return i;
}

int main() {
    cin >> n >> m >> k;
    for (int i = 0; i <= m; ++i) {
        cin >> a[i];
    }
    for (int i = 0; i < m; ++i) {
        if (bitcount(a[m]^a[i]) <= k) ++ans;
    }
    cout << ans << endl;
    return 0;
}
