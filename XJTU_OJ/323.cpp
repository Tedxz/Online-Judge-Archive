/*XJTU 323*/
#include <cstdio>

const int MAX_N = 705;

int n, ans, tmp;
int x[MAX_N], y[MAX_N];

int main() {
    scanf("%d", &n);
    if (n <= 2) {
        printf("%d\n", n);
        return 0;
    }
    for (int i = 1; i <= n ; ++i)
        scanf("%d%d", &x[i], &y[i]);
    int x1, x2, y1, y2;
    for (int i = 1; i <= n - 2; ++i)
        for (int j = i + 1; j < n; ++j) {
            x1 = x[j] - x[i];
            y1 = y[j] - y[i];
            tmp = 2;
            for (int k = j + 1; k <= n; ++k) {
                x2 = x[k] - x[i];
                y2 = y[k] - y[i];
                tmp += (x1 * y2 == x2 * y1);
            }
            if (ans < tmp)
                ans = tmp;
        }
    printf("%d\n", ans);
    return 0;
}
//tag : 计算几何, 多点共线
