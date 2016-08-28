/*Ural 1421*/
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <cmath>
#include <cstring>

using namespace std;

const int MAX_N = 107;
const int MAX_V = MAX_N * MAX_N;
const int MAX_E = MAX_V * 4;
const int INF = 0X20000000; 
inline int readInt(int &x)
{
    static char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    for (x = 0; c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
    return x;
}
struct Edge {
    int target, capacity;
    Edge *nxt, *op;
    Edge() {}
    Edge(int v, int c, Edge *n, Edge *o):
        target(v), capacity(c), nxt(n), op(o) {}
}EdgePool[MAX_E], *ptr = EdgePool;

Edge *head[MAX_V];
int dis[MAX_V], gap[MAX_V];

class Graph {
public:
    int size, S, T, flow, ans;
    bool found;
    void setSize(int n) {
        size = n;
    }
    void addEdge(int u, int v, int c) {
        head[u] = new (ptr++) Edge(v, c, head[u], ptr);
        head[v] = new (ptr++) Edge(u, 0, head[v], head[u]);
    }
    int getMaximumFlow(int s, int t) {
        S = s; T = t;
        gap[0] = size;
        run();
        return ans;
    }
    void augment(int curVertex) {
        if (curVertex == T) {
            ans += flow;
            found = true;
            return;
        }
        int minDis = size + 1;
        int tmpFlow = flow;
        Edge *p;
        for (p = head[curVertex]; p; p = p->nxt) 
            if (p->capacity) {
                if (dis[p->target] + 1 == dis[curVertex]) {
                    flow = min(flow, p->capacity);
                    augment(p->target);
                    if (found)
                        break;
                    if (dis[S] > size + 1)
                        return;
                    flow = tmpFlow;
                }
                minDis = min(minDis, dis[p->target]);
            }
        if (found) {
            p->capacity -= flow;
            p->op->capacity += flow;
        } else {
            if (!(--gap[dis[curVertex]]))
                dis[S] = INF;
            ++gap[dis[curVertex] = minDis + 1];
        }
    }
    void run() {
        while (dis[S] < size + 1) {
            flow = INF;
            found = false;
            augment(S);
        }
    }

}g;

int n, sumR = 0, sumC = 0, tmp;

int vertex(int x, int y) {
    return (x - 1) * (n + 1) + y;
}

int main() {
    scanf("%d", &n);
    int s = 0, t = (n + 1) * (n + 1);
    g.setSize(t + 1);
    for (int i = 1; i <= n; ++i) {
        g.addEdge(s, vertex(i, n + 1), readInt(tmp));
        sumR += tmp;
    }
    for (int j = 1; j <= n; ++j) {
        g.addEdge(vertex(n + 1, j), t, readInt(tmp));
        sumC += tmp;
    }
   for (int i = 1; i <= n; ++i)
        for (int j = 1; j <= n; ++j) {
            g.addEdge(vertex(i, n + 1), vertex(i, j), 100);
            g.addEdge(vertex(i, j), vertex(n + 1, j), 100);
        }
     if (sumR != sumC || sumC != g.getMaximumFlow(s, t)) {
        puts("NO");
        return 0;
    } else
        puts("YES");
    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= n; ++j)
            printf("%d ", head[vertex(i, j)]->op->capacity);
        puts("");
    }
    return 0;
}

