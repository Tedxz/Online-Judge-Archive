#include <cstdio>
#include <iostream>
#include <string>
#include <cstring>

using namespace std;

bool valid[10000007];
int ans[10000007];
int pr[10000007];
int tot = 0;
int l, r, k, T;

void getPrime() {
    memset(valid, 1, sizeof valid);
    memset(pr, 0, sizeof pr);
    for (int i = 2; i < 10000007; i++) {
        if (valid[i]) {
            pr[i] = 1;
            tot++;
            ans[tot] = i;
        }
        for (int j = 1; j <= tot && i * ans[j] < 10000007; ++j) {
            valid[i * ans[j]] = false;
            pr[i * ans[j]] = pr[i];
            if (i % ans[j] == 0) break;
            ++pr[i * ans[j]];

        }
    }
}

int main() {
    scanf("%d", &T);
    getPrime();
    for (int cs = 1; cs <= T; ++cs) {
        scanf("%d%d%d", &l, &r, &k);
        int ans = 0;
        for (int i = l; i <= r; ++i) 
            if (pr[i] == k) ++ans;
        printf("Case #%d: %d\n", cs, ans);
    }
    return 0;
}

