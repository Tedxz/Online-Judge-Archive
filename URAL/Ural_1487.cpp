/*Ural 1487*/
#include<cstdio>
#include<cstdlib>
#include<bitset>
using namespace std;
const int MAX_N=1010, MAX_M=500010;
int head[MAX_N],nxt[MAX_M],n,m,q;
short e[MAX_M];
char ch;
bitset<MAX_N> anc[MAX_N],tem;
bool calced[MAX_N];
inline void add_edge(const int &u, const int &v)
{
    e[++m]=v; nxt[m]=head[u]; head[u]=m;
}
void dfs(const int &x)
{
    if (calced[x]) return;
    anc[x][x]=1;
    for (int p=head[x]; p; p=nxt[p])
    {
        dfs(e[p]);
        anc[x]=anc[x]|anc[e[p]];
    }
    calced[x]=1;
}
inline bool cmp(const int &u, const int &v)
{
    for (int i=1; i<=n; ++i)
        if (anc[u][i]&anc[v][i]) return 1;
    return 0;
}

int main()
{
    scanf("%d",&n);
    for (int i=1; i<=n; ++i)
    {
        scanf(" ");
        for (int j=1; j<=n; ++j)
        {
            scanf("%c",&ch);
            if (ch=='1') add_edge(j,i);
        }
    }
    for (int i=1; i<=n; ++i)
        if (!calced[i]) dfs(i);
    for (int i=1 ; i<=n; ++i) anc[i][i]=0;
    scanf("%d",&q);
    for (int i=0; i<q; ++i)
    {
        int u,v;
        scanf("%d%d",&u,&v);
        printf(cmp(u,v) ? "No\n" : "YES\n");
    }
    return 0;
}
