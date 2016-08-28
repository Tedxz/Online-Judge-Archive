/*PKU 1273*/
#include<cstdio>
#include<cstring>
const int MAX_N=200,MAX_M=200;
int n,m;
int head[MAX_N],next[MAX_M*2],c[MAX_M*2],a[MAX_M*2],tot;
void add_edge(int x, int y, int c1, int c2)
{
    a[++tot]=y; c[tot]=c1; next[tot]=head[x]; head[x]=tot;
    a[++tot]=x; c[tot]=c2; next[tot]=head[y]; head[y]=tot;
}   
void init()
{
    
    int x,y,z;
    memset(head,0,sizeof(head));
    tot=0;
    for (int i=0; i<m; ++i)
    {
        scanf("%d%d%d",&x,&y,&z);
        add_edge(x,y,z,0);
    }
}
inline int op(int k)
{
    return (1 & k)?k+1:k-1;
}
int sap()
{
    int pre[MAX_N],back[MAX_N],gap[MAX_N]={0},cur[MAX_N],dis[MAX_N]={0};
    int flow_now=0x10000000,max_flow=0,i=1;
    bool flag;
    int min;
    for (int j=0; j<n; ++j) cur[j]=head[j];
    gap[0]=n;
    //printf("%d %d ",dis[1],n);
    while (dis[1]<n)
    {
        flag=0;
        back[i]=flow_now;
        for (int k=cur[i]; k!=0; k=next[k])
        {
            if (dis[a[k]]+1==dis[i] && c[k]>0)
            {
                flag=1;
                if (flow_now>c[k]) flow_now=c[k];
                cur[i]=k;
                i=a[k];
                pre[i]=k;
                if (i==n)
                {
                    max_flow+=flow_now;
                    for (; i!=1; i=a[op(pre[i])])
                    {
                        c[pre[i]]-=flow_now;
                        c[op(pre[i])]+=flow_now;
                    }
                    flow_now=0x10000000;
                }
                break;
            }
        }
        if (flag) continue;
        min=n;
        for (int k=head[i]; k!=0; k=next[k])
        {
            if (dis[a[k]]<min && c[k]>0)
            {
                min=dis[a[k]];
                cur[i]=k;
            }
        }
        gap[dis[i]]--;
        if (gap[dis[i]]==0) break;
        dis[i]=min+1;
        gap[dis[i]]++;
        if (i!=1)
        {
            i=a[op(pre[i])];
            flow_now=back[i];
        }
    }
    return max_flow;
}
    
int main()
{
    while (scanf("%d%d",&m,&n)!=EOF)
    {
        init();
        printf("%d\n",sap());
    }
    return 0;
}
        
    
