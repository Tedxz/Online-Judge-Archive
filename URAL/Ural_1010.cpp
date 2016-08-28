/*Ural 1010*/
#include<cstdio>
#include<iostream>
using namespace std;
int n,ans;
__int64 a,b,tem;
int main()
{
    scanf("%d%I64d",&n,&b);
    tem=0;
    for (int i=2; i<=n; ++i)
    {
        a=b;
        scanf("%I64d",&b);
        abs(a-b)>tem?ans=i,tem=abs(a-b):0;
    }
    printf("%d %d\n",ans-1,ans);
    return 0;
}
        
