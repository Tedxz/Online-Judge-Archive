//TYVJ P1387
#include<cstdio>
using namespace std;
const int MAX_N=50010,MAX_C=3;
int sum[MAX_N],f[MAX_N][MAX_C+1],n,m;
int main()
{
    scanf("%d\n",&n);
    for (int i=1; i<=n; ++i) {scanf("%d",&sum[i]); sum[i]+=sum[i-1];}
    scanf("%d",&m);
    for (int i=m; i<=n; ++i)
        for (int j=1; j<=MAX_C; ++j)
            f[i][j]=((f[i-m][j-1]+sum[i]-sum[i-m])>f[i-1][j]?(f[i-m][j-1]+sum[i]-sum[i-m]):f[i-1][j]);
    printf("%d\n",f[n][3]);
    return 0;
}
