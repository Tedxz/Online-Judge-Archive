/*Ural 1202*/
#include<cstdio>
int n,ans=0;
int main()
{
    int l,r,u,d,pl,pr,pu,pd,h;
    scanf("%d%d%d%d%d",&n,&l,&d,&r,&u);
    ++d; --u;
    h=1;
    for (int i=1; i<n; ++i)
    {
        pl=l; pr=r; pu=u; pd=d;
        scanf("%d%d%d%d",&l,&d,&r,&u);
        ++d; --u;
        if (u<pd || d>pu) 
        {
            printf("-1\n");
            return 0;
        }
        if (h<d) ans+=(d-h),h=d;
        if (h>u) ans+=(h-u),h=u;
    }
    ans+=(r-2)+(u-h);
    printf("%d\n",ans);
    return 0;
}
            
        
