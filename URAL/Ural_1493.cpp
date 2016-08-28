/*Ural 1493*/
#include<cstdio>
int c(int x)
{
    int v[6];
    int l=6;
    while(l)
    {
        l-=1;
        v[l]=x%10;
        x/=10;
    }
    int t1,t2;
    t1=v[0]+v[1]+v[2];
    t2=v[3]+v[4]+v[5];
    return t1==t2;
}
int main()
{
    int n;
    scanf("%d",&n);
    if(c(n-1)||c(n)||c(n+1))
        printf("Yes");
    else
        printf("No");
    return 0;
}
