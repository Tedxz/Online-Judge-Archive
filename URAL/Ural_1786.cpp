/*URAL P1786*/
#include <cstdio>
#include <cctype>
#include <cstring>
const char T[] = "Sandro";
const int MAX_N = 205;
char s[MAX_N];
int cost, Ans = 0X10000000;
inline int f(char a, char b)
{
    int res = 0;
    if (isupper(a) + isupper(b) == 1) res += 5;
    if (toupper(a) != toupper(b)) res += 5;
    return res;
}
int main()
{
    scanf("%s", &s);
    for (int i = strlen(s) - 6; i >= 0; --i)
    {
        cost = 0;
        for (int j = 0; j < 6; ++j)
        {
            cost += f(s[i + j], T[j]);
        }
        if (cost < Ans) Ans = cost;
    }
    printf("%d\n", Ans);
    return 0;
}   
