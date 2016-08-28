/*Ural 1471*/
#include<cstdio>
#include<cstring>
const int MAX_N=50001;
int n,m,head[MAX_N],fa[MAX_N],w[MAX_N],x,y,t,lca,tot=0,ans;
int list[MAX_N*2],pre[MAX_N],suc[MAX_N];
struct edge { int a,next,w; } e[MAX_N*2];
inline void swap(int &x, int &y) { int t=x; x=y; y=t; }
inline void add_edge(int x, int y, int t)
{
    e[++tot].a=y; e[tot].w=t; e[tot].next=head[x]; head[x]=tot;
}
void dfs(int k, int weight)
{
    list[++tot]=k; pre[k]=tot;
    w[k]=weight;
    for (int p=head[k]; p!=0; p=e[p].next)
        pre[e[p].a]?fa[k]=e[p].a:(dfs(e[p].a,e[p].w),0);
    e[head[k]].next?list[++tot]=k:0;
    suc[k]=tot;
}
int main()
{
    scanf("%d",&n);
    memset(head,0,sizeof(head));
    for (tot=0; tot<n*2-2; )
    {
        scanf("%d%d%d",&x,&y,&t);
        add_edge(x,y,t);
        add_edge(y,x,t);
    }
    tot=0;
    dfs(0,0);
    scanf("%d",&m);
    for (int i=0; i<m; ++i)
    {
        scanf("%d%d",&x,&y);
        pre[x]<pre[y]?0:(swap(x,y),0);
        lca=x;
        while (suc[lca]<suc[y]) lca=fa[lca];
        ans=0;
        for (; x!=lca; x=fa[x]) 
        ans+=w[x];
        for (; y!=lca; y=fa[y]) 
        ans+=w[y];
        printf("%d\n",ans);
    }
    return 0;
}
