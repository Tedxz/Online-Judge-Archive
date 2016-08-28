/*URAL P1731*/
#include <cstdio>
int n, m;
int main()
{
    scanf("%d%d", &n, &m);
    for (int i = 2; i <= n + 1; ++i)
        printf("%d ", i);
    printf("\n");
    for (int i = 0, j = 1; i < m; ++i, j += n + 1)
        printf("%d ", j);
    return 0;
}
