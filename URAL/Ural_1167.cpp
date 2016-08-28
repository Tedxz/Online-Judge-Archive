/*Ural 1167*/
#include<cstdio>
#include<algorithm>
using namespace std;
const int MAX_N=501;
int n,k,f[MAX_N][MAX_N];
int sum[MAX_N];
inline int sb(int l, int r) { return sum[r]-sum[l-1]; }
inline int sw(int l, int r) { return (r-l+1)-(sum[r]-sum[l-1]); }
int main()
{
    scanf("%d%d",&n,&k);
    for (int i=1; i<=n; ++i) scanf("%d",&sum[i]),sum[i]+=sum[i-1];
    for (int i=0; i<=n; ++i) f[1][i]=sum[i]*(i-sum[i]);
    for (int i=2; i<=n; ++i)
        for (int j=i+1; j<=n; ++j)
        {
            f[i][j]=0x1000000;
            for (int k=i-1; k<j; ++k)
                f[i][j]=min(f[i][j],f[i-1][k]+sw(k+1,j)*sb(k+1,j));
        }
    printf("%d",f[k][n]);
    return 0;
}
