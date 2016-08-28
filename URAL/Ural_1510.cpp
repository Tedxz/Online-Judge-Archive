/*URAL P1510*/
#include <cstdio>
#include <cstdlib>
#include <ctime>
const int MAX_N = 500010;
int n, a[MAX_N];
inline void calc(int L, int R)
{
    int x, c, i, j;
    while (L < R)
    {
        i = L, j = R;
        x = a[rand()%(R - L + 1) + L];
        while (i <= j)
        {
            while (a[i] < x) ++i;
            while (x < a[j]) --j;
            if (i <= j)
            {
                c = a[i]; a[i] = a[j]; a[j] = c;
                ++i; --j;
            }
        }
        if ((i > (n - 1) >> 1) && (j < (n - 1) >> 1)) return;
        if (i <= (n - 1) >> 1) L = i;
        else R = j;
    }
}        
int main()
{
    scanf("%d", &n);
    for (int i = 0; i < n; ++i)
        scanf("%d", &a[i]);
    srand(time(0));
    calc(0, n - 1);
    printf("%d\n", a[(n - 1) >> 1]);
    return 0;
}  
