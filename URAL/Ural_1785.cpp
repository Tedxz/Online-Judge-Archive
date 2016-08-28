/*Ural 1785*/
#include<cstdio>
int n;
int main()
{
    scanf("%d",&n);
    if (n<=4) { printf("few"); return 0; }
    if (n<=9) { printf("several"); return 0; }
    if (n<=19) { printf("pack"); return 0; }
    if (n<=49) { printf("lots"); return 0; }
    if (n<=99) { printf("horde"); return 0; }
    if (n<=249) { printf("throng"); return 0; }
    if (n<=499) { printf("swarm"); return 0; }
    if (n<=999) { printf("zounds"); return 0; }
    printf("legion");
    return 0;
}
