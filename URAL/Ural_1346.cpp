/*Ural 1346*/
#include<cstdio>
int a[2],l,r,ans=1;
short stat=0;
bool t=1;
int main()
{
    scanf("%d%d",&l,&r);
    scanf("%d",&a[0]);
    for (int i=1; i<=r-l; ++i,t=!t)
    {
        scanf("%d",&a[t]);
        if (stat==0)
        {
            if (a[t]>a[!t]) stat=1;
            if (a[t]<a[!t]) stat=2;
            continue;
        }
        if (stat==1)
        {
            if (a[t]<a[!t])
            {
                ++ans;
                stat=0;
            }
        }
        else 
        {
            if (a[t]>a[!t])
            {
                ++ans;
                stat=0;
            }
        }
    }
    printf("%d",ans);
    return 0;
}
