/*Ural 1457*/
#include<cstdio>
int n,sum,x;
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&x);
        sum+=x;
    }
    printf("%.6llf\n",(double)sum/n);
    return 0;
}
