#include <cstdio>
#include <iostream>
#include <utility>
#include <cstring>

using namespace std;

const int N = 100007;
int anc[N];
int Find(int x) {
    if (anc[x] == anc[anc[x]]) return anc[x];
    return anc[x] = Find(anc[x]);
}
void Union(int x, int y) {
    anc[Find(y)] = Find(x);
}
int n, m, q, ans[N], cnt;
pair<int, int> e[N];
int des[N];
bool u[N];


int main() {
    cin >> n >> m;
    cnt = n;
    for (int i = 1; i <= n; ++i) 
        anc[i] = i;
    for (int i = 1, x, y; i <= m; ++i) {
        cin >> x >> y;
        e[i] = make_pair(x, y);
    }
    cin >> q;
    memset(u, false, sizeof u);
    for (int i = 1; i <= q; ++i){
        cin >> des[i];
        u[des[i]] = true;
    }
    
    for (int i = 1; i <= m; ++i)
        if (!u[i])
            if (Find(e[i].first) != Find(e[i].second)) {
                Union(e[i].first, e[i].second);
                --cnt;
            }
    
    for (int i = q; i > 0; --i) {
        ans[i] = cnt;
        if (Find(e[des[i]].first) != Find(e[des[i]].second)) {
            --cnt;
            Union(e[des[i]].first, e[des[i]].second);
        }
    }
    for (int i = 1; i <= q; ++i)
        cout << ans[i] << " ";
    cout << endl;
    return 0;
}
