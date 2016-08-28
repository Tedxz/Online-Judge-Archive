/*
USER: Xie Zheng
TASK: bigmac
LANG: C++
*/
/*USACO Elite 2010 December Competition Gold*/
#include<iostream>
#include<cstdio>
#include<memory.h>
using namespace std;
const int MAX_N=2010,MAX_M=25010;
const long double INF=1.7e40;
class edge
{
    public:
        int a,next;
        float w;
};
        
int n,m,start,target,x,y;
long double val;
edge e[MAX_M];
int head[MAX_N];
int q[2049],h,t;
long double dis[MAX_N];
bool v[MAX_N];
void SPFA()
{
    for (int i=0; i<=n; ++i) dis[i]=INF*2;
    //cout<<dis[2];
    memset(v,0,sizeof(v));
    dis[start]=1;
    h=0; t=1; q[t]=start;
    while (h!=t)
    {
        h=(h+1) & 2047;
        v[q[h]]=false;
        for (int k=head[q[h]]; k!=0; k=e[k].next)
        {
            if (dis[e[k].a]>dis[q[h]]*e[k].w)
            {
                dis[e[k].a]=dis[q[h]]*e[k].w;
                if (!v[e[k].a])
                {
                    t=(t+1) & 2047;
                    q[t]=e[k].a;
                    v[q[t]]=1;
                }
            }
        }
    }
}
    
    
int main()
{
    freopen("bigmac.in","r",stdin);
    freopen("bigmac.out","w",stdout);
    memset(head,0,sizeof(head));
    scanf("%d%d%lf%d%d",&n,&m,&val,&start,&target);
    for (int i=1; i<=m; ++i)
    {
        scanf("%d%d%f",&x,&e[i].a,&e[i].w);
        e[i].next=head[x]; head[x]=i;
    }
    SPFA();
    val*=dis[target];
    if (dis[target]>INF) printf("0\n");
    else printf("%lf\n",val);
    return 0;
}
