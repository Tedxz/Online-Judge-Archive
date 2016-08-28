/*Ural 1607*/
#include<cstdio>
#include<algorithm>
using namespace std;
int a,b,c,d;
int main()
{
    scanf("%d%d%d%d",&a,&b,&c,&d);
    for (bool f=1; a<c; f=!f)
        f ? a=min(a+b,c) : c=max(c-d,a);
    printf("%d",a);
    return 0;
}
