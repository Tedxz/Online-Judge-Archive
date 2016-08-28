/*Ural 1636*/
#include<cstdio>
int a,b,x;
int main()
{
    scanf("%d%d",&a,&b);
    for (int i=0; i<10; ++i)
    {
        scanf("%d",&x);
        a+=x*20;
    }
    a>b?printf("Dirty debug :("):printf("No chance.");
    return 0;
}
