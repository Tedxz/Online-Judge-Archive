#include <cstdio>
#include <iostream>
#include <cstring>

using namespace std;

int n;
char s[50007], t[50007];
int ls, lt, ans, tans;

int main() {
    scanf("%d", &n);
    for (int c = 1; c <= n; ++c) {
        scanf("%s%s", &s, &t);
        ls = strlen(s);
        lt = strlen(t);
        ans = ls;
        for (int i = 0; i + lt <= ls; ++i) {
            tans = 0;
            for (int j = 0; j < lt; ++j) {
                tans += (s[i + j] != t[j]);
            }
            if (tans < ans) ans = tans;
        }
        printf("Case #%d: %d\n", c, ans);
    }
    return 0;
}

