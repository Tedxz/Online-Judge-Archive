/*URAL P1792*/
#include <cstdio>
#include <cstdlib>
int a[7];
inline void print()
{
    for (int i = 0; i < 6; ++i)
    {
        printf("%d ", a[i]);
    }
    printf("%d\n", a[6]);
}
inline bool check()
{
    if (((a[0] + a[1] + a[3]) & 1) != a[6]) return false;
    if (((a[1] + a[2] + a[3]) & 1) != a[4]) return false;
    if (((a[2] + a[0] + a[3]) & 1) != a[5]) return false;
    return true;
}
    
int main()
{
    for (int i = 0; i < 7; ++i)
        scanf("%d", &a[i]);
    if (check()) { print(); return 0; }
    for (int i = 0; i < 7; ++i)
    {
        a[i] = 1 - a[i];
        if (check()) { print(); return 0; }
        a[i] = 1 - a[i];
    }
    
}
