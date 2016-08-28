/*Ural 1210*/
#include<cstdio> 
#include<algorithm>
using namespace std;
const int MAX_N=31;
int n,k,f[MAX_N][MAX_N],ans=0x10000000,w,t;
int main()
{
    scanf("%d",&n);
    for (int i=1; i<=n; ++i)
    {
        scanf("%d",&k);
        for (int j=1; j<=k; ++j)
        {
            f[i][j]=0x10000000;
            scanf("%d",&t);
            while(t)
            {
                scanf("%d",&w);
                f[i][j]=min(f[i][j],f[i-1][t]+w);
                scanf("%d",&t);
            }
            if (i==n) ans=min(ans,f[i][j]);
        }
        if (i!=n) scanf(" *");
    }
    printf("%d",ans);
    return 0;
}
