/*Ural 1326*/
#include<cstdio>
#include<iostream>
using namespace std;
typedef int set_of_item;
const int MAX_N=20, MAX_M=102, INF=0x10000000;
int n,m,x,t,ans=INF;
int f[1<<MAX_N];
int price[MAX_M+MAX_N];
set_of_item set[MAX_N+MAX_M]={0},need=0;
int main()
{
    scanf("%d%d",&n,&price[1]);
    set[1]=1;
    for (int i=2; i<=n; ++i)
    {
        scanf("%d",&price[i]);
        set[i]=set[i-1]<<1;
    }
    scanf("%d",&m);
    for (int i=n+1; i<=n+m; ++i)
    {
        scanf("%d%d",&price[i],&x);
        for (int j=0; j<x; ++j)
        {
            scanf("%d",&t);
            set[i]|=set[t];
        }
    }
    scanf("%d",&x);
    for (int i=0;i<x; ++i)
    {
        scanf("%d",&t);
        need|=set[t];
    }
    int lim=1<<n;
    fill(f+1,f+lim,INF);
    for (set_of_item i=0; i<lim; ++i)
    {
        for (int j=1; j<=n+m; ++j)
        {
            f[i|set[j]]>f[i]+price[j]?f[i|set[j]]=f[i]+price[j]:0;
        }
        (need|i)==i && ans>f[i]?ans=f[i]:0;
    }
    printf("%d",ans);
    return 0;
}
        
        
        
        
        

