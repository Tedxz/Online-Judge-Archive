/*URAL P1638*/
#include <cstdio>
int a, b, c, d;
int main()
{
    scanf("%d%d%d%d", &a, &b, &c, &d);
    if (c < d)
        printf("%d\n", (d - c - 1) * (a + b + b) + b * 2);
    else
        if( c > d )
            printf("%d\n", (c - d) * (a + b + b) + a);
        else
            printf("%d\n", a);
    return 0;
}
