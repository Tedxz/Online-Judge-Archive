/*XJTU 298*/
#include <cstdio>
#include <iostream>
#include <algorithm>

using namespace std;

const int MAX_N = 110;

int T;
int n, k;
int a[MAX_N];

int main() {
    scanf("%d", &T);
    while (T--) {
        scanf("%d%d", &n, &k);
        for (int i = 1; i <= n; ++i)
            scanf("%d", &a[i]);
        nth_element(a + 1, a + n - k + 1, a + n + 1);
        printf("%d\n", a[n - k + 1]);
    }
    return 0;
}
