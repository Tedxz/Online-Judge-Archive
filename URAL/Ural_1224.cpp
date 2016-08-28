/*Ural 1224*/
#include<cstdio>
__int64 min(int a, int b) { return a<b?a:b; }
int main()
{
    int n,m;
    __int64 ans;
    scanf("%d%d",&n,&m);
    ans=(min(n,m)<<1)-2;
    m<n?++ans:0;
    printf("%I64d",ans);
    return 0;
}
