/*Ural 1354*/
#include<cstdio>
#include<cstdlib>
#include<cstring>
const int MAX_LEN=10010;
int i,j,l,next[MAX_LEN];
char s[MAX_LEN];
int main()
{
    scanf("%s",s+1);
    printf("%s",s+1);
    l=strlen(s+1);
    next[l]=l+1;
    i=l,j=l+1;
    while (i>1)
        if ((j > l) || (s[i] == s[j]))
        {
            --i,--j;
            if (s[i] == s[j])  next[i]=next[j];
            else  next[i]=j;
        }
        else j=next[j];
    i=2,j=l;
    while (i<=l)
        if ((j>l) || (s[i]==s[j])) ++i,--j;
        else j=next[j];
    for (; j; --j)  printf("%c",s[j]);
    printf("\n");
    return 0;
}
