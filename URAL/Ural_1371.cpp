/*URal 1371*/
#include<cstdio>
const int MAX_N=50001;
__int64 n;
int e[MAX_N*2],next[MAX_N*2],w[MAX_N*2],head[MAX_N],size[MAX_N];
double ans=0;
inline void add_edge(const int &x,const int &y,const int &z)
{
    static int tot=0;
    e[++tot]=y; w[tot]=z; next[tot]=head[x]; head[x]=tot;
}
void dfs(const unsigned short &k)
{
    size[k]=1;
    for (int p=head[k]; p!=0; p=next[p])
        if (!size[e[p]])
        {
            dfs(e[p]);
            ans+=(__int64)w[p]*size[e[p]]*(n-size[e[p]]);
            size[k]+=size[e[p]];
        }
}
int main()
{
    scanf("%d",&n);
    for (int i=1; i<n; ++i)
    {
        int x,y,z;
        scanf("%d%d%d",&x,&y,&z);
        add_edge(x,y,z);
        add_edge(y,x,z);
    }
    dfs((1+n)/2);
    printf("%.4lf\n",ans/(n*(n-1)/2));
    return 0;
}
