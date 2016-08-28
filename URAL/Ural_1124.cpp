/*Ural 1124*/
#include<cstdio>
#include<algorithm>
using namespace std;
const int MAX_N=501, MAX_M=250001;
int n,m,num,cnt,x;
int e[MAX_M],nxt[MAX_M],head[MAX_N];
int stack[MAX_N],back;
bool vis[MAX_N],ins[MAX_N];
inline void add_edge(int x, int y)
{
    e[++num]=y; nxt[num]=head[x]; head[x]=num;
}
void dfs(int k)
{
    vis[k]=1;
    for (int p=head[k]; p; p=nxt[p])
        if (!vis[e[p]]) dfs(e[p]);
}
int main()
{
    scanf("%d%d",&m,&n);
    for (int i=1; i<=m; ++i)
        for (int j=0; j<n; ++j)
        {
            scanf("%d",&x);
            if (i!=x) add_edge(i,x);
        }
    for (int i=1; i<=m; ++i)
    {
        if (!vis[i] && head[i]) ++cnt,dfs(i);
    }
    printf("%d\n",max(num+cnt-1,0));
    return 0;
}
