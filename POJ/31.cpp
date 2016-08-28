#include <cstdio>
#include <iostream>
#include <cstring>
#include <cmath>

using namespace std;

int F[22][12], n, k, a[22][12], ans;

int main() {
    while (cin >> n >> k) {
        memset(F, 0, sizeof F);
        for (int i = 1; i <= n; ++i) {
            for (int j = 1; j <= k; ++j) {
                cin >> a[i][j];
            }
            if (i == 1) continue;
            for (int j = 1; j <= k; ++j) {
                F[i][j] = 10000;
                for (int l = 1; l <= k; ++l) {
                    F[i][j] = min(F[i][j], F[i - 1][l] + abs(a[i][j] - a[i - 1][l]));
//                    cout << F[i][j] << endl;
                }
            }
        }
        ans = 10000;
        for (int j = 1; j <= k; ++j) {
            ans = min(ans, F[n][j]);
        }
        cout << ans << endl;
        
    }
    return 0;
}
