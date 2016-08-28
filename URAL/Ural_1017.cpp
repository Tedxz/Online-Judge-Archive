/*Ural 1017*/
//Dynamic Programming
#include<cstdio>
#include<iostream>
#include<algorithm>
using namespace std;
const int MAX_N=510;
int n;
long long f[MAX_N];
int main()
{
    scanf("%d",&n);
    f[0]=1;
    for (int i=1; i<=n; ++i)
        for (int j=n; j>=i; --j)
            f[j]+=f[j-i];
    printf("%lld",f[n]-1);
    return 0;
}
