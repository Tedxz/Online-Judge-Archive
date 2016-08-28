/*Ural 1567*/
#include<cstdio>
#include<cctype>
int main()
{
    int ans=0;
    char ch;
    while(scanf("%c",&ch)!=EOF&&ch!='\n')
    {
        if(isalpha(ch)) ans+=((ch-96)%3==0?3:(ch-96)%3);
        else if(ch==' '||ch=='.') ans++;
        else if(ch==',') ans+=2;
        else if(ch=='!') ans+=3;
    }
    printf("%d",ans);
    return 0;
}
