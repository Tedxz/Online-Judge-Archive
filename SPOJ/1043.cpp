//SPOJ 1043
//GSS1
//最长子序列
#include <cstdio>
#include <cstring>
#include <algorithm>

using namespace std;

#define Fi first
#define Se second
#define MP make_pair
#define MS memset

typedef long long ll;

#define lowbit(x) (x & -x)
#define Lc(x) (x << 1)
#define Rc(x) ((x << 1) + 1)
#define MID(L, R) ((L + R) >> 1)


const int MAX_N = 50007, MAX_S = MAX_N * 4, MINF = -15007 * MAX_N;

int n, m, a[MAX_N];

struct node {
    int Lmax, Rmax, Amax, Sum;
    node(int lm, int rm, int a, int s) {
        Amax = a;
        Rmax = rm;
        Lmax = lm;
        Sum = s;
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
    
}t;

int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; ++i)
        scanf("%d", &a[i]);
    t.reset(n);
    scanf("%d", &m);
    for (int i = 1, x, y; i <= m; ++i) {
        scanf("%d%d", &x, &y);
        printf("%d\n", t.getGSS(1, 1, n, x, y).Amax);
    }
    return 0;
}
