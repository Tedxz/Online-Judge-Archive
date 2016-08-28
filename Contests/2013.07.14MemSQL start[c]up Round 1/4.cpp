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

#define num(x, y) ((x) * m + (y) + 1)

void getInt(int &x) {
    for (x = getchar() - '0'; x < 0 || x > 9; ) x = getchar() - '0';
    for (char c = getchar(); c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
}

const int MAX_N = 3007, MAX_OP = 300007;

int ans, n, m, op;
pii o[MAX_OP];
int anc[MAX_N * MAX_N];
set<int> tbu, tbuc;
bool mp[MAX_N][MAX_N];

int dy[] = {1, 1, 1, 0, 0, -1, -1, -1},
    dx[] = {1, 0, -1, 1, -1, 1, 0, -1};

int Find(int x) {
    if (anc[anc[x]] == anc[x]) return anc[x];
    anc[x] = Find(anc[x]);
    return anc[x];
}
void Union(int x, int y) {
    x = Find(x); y = Find(y);
    anc[y] = x;
}
bool check_do(int opn) { 
    //如果不是首尾列 
    int x = o[opn].X, y = o[opn].Y;
    tbu.clear();
    tbuc.clear();
    for (int i = 0; i < 8; ++i) {
        int tx = x + dx[i], ty = y + dy[i];
        if (tx < 0 || tx >= n || !mp[tx][ty]) continue;
        if (ty == m || ty == -1)
            tbuc.insert(num(tx, (ty + m) % m));
        else 
            tbu.insert(Find(num(tx, ty)));
    }
    tbu.insert(num(x, y));
    for (int i = 0; i < n; ++i) {
        if (!mp[i][m - 1] && !(i == x && m - 1 == y)) continue;
        for (int j = -1; j <= 1; ++j) {
            int tx = i + j;
            if (tx < 0 || tx >= n || (!mp[tx][0] && !(tx == x && 0 == y))) continue;
            if ((tbu.count(Find(num(tx, 0))) || tbuc.count(Find(num(tx, 0)))) && (tbu.count(Find(num(i, m - 1))) || tbu.count(Find(num(i, m - 1)))))
                return false;
            else {
                tbu.insert(Find(num(tx, 0)));
                tbu.insert(Find(num(i, m - 1)));
            }
        }
    }

    for (set<int>::iterator i = tbu.begin(); i != tbu.end(); ++i) 
        Union(*tbu.begin(), *i);
    for (set<int>::iterator i = tbuc.begin(); i != tbuc.end(); ++i) 
        Union(*tbuc.begin(), *i);
    mp[x][y] = true;
    return true;
}

int main() {
    getInt(n); getInt(m);
    getInt(op);
    for (int i = 0; i < op; ++i) {
        getInt(o[i].X);
        getInt(o[i].Y);
        --o[i].X; --o[i].Y;
    }
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < m; ++j)
            anc[num(i, j)] = num(i, j);
    memset(mp, 0, sizeof mp);
    ans = 0;
    for (int i = 0; i < op; ++i) {
        if (check_do(i)) {
            ++ans;
        }

//        for (int a = 0; a < n; ++a) {
//            for (int b = 0; b < m; ++b)
//                cout << Find(num(a, b)) << "(" << (int)mp[a][b] << ")" << "\t" ;
//            cout << endl;
//        }
//        cout << endl;
    }
    cout << ans << endl;
    return 0;
}
