/*URAL P1796*/
#include <cstdio>
const int note[6] = {10, 50, 100, 500, 1000, 5000};
int n, minn = 0, sum, l, r, x;
int main()
{
    for (int i = 0; i < 6; ++i)
    {
        scanf("%d", &x);
        sum += x * note[i];
        if (!minn && x) minn = note[i];
    }
    scanf("%d", &n);
    r = sum / n;
    l = (sum - minn) / n;
    printf("%d\n", r - l);
    for (++l; l <= r; ++l)
        printf("%d ", l);
    return 0;
}
