/*Ural 1081*/
//Dynamic Programming
#include<cstdio>
#include<iostream>
#include<cstring>
using namespace std;
const int MAX_N=46;
int n,k,f[MAX_N];
int main()
{
    scanf("%d%d",&n,&k);
    f[0]=1; f[1]=2;
    for (int i=2; i<=n; ++i) f[i]=f[i-1]+f[i-2];
    if (f[n]<k) 
    {
        printf("-1");
        return 0;
    }
    for (int i=n; i>0; --i)
    {
        if (f[i-1]>=k) printf("0");
        else printf("1"),k-=f[i-1];
    }
    printf("\n");
    return 0;
}
    
