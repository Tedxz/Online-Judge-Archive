/*URAL P1209*/
#include <cstdio>
unsigned int n, x;
inline void calc(unsigned int x)
{
    unsigned int l = 0, r = 93000;
    --x;
    for (long long mid = (r + l) >> 1; l < r - 1; mid = (r + l) >> 1)
    {
        if (mid * (mid + 1) / 2 > x) r = mid;
        else l = mid;
    }
    printf("%d ", (l * (l + 1) >> 1) == x);
}
int main()
{
    scanf("%ud", &n);
    while (n--)
    {
        scanf("%ud", &x);
        calc(x);
    }
    return 0;
}
