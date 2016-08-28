/*Ural 1225*/
#include<cstdio>
const int MAX_N=47;
int n;
long long f[MAX_N][2];
int main()
{
    scanf("%d",&n);
    f[1][0]=1; f[1][1]=1;
    for (int i=2; i<=n; ++i)
    {
        f[i][0]=f[i-1][1]+f[i-2][1];
        f[i][1]=f[i-1][0]+f[i-2][0];
    }
    printf("%lld\n",f[n][0]+f[n][1]);
    return 0;
}
