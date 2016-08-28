#include <cstdio>
#include <iostream>
#include <algorithm>
#include <cstdlib>
#include <cstring>

using namespace std;

int n, k, ans;
long long a[100009];
bool del[100009];

int main() {
    memset(del, 0, sizeof del);
    scanf("%d%d", &n, &k);
    ans = n;
    for (int i = 0; i < n; ++i)
        scanf("%d", &a[i]);
    sort(a, a + n);
    for (int i = 0; i < n - 1; ++i) {
        if (del[i]) continue;
        long long *t = lower_bound(a + i + 1, a + n, a[i] * k);
        if ((t != a + n) && (*t == a[i] * k)) {
            del[t - a] = true;
            --ans;
        }
    }
    printf("%d\n", ans);
    return 0;
}

