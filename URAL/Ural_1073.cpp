/*Ural 1073*/
#include<cstdio>
#include<cmath>
#define sqrt(x) (int)sqrt((double)(x))
const int MAX_N=60001;
int n,f[MAX_N];
int main()
{
    scanf("%d",&n);
    f[0]=0;
    for (int i=1; i<=n; ++i)
    {
        f[i]=0x1000;
        for (int j=1; j*j<=i; ++j)
            f[i]>f[i-j*j]+1?f[i]=f[i-j*j]+1:0;
    }
    printf("%d\n",f[n]);
    return 0;
}
