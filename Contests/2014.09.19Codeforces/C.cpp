#include <cstdio>
#include <iostream>
#include <cmath>
#include <cstring>

using namespace std;

int n, m, k;
long long a[5007];
long long F[5007][5007];
int main() {
    cin >> n >> m >> k;
    a[0] = 0;
    for (int i = 1; i <= n; ++i) {
        cin >> a[i];
        a[i] += a[i - 1];
    }
    memset(F, 0, sizeof F);
    for (int i = 1; i <= k; ++i)
        for (int j = i*m; j <= n; ++j) {
            F[i][j] = max(F[i - 1][j - m] + a[j] - a[j - m], F[i][j - 1]);
        }
    cout << F[k][n] << endl;
    return 0;
}
