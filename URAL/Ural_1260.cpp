/*Ural 1260*/
#include<cstdio>
const int MAX_N=56;
int n,f[MAX_N];
int main()
{
    scanf("%d",&n);
    f[1]=1; f[2]=1; f[3]=2;
    for (int i=4; i<=n; ++i) f[i]=f[i-1]+f[i-3]+1;
    printf("%d\n",f[n]);
    return 0;
}
