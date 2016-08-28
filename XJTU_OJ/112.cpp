/*XJTU 112*/
#include <cstdio>
#include <iostream>
#include <algorithm>

using namespace std;

const int MAX_N = 55;

int n, a[MAX_N], ans;

int main() {
    scanf("%d", &n);
    for (int i = 0; i < n; ++i)
        scanf("%d", &a[i]);
    sort(a, a + n);
    ans = 0;
    for (int i = 0; i < n; ++i)
        if (ans < a[i] * (n - i))
            ans = a[i] * (n - i);
    printf("%d\n", ans);
    return 0;
}
