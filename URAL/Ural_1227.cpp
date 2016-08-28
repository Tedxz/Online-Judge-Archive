/*Ural 1227*/
#include <iostream>
using namespace std;
int n,m,s,map[101][101]={0},f[101]={0},g[101]={0};
bool used[101]={false};
inline void success()
{
    printf("YES\n");
    exit(0);
}
inline void dfs(int x,int fa)
{
    if (used[x]) success();
    used[x]=true;
    for (int i=1;i<=n;++i)
        if (map[x][i] && (i != fa))
        {
            dfs(i,x);
            if (f[i]+map[x][i]>f[x])
            {
                g[x]=f[x];
                f[x]=f[i]+map[x][i];
            }
            else if (f[i]+map[x][i]>g[x])
                g[x]=f[i]+map[x][i];
        }
}
int main()
{
    int a,b,c;
    scanf("%d%d%d",&n,&m,&s);
    for (int i=1;i<=m;++i)
    {
        scanf("%d%d%d",&a,&b,&c);
        if ((a==b) || map[a][b]) success();
        map[a][b]=map[b][a]=c;
    }
    for (int i=1;i<=n;++i)
        if (!used[i])
            dfs(i,0);
    for (int i=1;i<=n;++i)
        if (f[i]+g[i] >= s)
            success();
    printf("NO\n");
    return 0;
}
