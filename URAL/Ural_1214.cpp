/*Ural 1214*/
#include <cstdio>
int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    if(a<0||b<0) printf("%d %d\n",a,b);
    else
        if((a%2)^(b%2)) printf("%d %d\n",b,a);
        else printf("%d %d\n",a,b);
    return 0;
}
