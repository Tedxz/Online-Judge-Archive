//POJ 3468
//IntervalTree
#include <cstdio>
#include <iostream>
#include <cstring>

using namespace std;

#define Lc(x) (x << 1)
#define Rc(x) ((x << 1) + 1)

const int MAX_N = 100007, MAX_S = MAX_N * 4;

long long a[MAX_N];
int n, m;

class IntervalTree {
    public:
        long long sum[MAX_S], mark[MAX_S];
        int L[MAX_S], R[MAX_S];
        
        IntervalTree() {}
        
        void update(int k) {
            sum[k] = sum[Lc(k)] + mark[Lc(k)] * (R[Lc(k)] - L[Lc(k)] + 1);
            sum[k] +=sum[Rc(k)] + mark[Rc(k)] * (R[Rc(k)] - L[Rc(k)] + 1);
        }
        
        void build(int k, int l, int r) {
            L[k] = l; R[k] = r;
            if (l == r) {
                sum[k] = a[l];
                return;
            }
            build(Lc(k), l, (l + r) >> 1);
            build(Rc(k), (l + r + 2) >> 1, r);
            update(k);
        }
        
        void reset() {
            memset(mark, 0, sizeof mark);
            build(1, 1, n);
        }
        
        void modify(int k, int l, int r, long long v) {
            if (L[k] > r || R[k] < l) return;
            if (l <= L[k] && R[k] <= r) {
                mark[k] += v;
                return;
            }
            modify(Lc(k), l, r, v);
            modify(Rc(k), l, r, v);
            update(k);
        }
        
        void down(int k) {
            sum[k] += mark[k] * (R[k] - L[k] + 1);
            if (L[k] < R[k]) {
                mark[Lc(k)] += mark[k];
                mark[Rc(k)] += mark[k];
            }
            mark[k] = 0;
        }
        
        long long query(int k, int l, int r) {
            down(k);
            if (L[k] > r || R[k] < l) return 0;
            if (l <= L[k] && R[k] <= r) {
                return sum[k];
            }
            return query(Lc(k), l, r) + query(Rc(k), l, r);
        }
        
}t;
char c = 0;
int l, r, v;
    
int main() {
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= n; ++i) 
        scanf("%lld", &a[i]);
    t.reset();
    for (int l, r, v; m--; c = getchar()) {
        while (c != 'Q' && c != 'C') c = getchar();
        if (c == 'C') {
            scanf("%d%d%d", &l, &r, &v);
            t.modify(1, l, r, v);
        } else {
            scanf("%d%d", &l, &r);
            cout << t.query(1, l, r) << endl;
        }
    }
    return 0;
}
