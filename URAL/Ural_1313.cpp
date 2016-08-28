/*Ural 1313*/
#include<cstdio>
const int MAX_N=101;
int n,a[MAX_N][MAX_N];
int min(int a, int b) {return a<b?a:b; }
int main()
{
    scanf("%d",&n);
    for (int i=1; i<=n; ++i)
        for (int j=1; j<=n; ++j) scanf("%d",&a[i][j]);
    for (int i=2; i<=n+1; ++i)
        for (int j=1; j<i; ++j) printf("%d ",a[i-j][j]);
    for (int i=n+2; i<=n*2; ++i)
        for (int j=1+i-n-1; j<n+1; ++j) printf("%d ",a[i-j][j]);
    return 0;
}
