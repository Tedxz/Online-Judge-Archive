#include <cstdio>
#include <iostream>
#include <cstring>

using namespace std;

const int MAX_N = 100007;

struct Edge {
    Edge *nxt;
    int t;
    Edge() {}
    Edge(int _t, Edge *_nxt): t(_t), nxt(_nxt) {}
}EdgePool[MAX_N * 2], *ptr = EdgePool, *head[MAX_N];

void addEdge(int u, int v) {
    head[u] = new Edge(v, head[u]);
    head[v] = new Edge(u, head[v]);
}

int n, fa[MAX_N], v[MAX_N];
long long Fp[MAX_N], Fm[MAX_N];

void DFS(int x) {
    int s = 0;
    for (Edge *p = head[x]; p; p = p->nxt) {
        if (p->t == fa[x]) continue;
        fa[p->t] = x;
        DFS(p->t);
        Fp[x] = max(Fp[x], Fp[p->t]);
        Fm[x] = max(Fm[x], Fm[p->t]);
    }
    s = v[x] + Fp[x] - Fm[x];
    (s > 0) ? Fm[x] += s : Fp[x] -= s;
}

int main() {
    memset(head, 0, sizeof head);
    scanf("%d", &n);
    for (int i = 0, x, y; i < n - 1; ++i) {
        scanf("%d%d", &x, &y);
        addEdge(x, y);
    }
    for (int i = 1; i <= n; ++i)
        scanf("%d", &v[i]);
    DFS(1);
    cout << Fm[1] + Fp[1] << endl;
    return 0;
}
