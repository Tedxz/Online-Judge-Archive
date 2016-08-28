/*URAL P1723*/
#include <cstdio>
#include <cstring>
char s[50];
int a[26], m, k;
int main()
{
    gets(s);
    for (int i = strlen(s) - 1; i >= 0; --i)
        ++a[s[i] - 'a'];
    for (int i = 0; i < 26; ++i)
        if (a[i] > m) m = a[i], k = i;
    printf("%c\n", k + 'a');
    return 0;
}
