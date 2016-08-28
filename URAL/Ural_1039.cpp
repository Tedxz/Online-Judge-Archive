/*Ural 1039*/
#include<cstdio>
#include<cstring>
const int MAX_N=6002;
inline int max(int a, int b) { return a>b?a:b; }
int n,x,y,f[MAX_N][2],lc[MAX_N],rc[MAX_N];
bool r[MAX_N];
short c[MAX_N];
void dfs(int k, bool x)
{
    if (!k || f[k][x]) return;
    dfs(rc[k],x); dfs(lc[k],1); dfs(lc[k],0);
    if (x) f[k][1]=max(f[rc[k]][1]+f[lc[k]][1],f[rc[k]][1]+f[lc[k]][0]+c[k]);
    else f[k][0]=f[rc[k]][0]+f[lc[k]][1];
}
int main()
{
    scanf("%d",&n);
    for (short i=1; i<=n; ++i) scanf("%hd",&c[i]);
    for (short i=1; i<=n; ++i) c[i]<0?c[i]=0:0;
    scanf("%d%d",&x,&y);
    while (x || y)
    {
        rc[x]=lc[y];
        lc[y]=x;
        r[x]=1;
        scanf("%d%d",&x,&y);
    }
    c[n+1]=-1000;
    for (short i=1; i<=n; ++i)
        if (!r[i]) { rc[i]=lc[n+1]; lc[n+1]=i; }
    dfs(n+1,0);
    printf("%d",f[n+1][0]);
    return 0;
}
