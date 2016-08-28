/*PKU 1459*/
#include<cstdio>
#include<cstring>
const int MAX_N=120,MAX_M=35000,S=118,T=119;
int n,np,nc,m,ans,head[MAX_N],e[MAX_M],next[MAX_M],c[MAX_M];
int u,v,z,tot;
inline int op(const int &k) { return (1&k)?k+1:k-1; }
inline void add_edge(const int &u, const int &v, const int &z)
{
    e[++tot]=v; c[tot]=z; next[tot]=head[u]; head[u]=tot;
}
inline void make_graph()
{
    
    tot=0;
    memset(head,0,sizeof(head));
    for (int i=0; i<m; ++i)
    {
        scanf(" (%d,%d)%d",&u,&v,&z);
        //printf("[%d,%d]%d ",u,v,z);
        if (u==v) continue;
        add_edge(u,v,z);
        add_edge(v,u,0);
    }
    for (int i=0; i<np; ++i)
    {
        scanf(" (%d)%d",&u,&z);
        //printf("[%d]%d ",u,z);
        add_edge(S,u,z);
        add_edge(u,S,0);
    }
    for (int i=0; i<nc; ++i)
    {
        scanf(" (%d)%d",&u,&z);
        //printf("[%d]%d ",u,z);
        add_edge(u,T,z);
        add_edge(T,u,0);
    }
}
inline void SAP()
{
    int back[MAX_N],dis[MAX_N],cur[MAX_N],gap[MAX_N],pre[MAX_N];
    int flow_now,i;
    bool flag;
    ans=0; i=S;
    memset(gap,0,sizeof(gap));
    memset(dis,0,sizeof(dis));
    for (int i=0; i<MAX_N; ++i) cur[i]=head[i];
    gap[0]=n+2;
    flow_now=0x10000000;
    while(dis[S]<n+2)
    {
        flag=0;
        back[i]=flow_now;
        for (int k=cur[i]; k!=0; k=next[k])
            if (dis[e[k]]+1==dis[i] && c[k]>0)
            {
                flag=1;
                flow_now>c[k]?flow_now=c[k]:0;
                cur[i]=k;
                i=e[k];
                pre[i]=k;
                if (i==T)
                {
                    ans+=flow_now;
                    for (; i!=S; i=e[op(pre[i])]) 
                    {
                        c[pre[i]]-=flow_now;
                        c[op(pre[i])]+=flow_now;
                    }
                    flow_now=0x10000000;
                }
                break;
            }
        if (flag) continue;
        int min=MAX_N;
        for (int k=head[i]; k!=0; k=next[k])
            if (dis[e[k]]<min && c[k])
            {
                min=dis[e[k]];
                cur[i]=k;
            }
        --gap[dis[i]];
        dis[i]=min+1;
        ++gap[dis[i]];
        if (i!=S) { i=e[op(pre[i])]; flow_now=back[i]; }
    }
}
int main()
{
    while(scanf("%d%d%d%d",&n,&np,&nc,&m)!=EOF)
    {
        make_graph();
        SAP();
        printf("%d\n",ans);
    }
    return 0;
}
