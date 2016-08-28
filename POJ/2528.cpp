//POJ 3468
//IntervalTree
#include <cstdio>
#include <iostream>
#include <cstring>
#include <vector>
#include <map>
#include <algorithm>

using namespace std;

#define Lc(x) (x << 1)
#define Rc(x) ((x << 1) + 1)
#define X first
#define Y second

const int MAX_N = 100007, MAX_S = 800007;

int n, m, ans = 0;
bool vis[MAX_N];
pair<int, int> op[MAX_N];
vector<int> num;

int clr[MAX_S];
int L[MAX_S], R[MAX_S];
class IntervalTree {
    public:
        
        IntervalTree() {}
        
        void update(int k) {
            if (clr[Lc(k)] == clr[Rc(k)])
                clr[k] = clr[Lc(k)];
            else
                clr[k] = 0;
        }
        
        void build(int k, int l, int r) {
            L[k] = l; R[k] = r;
            if (l == r) {
                clr[k] = 0;
                return;
            }
            build(Lc(k), l, (l + r) >> 1);
            build(Rc(k), (l + r + 2) >> 1, r);
        }
        
        void reset(int size) {
            memset(clr, 0, sizeof clr);
            build(1, 1, size);
        }
        
        void modify(int k, int l, int r, int v) {
            if (L[k] > r || R[k] < l) return;
            if (l <= L[k] && R[k] <= r) {
                clr[k] = v;
                return;
            }
            down(k);
            modify(Lc(k), l, r, v);
            modify(Rc(k), l, r, v);
            update(k);
        }
        
        void down(int k) {
            if (clr[k]) {
                clr[Lc(k)] = clr[k];
                clr[Rc(k)] = clr[k];
            }
            clr[k] = 0;
        }
        
        void gc(int k) {
            if (clr[k]) {
                if (!vis[clr[k]]) ++ans;
                vis[clr[k]] = true;
                return;
            }
            if (L[k] < R[k])
                gc(Lc(k)), gc(Rc(k));
        }
        void getClr() {
            ans = 0;
            memset(vis, 0, sizeof vis);
            gc(1);
        }
        
}t;

int main() {
    scanf("%d", &m);
    while (m--) {
        scanf("%d", &n);
        for (int i = 0; i < n; ++i) {
            scanf("%d%d", &op[i].X, &op[i].Y);
            num.push_back(op[i].X);
            num.push_back(op[i].Y);
        }
        sort(num.begin(), num.end());
        num.erase(unique(num.begin(), num.end()), num.end());
        t.reset(num.size());
        for (int i = 0; i < n; ++i) {
            op[i].X = lower_bound(num.begin(), num.end(), op[i].X) - num.begin() + 1;
            op[i].Y = lower_bound(num.begin(), num.end(), op[i].Y) - num.begin() + 1;
            t.modify(1, op[i].X, op[i].Y, i + 1);
        }
        t.getClr();
        printf("%d\n", ans);
    }
    
    return 0;
}
