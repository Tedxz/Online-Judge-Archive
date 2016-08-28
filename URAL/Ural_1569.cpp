/*Ural 1569*/
#include<cstdio>
#include<bitset>
#include<queue>
#include<algorithm>
using namespace std;
const int MAX_N=110, MAX_M=10010;
struct edge
{
    int a,next;
};
int n,m,ans=0X10000000;
int head[MAX_N];
edge e[MAX_M*2];
bitset<MAX_M> tem,sol;
inline void add_edge(const int &u, const int &v)
{
    static int tot=0;
    e[++tot].a=v; e[tot].next=head[u]; head[u]=tot;
    e[++tot].a=u; e[tot].next=head[v]; head[v]=tot;
}
inline void Dijkstra(const int &R)
{
    static int dis[MAX_N]={0X10000000};
    static priority_queue<pair<int,int> > heap;
    int max_dis=0;
    tem.reset();
    fill(dis,dis+n+1,0x10000000); dis[R]=0;
    heap.push(make_pair(0,R));
    for (int i=1; i<n; ++i)
    {
        pair<int,int> now;
        while (heap.top().first!=dis[heap.top().second]) heap.pop();
        now=heap.top(); heap.pop();
        for (int p=head[now.second]; p; p=e[p].next)
        {
            if (dis[e[p].a]>dis[now.second]+1) 
            {
                dis[e[p].a]=dis[now.second]+1;
                tem[(p+1)>>1]=1;
                heap.push(make_pair(-dis[e[p].a],e[p].a));
                max_dis=max(max_dis,dis[e[p].a]);
            }
        }
    }
    if (max_dis<ans)
    {
        ans=max_dis;
        sol=tem;
    }
}
    
    
int main()
{
    scanf("%d%d",&n,&m);
    for (int i=1; i<=m; ++i)
    {
        int u,v;
        scanf("%d%d",&u,&v);
        add_edge(u,v);
    }
    for (int i=1; i<=n; ++i)
        Dijkstra(i);
    for (int i=1; i<=m; ++i)
        if (sol[i]) printf("%d %d\n",e[i<<1].a,e[(i<<1)-1].a);
    while(9);
    return 0;
}
    
