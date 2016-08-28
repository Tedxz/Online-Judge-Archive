/*URAL P1080*/
#include <cstdio>
#include <cstring>
#include <iostream>
const int MAX_N = 110;
int n, col[MAX_N];
struct Edge
{
    int t;
    Edge *nxt;
    Edge() {}
    Edge(int _t, Edge *_n): t(_t), nxt(_n) {}
}EdgePool[MAX_N * MAX_N], *ptr = EdgePool, *head[MAX_N];
inline void AddEdge(const int &u, const int &v)
{
    head[u] = new (ptr++) Edge(v, head[u]);
    head[v] = new (ptr++) Edge(u, head[v]);
}
inline bool GetInt(int &x)
{
    static char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    for (x = 0; c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
    return x;
}
int Q[MAX_N], *front, *back;
void BFS(const int &x, const int &c)
{
    for (*(front = Q) = x, back = front + 1, col[x] = c; front < back; ++front)
        for (Edge *p = head[*front]; p; p = p->nxt)
        {
            if (col[p->t] + col[*front] == 3) continue;
            if (col[p->t] == col[*front]) { puts("-1"); exit(0); }
            col[p->t] = 3 - col[*front];
            *(back++) = p->t;
        }
}
int main()
{
    GetInt(n);
    for (int i = 1, x; i <= n; ++i)
        while (GetInt(x)) AddEdge(i, x);
    for (int i = 1; i <= n; ++i)
        if (!col[i]) BFS(i, 1);
    for (int i = 1; i <= n; ++i) printf("%d", col[i] - 1);
    puts("");
    return 0;
}
