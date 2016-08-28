/*URAL P1709*/
#include <cstdio>
#include <cstring>
const int MAX_N = 102;
int n;
long long d, a, Ans;
int Anc[MAX_N];
char A[MAX_N][MAX_N], s[MAX_N];
inline int Find(const int &x)
{
    if (Anc[x] == Anc[Anc[x]]) return Anc[x];
    return Anc[x] = Find(Anc[x]);
}
inline void Union(int x, int y)
{
    Anc[Find(y)] = Find(x);
}
int main()
{
    memset(A, '0', sizeof A);
    scanf("%d\n%lld%lld", &n, &d, &a);
    for (int i = 1; i <= n; ++i) Anc[i] = i;
    for (int i = 1; i <= n; ++i)
    {
        gets(s);//printf("jiong");
        for (int j = 1; j < i; ++j)
            if (getchar() != '0')
            {
                if (Find(i) == Find(j))
                    Ans += d, A[i][j] = A[j][i] = 'd';
                else 
                    Union(i, j);
            }
    }
    for (int i = 1; i <= n; ++i)
        if (Anc[i] == i && i != Find(1))
            Ans += a, A[i][Find(1)] = A[Find(1)][i] = 'a';
    printf("%lld\n", Ans);
    for (int i = 1; i <= n; ++i)
    {
        for (int j = 1; j <= n; ++j)
            putchar(A[i][j]);
        puts("");
    }
    return 0;
}
