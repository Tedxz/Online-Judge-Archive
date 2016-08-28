/*Ural 1320*/
#include<cstdio>
#include<iostream>
#include<cstdlib>
using namespace std;
const int MAX_N = 1001;
int Anc[MAX_N], num[MAX_N], x, y;
bool Ans = 1;
inline int Find(const int &x)
{
    if (Anc[x] == Anc[Anc[x]]) return Anc[x];
    return Anc[x] = Find(Anc[x]);
}
inline void Union(int x, int y)
{
    x = Find(x); y = Find(y);
    ++num[x];
    if (x == y) return;
    Anc[y] = x;
    num[x] += num[y];
}
int main()
{
    for (int i = 1; i < MAX_N; ++i) Anc[i] = i;
    while (scanf("%d%d", &x, &y) != EOF)
        Union(x, y);
    for (int i = 1; i < MAX_N; ++i)
        if ((Anc[i] == i) && (1 & num[i])) Ans = 0;
    printf("%d\n", Ans);
    return 0;
} 
