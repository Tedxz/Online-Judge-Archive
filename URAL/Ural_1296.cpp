/*Ural 1296*/
#include<cstdio>
int a[2],n;
int main()
{
    int min=0,ans=0;
    bool t;
    scanf("%d",&n);
    t=1;
    for (int i=1; i<=n; ++i,t=!t)
    {
        scanf("%d",&a[t]);
        a[t]+=a[!t];
        min>a[t]?min=a[t]:0;
        ans<a[t]-min?ans=a[t]-min:0;
    }
    printf("%d",ans);
    return 0;
}
