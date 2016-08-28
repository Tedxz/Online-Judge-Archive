/*Ural 1029*/
#include<cstdio>
#include<iostream>
using namespace std;
const int MAX_N=502, MAX_M=102;
int f[MAX_M][MAX_N],a[MAX_M][MAX_N],pre[MAX_M][MAX_N];
int m,n,ans=0x40000000,ed;
int main()
{
    scanf("%d%d",&m,&n);
    for (int i=m; i>=1; --i)
        for (int j=1; j<=n; ++j)
            scanf("%d",&a[i][j]);
    memset(f,0x40,sizeof(f));
    for (int i=1; i<=n; ++i) f[1][i]=a[1][i];
    for (int i=2; i<=m; ++i)
    {
        for (int j=1; j<=n; ++j)
            if (f[i-1][j]<f[i][j-1])
            {
                f[i][j]=a[i][j]+f[i-1][j];
                pre[i][j]=j;
            }
            else
            {
                f[i][j]=a[i][j]+f[i][j-1];
                pre[i][j]=j-1;
            }
        for (int j=n; j>=0; --j)
            if (f[i][j]>a[i][j]+f[i][j+1])
            {
                f[i][j]=a[i][j]+f[i][j+1];
                pre[i][j]=j+1;
            }
    }
    for (int i=1; i<=n; ++i) ans>f[m][i]?ans=f[m][i],ed=i:1;
    printf("%d",ed);
    for (int i=m; pre[i][ed]>0; ed==pre[i][ed]?--i:ed=pre[i][ed])
        printf(" %d",pre[i][ed]);
    return 0;
}
