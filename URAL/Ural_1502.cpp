/*Ural 1502*/
#include<cstdio>
__int64 n;
int main()
{
    scanf("%I64d", &n);
    printf("%I64d\n", (n+2)*(n+1)*n>>1);
    return 0;
}
