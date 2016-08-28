/*XJTU 303*/
#include <cstdio>
#include <iostream>

using namespace std;

int f[110][110], a, b, n, m;

int main() {
    while (scanf("%d%d", &n, &m) == 2) {
        for (int i = 1; i <= n; ++i)
            for (int j = 1; j <= n; ++j)
                f[i][j] = 1000;
        for (int i = 0; i < m; ++i) {
            scanf("%d%d", &a, &b);
            f[a][b] = f[b][a] = 1;
        }
        scanf("%d%d", &a, &b);
        for (int k = 1; k <= n; ++k)
            for (int i = 1; i <= n; ++i)
                for (int j = 1; j <= n; ++j)
                    if (f[i][j] > f[i][k] + f[k][j])
                        f[i][j] = f[i][k] + f[k][j];
        printf("%d\n", f[a][b] == 1000 ? -1 : f[a][b]);
    }
    return 0;
}   
//tag : Floyd
