/*Ural 1297*/
#include<cstdio>
#include<cstring>
const int MAX_LEN=1001;
char s[MAX_LEN];
int main()
{
    scanf("%s",&s);
    int n=strlen(s),ans=1,j,pos=0;
    for (int i=0; i<n-1; ++i)
    {
        bool flag=true;
        for (j=1; i-j>=0 && i+j<n && s[i-j]==s[i+j]; ++j);
        if (ans<j*2-1) {ans=j*2-1,pos=i-j+1; }
        if (s[i]==s[i+1])
        {
            for (j=1; i-j>=0 && i+j+1<n && s[i-j]==s[i+j+1]; ++j);
            if (ans<j*2) ans=j*2,pos=i-j+1;
        }
        if (ans/2+i>n) break;
    }
    for (int i=pos; i<pos+ans; ++i) printf("%c",s[i]);
    printf("\n");
    return 0;
}
