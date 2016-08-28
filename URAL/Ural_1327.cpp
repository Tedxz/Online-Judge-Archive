/*Ural 1327*/
#include<cstdio>
#include<ctime>
int a,b;
int main()
{
    scanf("%d%d",&a,&b);
    printf("%d",((b+1)>>1)-(a>>1));
    while (clock()<970) ;
    return 0;
}
