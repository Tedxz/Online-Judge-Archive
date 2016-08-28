/*Ural 1416*/
#include<cstdio>
#include<algorithm>
#include<queue>
using namespace std;
const int MAX_N=501, MAX_M=260000;
int n,m,head[MAX_N],nxt[MAX_M*2],ans1=0,ans2;
short e[MAX_M*2],w[MAX_M*2],f[MAX_N],u[MAX_M];
inline void add_edge(const int &u, const int &v, const int &z)
{
    static int tot=0;
    e[++tot]=v; w[tot]=z; nxt[tot]=head[u]; head[u]=tot;
    e[++tot]=u; w[tot]=z; nxt[tot]=head[v]; head[v]=tot;
}   
inline void make_graph()
{
    int u,v,z;
    for (int i=0; i<m; ++i)
    {
        scanf("%d%d%d",&u,&v,&z);
        add_edge(u,v,z);
    }
}
void PRIM()
{
    bool v[MAX_N];
    priority_queue< pair<int,int> > heap;
    memset(v,0,sizeof(v));
    v[1]=1;
    for (int k=head[1]; k!=0; k=nxt[k]) heap.push(make_pair(-w[k],k));
    for (int i=2; i<=n; ++i)
    {
        while(/*!heap.empty() && */v[e[heap.top().second]]) heap.pop();
        //if (heap.empty()) { ans1=-1; return; }  //Á¬Í¨Í¼ 
        u[(heap.top().second-1)>>1]=1;
        ans1-=heap.top().first;
        v[e[heap.top().second]]=1;
        for (int k=head[e[heap.top().second]]; k!=0; k=nxt[k])
            if (!v[e[k]]) heap.push(make_pair(-w[k],k));
    }
}
void dfs(const int &x, int maxe)
{
    if (maxe<=f[x]) return;
    f[x]=maxe;
    for (int k=head[x]; k!=0; k=nxt[k])
        if (u[(k-1)>>1]) 
        {
            u[(k-1)>>1]=0;
            dfs(e[k],max(maxe,(int)w[k]));
            u[(k-1)>>1]=1;
        }
}
void SMST()
{
    if (ans1==-1 || m==n-1) { ans2=-1; return; }
        else ans2=0x10000000;
    for (int i=1; i<=n; ++i)
    {
        fill(f,f+n+1,0xC000);
        dfs(i,0);
        for (int k=head[i]; k!=0; k=nxt[k])
            if (!u[(k-1)>>1] && ans2>w[k]-f[e[k]]) ans2=w[k]-f[e[k]];
        if (!ans2) { ans2=ans1; return; }
    }
    ans2+=ans1;
}
int main()
{
    scanf("%d%d",&n,&m);
    make_graph();
    PRIM();
    printf("Cost: %d\n",ans1);
    SMST();
    printf("Cost: %d\n",ans2);
    return 0;
}
