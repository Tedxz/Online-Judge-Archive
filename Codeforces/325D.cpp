#include <cstdio>
#include <iostream>
#include <set>
#include <algorithm>
#include <utility>
#include <cstring>

using namespace std;

#define X first
#define Y second

typedef pair<int, int> pii;

#define num(x, y) ((x) * (m * 2 + 2) + (y) + 1)

void getInt(int &x) {
    for (x = getchar() - '0'; x < 0 || x > 9; ) x = getchar() - '0';
    for (char c = getchar(); c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
}

const int MAX_N = 3009, MAX_OP = 300007;

int ans, n, m, op;
pii o[MAX_OP];
int anc[MAX_N * MAX_N * 2];
bool mp[MAX_N][MAX_N * 2];
set<int> s1, s2;

int dy[] = {1, 1, 1, 0, 0, -1, -1, -1},
    dx[] = {1, 0, -1, 1, -1, 1, 0, -1};

int Find(int x) {
    if (anc[anc[x]] == anc[x]) return anc[x];
    anc[x] = Find(anc[x]);
    return anc[x];
}
void Union(int x, int y) {
    anc[Find(y)] = Find(x);
}

int main() {
    getInt(n); getInt(m);
    getInt(op);
    if (m == 1) {
        cout << 0 << endl;
        return 0;
    }
    for (int i = 0; i < op; ++i) {
        getInt(o[i].X);
        getInt(o[i].Y);
    }
    for (int i = 1; i <= n; ++i)
        for (int j = 1; j <= m * 2; ++j)
            anc[num(i, j)] = num(i, j);
    memset(mp, 0, sizeof mp);
    for (int i = 0; i < op; ++i) {
        int tt = Find(num(o[i].X, o[i].Y));
        s1.clear();
        s2.clear();
        for (int j = 0; j < 8; ++j) {
            int tx = o[i].X + dx[j], ty = o[i].Y + dy[j];
            if (mp[tx][ty]) s1.insert(Find(num(tx, ty)));
        }
        for (int j = 0; j < 8; ++j) {
            int tx = o[i].X + dx[j], ty = o[i].Y + dy[j] + m;
            if (mp[tx][ty]) {
                s2.insert(Find(num(tx, ty)));
                if (s1.count(Find(num(tx, ty)))) goto nxt;
            }
        }
        for (set<int>::iterator it = s1.begin(); it != s1.end(); ++it) {
            Union(tt, *it);
        }
        tt = Find(num(o[i].X, o[i].Y + m));
        for (set<int>::iterator it = s2.begin(); it != s2.end(); ++it) {
            Union(tt, *it);
        }
        ++ans;
        mp[o[i].X][o[i].Y] = true;
        mp[o[i].X][o[i].Y + m] = true;
        nxt:;
        cout << o[i].X << "  " << o[i].Y << endl;
        for (int a = 1; a <= n; ++a) {
            for (int b = 1; b <= 2 * m; ++b)
                printf("%2d  ", Find(num(a, b)));
            cout << endl;
        }
        cout << endl;
    }
    cout << ans << endl;
    return 0;
}
