#include <cstdio>
#include <iostream>
#include <cstdlib>

using namespace std;

const int MAX_N = 100007;

int x[MAX_N], y[MAX_N], n, stop[MAX_N], cnt = 1, a[MAX_N];

int main() {
    scanf("%d", &n);
    for (int i = 1; i < n; ++i) {
        scanf("%d", &a[i]);
        i & 1 ? x[i] = x[i - 1] - y[i] : x[i] = x[i - 1] + y[i];
        y[i] += y[i - 1];
    }
    for (int i = 1; i < n && cnt < n; ++i) {
        i & 1 ? x[i] = x[i - 1] - a[i] : x[i] = x[i - 1] + a[i];
        y[i] = y[i - 1] + a[i];
        if (((x[i] <= 1 - cnt) || (x[i] > 1)) && cnt < n) {
            printf("%d\n", y[i] + (cnt++));
            x[i] -= x[i - 1] + cnt;
            y[i] -= y[i - 1];
        }
    }
    while (cnt++ < n) 
        puts("-1");
    return 0;
}

