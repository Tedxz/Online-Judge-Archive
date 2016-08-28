/*Ural 1228*/
#include<cstdio>
int n,a,b;
int main()
{
    scanf("%d%d",&n,&a);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&b);
        printf("%d ",(int)(a/b)-1);
        a=b;
    }
    return 0;
}
