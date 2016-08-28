//Ural 1910
#include <cstdio>
#include <iostream>

using namespace std;

const int MAX_N = 1001;

int a[3], n, ans, mx = -1;

int main() {
    scanf("%d", &n);
    scanf("%d%d", &a[0], &a[1]);
    for (int i = 2; i < n; ++i) {
        scanf("%d", &a[i % 3]);
        if (a[0] + a[1] + a[2] > mx) {
            mx = a[0] + a[1] + a[2];
            ans = i;
        }
    }
    printf("%d %d\n", mx, ans);
    return 0;
}
