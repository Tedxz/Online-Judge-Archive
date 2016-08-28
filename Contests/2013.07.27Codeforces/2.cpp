#include <cstdio>
#include <iostream>

using namespace std;
const int MAX_N = 1010;
int r[MAX_N], c[MAX_N];
int n, m, x, y, ans;

int main() {
    cin >> n >> m;
    while (m--) {
        cin >> x >> y;
        r[x] = c[y] = 1;
    }
    for (int i = 2; i <= n / 2; ++i) {
        int t = 4;
        ans += 4;
        ans -= r[i] + c[i] + r[n - i + 1] + c[n - i + 1];
    }
    if (n & 1)
        if (r[n + 1 >> 1] * c[n + 1 >> 1] == 0)
            ++ans;
    cout << ans << endl;
}
