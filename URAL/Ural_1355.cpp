/*Ural 1355*/
#include<cstdio>
int a,b,t;
inline void calc(const int &x, int &y)
{
    static int ans;
    if (y%x) { printf("0\n"); return; }
    ans=1;
    y/=x;
    while (!(1&y)) y>>=1,++ans;
    for (int i=3; y>=i*i; i+=2)
        while (!(y%i)) ++ans, y/=i;
    printf("%d\n", ans+(b>1));
}
int main()
{
   scanf("%d", &t);
   while (t--)
   {
        scanf("%d%d", &a, &b);
        calc(a,b);
    }
    return 0;
}
