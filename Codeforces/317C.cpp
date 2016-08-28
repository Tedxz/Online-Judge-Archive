//Codeforces 317C
#include <cstdio>
#include <iostream>
#include <cstring>
#include <vector>
#include <queue>

using namespace std;

const int MAX_N = 321;

int n, v, e;
int sumA[MAX_N], sumB[MAX_N], anc[MAX_N];
vector<int> rt;

struct Edge {
    int t;
    Edge *nxt;
    Edge() {}
    Edge(int _t, Edge, Edge *_nxt) : t(_t), nxt(_nxt) {
    }
}*head[MAX_N], EdgePool[MAX_E], *ptr = EdgePool;

void addEdge(int u, int v) {
    head[u] = new (ptr++) Edge(v, head[u]);
    head[v] = new (ptr++) Edge(u, head[v]);
    
}

int Find(int x) {
    if (anc[x] == anc[anc[x]]) return anc[x];
    return anc[x] = Find(anc[x]);
}

void Union(int x, int y) {
    x = Find(x); y = Find(y);
    if (x == y) return;
    anx[x] = y;
    sumA[y] += sumA[x];
    sumB[y] += sumB[x];
    
}

void checkSum() {
    for (int i = 1; i <= n; ++i) {
        if (anc[i] == i && sumA[i] != sumB[i]) {
            printf("NO\n");
            exit(0);
        }
    }
}
pair<int, int> q;
int qh, qt;
bool vis[MAX_N];
void BFS(int s, int t) {
    memset(vis, 0, sizeof vis);
    while (!q.empty()) {
        int cur = q.top();
        q.pop();
        for (Edge *p = head[cur]; p; p = p->nxt) {
            if (!vis[p->t]) {
                vis[p->t] = 1;
                q.push(p->t);
            }
        }
        
    }
    
    
}

int main() {
    scanf("%d%d%d", &n, &v, &e);
    for (int i = 1; i <= n; ++i) anc[i] = i;
    for (int i = 1; i <= n; ++i) {
        scanf("%d", a + i);
        sumA[i] = a[i];
    }
    for (int i = 1; i <= n; ++i) {
        scanf("%d", b + i);
        sumB[i] = b[i];
    }
    for (int i = 1, u, v; i <= e; ++i) {
        scanf("%d%d", &u, &v);
        addEdge(u, v);
        Union(u, v);
    }
    checkSum();
    
    for (int i = 1; i < n; ++i) {
        if (a[i] == b[i]) continue;
        for (int j = i + 1; j <= n; ++j) {
            if (Find(i) != Find(j)) continue;
            if ((a[i] - b[i]) * (a[j] * b[j]) >= 0) continue;
            int x, y, d;
            if (a[i] > b[i]) {
                x = i; y = j; d = min(a[i] - b[i], b[j] - a[j]);
            } else {
                x = j; y = i; d = min(a[j] - b[j], b[i] - a[i]);
            }
            BFS(x, y);
        }
    }
}
