/*Ural 1194*/
#include<cstdio>
int n,k;
int main()
{
    scanf("%d%d",&n,&k);
    printf("%d",n*(n-1)/2-k);
    return 0;
}
