/*Ural 1243*/
#include<cstdio>
int main()
{
    char ch;
    short t=0;
    while(scanf("%c",&ch) && ch!='\n')
    {
        t=(t*10+ch-48)%7;
    }
    printf("%d",t);
    return 0;
}
        
