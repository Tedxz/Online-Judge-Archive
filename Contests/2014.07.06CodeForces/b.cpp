#include <cstdio>
#include <iostream>
#include <algorithm>
#include <map>
#include <cstring>

using namespace std;

int anc[100];
int n, m, cnt;

int Find(int x) {
    if (anc[x] == anc[anc[x]])
        return anc[x];
    return anc[x] = Find(anc[x]);
}

void Union(int x, int y) {
    anc[Find(x)] = Find(y);
}

int main() {
    cin >> n >> m;
    cnt = n;
    for (int i = 1; i <= n; ++i) {
        anc[i] = i;
    }
    for (int i = 0; i < m; ++i) {
        int x, y;
        cin >> x >> y;
        if (Find(x) != Find(y)) {
            --cnt;
            Union(x, y);
        }
    }
    //cout << (n - cnt) << endl;;
    long long ans = ((long long)1) << (n - cnt);
    cout << ans << endl;
    return 0;
}
