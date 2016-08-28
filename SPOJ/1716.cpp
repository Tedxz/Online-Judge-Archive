//SPOJ 1716
//GSS3
//最长子序列带修改 
#include <cstdio>
#include <cstring>
#include <algorithm>

using namespace std;

#define Lc(x) (x << 1)
#define Rc(x) ((x << 1) + 1)
#define MID(L, R) ((L + R) >> 1)

const int MAX_N = 50007, MAX_S = MAX_N * 4, MINF = -15007 * MAX_N;

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
        node *t = nd + k;
        if (l == r) {
            t->Amax = t->Rmax = t->Lmax = t->Sum = a[l];
            return;
        }
        build(Lc(k), l, MID(l, r));
        build(Rc(k), MID(l, r) + 1, r);
        *t = update(nd[Lc(k)], nd[Rc(k)]);
    }
    
    void reset(int sz) {
        size = sz;
        build(1, 1, size);
    }
    
    node getGSS(int k, int L, int R, int l, int r) {
        node *t = nd + k;
        if (l <= L && R <= r) return *t;
        if (l > R || r < L) return node(MINF, MINF, MINF, 0);
        return update(getGSS(Lc(k), L, MID(L, R), l, r), getGSS(Rc(k), MID(L, R) + 1, R, l, r));
    }
    
    void modify(int k, int L, int R, int pos, int key) {
        if (pos > R || pos < L) return;
        if (L == R) {
            nd[k].set(key, key, key, key);
            return;
        }
        modify(Lc(k), L, MID(L, R), pos, key);
        modify(Rc(k), MID(L, R) + 1, R, pos, key);
        nd[k] = update(nd[Lc(k)], nd[Rc(k)]);
    }
}t;

int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; ++i)
        scanf("%d", &a[i]);
    t.reset(n);
    scanf("%d", &m);
    for (int i = 1, c, x, y; i <= m; ++i) {
        scanf("%d%d%d", &c, &x, &y);
        if (c) printf("%d\n", t.getGSS(1, 1, n, x, y).Amax);
        else t.modify(1, 1, n, x, y);
    }
    return 0;
}
