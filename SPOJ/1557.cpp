//SPOJ 1557
//GSS2
//最长子序列 不记重复 
#include <cstdio>
#include <cstring>
#include <algorithm>
#include <utility>

using namespace std;

#define Fi first
#define Se second
#define MP make_pair
#define CL(x) memset(x, 0, sizeof (x))

typedef int ll;
typedef pair<int, int> pii;

#define lowbit(x) (x & -x)
#define Lc (k << 1)
#define Rc (k << 1 | 1)
#define MID(L, R) (L + R >> 1)
#define cnd nd[k]
#define lc nd[(k << 1)]
#define rc nd[(k << 1 | 1)]

const int MAX_N = 100100, MAX_S = MAX_N * 4;

int n, m, a[MAX_N];

struct node {
    ll maxDelta, delta, maxValue, everMax;
    int L, R;
    node() {
        maxDelta = 0;
        delta = 0;
        maxValue = 0;
        everMax = 0;
    }
};

class IntervalTree {
public:
    int size;
    node *nd;
    
    IntervalTree() {
        nd = new node[MAX_S];
    }
    
    ~IntervalTree() {
        delete[] nd;
    }
    
    void build(int k, int l, int r) {
        cnd.L = l; cnd.R = r;
        if (l == r) return;
        build(Lc, l, MID(l, r));
        build(Rc, MID(l, r) + 1, r);
    }
    
    void reset(int sz) {
        size = sz;
        CL(nd);
        build(1, 1, size);
    }
    
    void down(int k) {
        lc.maxDelta = max(lc.maxDelta, lc.delta + cnd.maxDelta);
        rc.maxDelta = max(rc.maxDelta, rc.delta + cnd.maxDelta);
        lc.delta += cnd.delta;
        rc.delta += cnd.delta;
        cnd.maxValue += cnd.delta;
        cnd.delta = cnd.maxDelta = 0;
    }
    void update(int k) {
        cnd.maxValue = max(lc.maxValue + lc.delta, rc.maxValue + rc.delta);
        cnd.everMax = max(max(lc.maxValue + lc.maxDelta, lc.everMax), 
                            max(rc.maxValue + rc.maxDelta, rc.everMax));
    }
    
    void modify(int k, int l, int r, ll key) {
        if (cnd.R < l || cnd.L > r) return;
        if (l <= cnd.L && cnd.R <= r) {
            cnd.delta += key;
            cnd.maxDelta = max(cnd.maxDelta, cnd.delta);
            return;
        }
        down(k);
        modify(Lc, l, r, key);
        modify(Rc, l, r, key);
        update(k);
    }
    
    ll query(int k, int l, int r) {
        if (l <= cnd.L && cnd.R <= r) 
            return max(nd[k].everMax, nd[k].maxValue + nd[k].maxDelta);
        down(k); update(k);
        if (r <= MID(cnd.L, cnd.R)) return query(Lc, l, r);
        if (l > MID(cnd.L, cnd.R)) return query(Rc, l, r);
        return max(query(Lc, l, r),
                    query(Rc, l, r));
    }
}t;
int lastp[MAX_N * 2], *last = lastp + MAX_N;

struct query {
    int id, l, r;
}q[MAX_N];

bool cmp1(const query &a, const query &b) {
    return a.r < b.r;
}

ll ans[MAX_N];
int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; ++i)
        scanf("%d", &a[i]);
    t.reset(n);
    scanf("%d", &m);
    for (int i = 0; i < m; ++i) {
        scanf("%d%d", &q[i].l, &q[i].r);
        q[i].id = i;
    }
    sort(q, q + m, cmp1);
    CL(lastp);
    for (int i = 1, p = 0; i <= n; ++i) {
        t.modify(1, last[a[i]] + 1, i, a[i]);
        last[a[i]] = i;
        for (; q[p].r == i; ++p) {
            ans[q[p].id] = t.query(1, q[p].l, q[p].r);
        }
    }
    for (int i = 0; i < m; ++i)
        printf("%d\n", ans[i]);
    return 0;
}
