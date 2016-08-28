//SPOJ 2916
//GSS5
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

const int MAX_N = 10007, MAX_S = MAX_N * 4;

int n, m, a[MAX_N];

struct node {
    int Lmax, Rmax, Amax, Sum;
    void set(int lm, int rm, int a, int s) {
        Amax = a; Sum = s;
        Rmax = rm; Lmax = lm;
    }
    node(int lm, int rm, int a, int s) {
        set(lm, rm, a, s);
    }
    node() {}
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
    
    node update(const node &ln, const node &rn) {
        node t;
        t.Sum = ln.Sum + rn.Sum;
        t.Lmax = max(ln.Lmax, ln.Sum + rn.Lmax);
        t.Rmax = max(rn.Rmax, rn.Sum + ln.Rmax);
        t.Amax = max(max(ln.Amax, rn.Amax), ln.Rmax + rn.Lmax);
        return t;
    }
    
    void build(int k, int l, int r) {
        if (l == r) {
            cnd.Amax = cnd.Rmax = cnd.Lmax = cnd.Sum = a[l];
            return;
        }
        build(Lc, l, MID(l, r));
        build(Rc, MID(l, r) + 1, r);
        cnd = update(lc, rc);
    }
    
    void reset(int sz) {
        size = sz;
        CL(nd);
        build(1, 1, size);
    }
    
    node getGSS(int k, int L, int R, int l, int r) {
        if (l > r) return node(0, 0, 0, 0);
        if (l <= L && R <= r) return cnd;
        if (l > R || r < L) return node(0, 0, 0, 0);
        return update(getGSS(Lc, L, MID(L, R), l, r), getGSS(Rc, MID(L, R) + 1, R, l, r));
    }
    
}t;
int T;
int main() {
    scanf("%d", &T);
    while (T--) {
        scanf("%d", &n);
        for (int i = 1; i <= n; ++i)
            scanf("%d", &a[i]);
        t.reset(n);
        scanf("%d", &m);
        for (int i = 1, x1, y1, x2, y2; i <= m; ++i) {
            int ans = 0;
            scanf("%d%d%d%d", &x1, &y1, &x2, &y2);
            if (x1 > x2) while (9);
            if (y1 > y2) while (9);
            if (y1 < x2) {
                ans = t.getGSS(1, 1, n, y1, x2).Sum + 
                max(t.getGSS(1, 1, n, x1, y1 - 1).Rmax, 0) + 
                max(t.getGSS(1, 1, n, x2 + 1, y2).Lmax, 0);
            } else {
                ans = t.getGSS(1, 1, n, x2, y1).Amax;
                ans = max(ans, t.getGSS(1, 1, n, x2, y1).Sum + 
                                max(t.getGSS(1, 1, n, x1, x2 - 1).Rmax, 0) + 
                                max(t.getGSS(1, 1, n, y1 + 1, y2).Lmax, 0));
                ans = max(ans, t.getGSS(1, 1, n, x2, y1).Lmax + t.getGSS(1, 1, n, x1, x2 - 1).Rmax);
                ans = max(ans, t.getGSS(1, 1, n, x2, y1).Rmax + t.getGSS(1, 1, n, y1 + 1, y2).Lmax);
            }
            printf("%d\n", ans);
        }
    }
    return 0;
}
