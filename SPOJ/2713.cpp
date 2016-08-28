//SPOJ 2713
//GSS4
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <cstring>
#include <algorithm>
#include <cmath>
#include <map>
#include <set>
#include <string>
#include <vector>
#include <cctype>

using namespace std;

#define Fi first
#define Se second
#define MP make_pair
#define CL(x) memset(x, 0, sizeof (x))


typedef long long ll;
typedef pair<ll, ll> pii;

#define lowbit(x) (x & -x)

const int MAX_N = 100007;
const double EPS = 1E-6;

ll BIT[MAX_N];
int n, x, y, c, T = 0, m;
ll a[MAX_N];

void modify(int pos, ll dlt) {
    for (; pos <= n; pos += lowbit(pos)) 
        BIT[pos] += dlt;
}
ll sum(int pos) {
    ll res = 0;
    for (; pos > 0; pos -= lowbit(pos))
        res += BIT[pos];
    return res;
}
int anc[MAX_N];
int Find(int x) {
    if (anc[anc[x]] == anc[x]) return anc[x];
    return anc[x] = Find(anc[x]);
}
void Union(int x, int y) {
    anc[Find(x)] = Find(y);
}
int main() {
    while (scanf("%d", &n) > 0) {
        if (T) puts("");
        printf("Case #%d:\n", ++T);
        CL(BIT);
        for (int i = 1; i <= n; ++i) {
            scanf("%lld", a + i); 
            modify(i, a[i]);
            anc[i] = i;
            if (a[i] < 2) Union(i, i + 1);
        }
        anc[n + 1] = n + 1;
        scanf("%d", &m);
        for (int i = 1; i <= m; ++i) {
            scanf("%d%d%d", &c, &x, &y);
            if (c) {
                printf("%lld\n", sum(max(x, y)) - sum(min(x, y) - 1));
            } else {
                for (int i = min(x, y), t = max(x, y); i <= t; i = Find(i + 1)) {
                    ll tmp = (ll)(sqrt(a[i] + EPS));
                    modify(i, tmp - a[i]);
                    a[i] = tmp;
                    if (a[i] < 2) Union(i, i + 1);
                }
            }
        }
    }
    
    return 0;
}
