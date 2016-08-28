/*Ural 1040*/
#include<cstdio>
const int MAX_N=51, MAX_M=5100;
int n,m;
int head[MAX_N];
int ans[MAX_M];
struct edge
{
    int a,next,num;
}e[MAX_M];
inline void add_edge(const int &num, const int &u, const int &v)
{
    static int tot=0;
    e[++tot].a=v; e[tot].num=num; e[tot].next=head[u]; head[u]=tot; 
    e[++tot].a=u; e[tot].num=num; e[tot].next=head[v]; head[v]=tot; 
}
void dfs(const int &k)
{
    static int dfn=0;
    for (int p=head[k]; p; p=e[p].next)
        if (!ans[e[p].num])
        {
            ans[e[p].num]=++dfn;
            dfs(e[p].a);
        }
}
int main()
{
    scanf("%d%d",&n,&m);
    for (int i=1; i<=m; ++i)
    {
        int u,v;
        scanf("%d%d",&u,&v);
        add_edge(i,u,v);
    }
    dfs(1);
    printf("YES\n");
    for (int i=1; i<=m; ++i) printf("%d ",ans[i]);
    return 0;
}
