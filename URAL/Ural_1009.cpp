/*Ural 1009*/
#include<cstdio>
const int MAX_N=12, MAX_K=12;
int f[MAX_N],n,k;
int main()
{
    scanf("%d%d",&n,&k);
    f[1]=k-1,f[2]=f[1]*k;
    --k;
    for (int i=3; i<=n; ++i)
        f[i]=k*(f[i-1]+f[i-2]);
    printf("%d\n",f[n]);
    return 0;
}
