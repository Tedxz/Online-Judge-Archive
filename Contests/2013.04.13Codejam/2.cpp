#include <cstdio>
#include <iostream>
#include <cstring>

using namespace std;

const int MAX_N = 107;

int T, n, m;
int a[MAX_N][MAX_N];
int Rmax[MAX_N], Cmax[MAX_N];
bool flag;

int main() {
    freopen("B-large.in", "r", stdin);
    freopen("out2.txt", "w", stdout);
    cin >> T;
    for (int t = 1; t <= T; ++t) {
        cin >> n >> m;
        memset(Rmax, 0, sizeof Rmax);
        memset(Cmax, 0, sizeof Cmax);
        for (int i = 1; i <= n; ++i) {
            for (int j = 1; j <= m; ++j) {
                cin >> a[i][j];
                Rmax[i] = max(Rmax[i], a[i][j]);
                Cmax[j] = max(Cmax[j], a[i][j]);
            }
        }
        flag = true;
        for (int i = 1; (i <= n) && flag; ++i) {
            for (int j = 1; (j <= m) && flag; ++j) {
                if (a[i][j] != Rmax[i] && a[i][j] != Cmax[j])
                    flag = false;
            }
        }
        printf("Case #%d: ", t);
        printf(flag ? "YES\n" : "NO\n");
    }
    return 0;
}
