/*Ural 1692*/
#include<cstdio>
#include<cmath>
#include<iostream>
using namespace std;
const int MAX_ANS=47;
int n,ans;
int sol[MAX_ANS][MAX_ANS];
int main()
{
    scanf("%d",&n);
    ans=(int)(sqrt((double)1+8*n)/2-0.5)+1;
    n=(ans*(ans-1))>>1;
    printf("%d\n",ans--);
    for (int i=1; i<=ans; ++i) 
    {
        for (int j=1; j<=i; ++j)
            sol[j][i]=i*(i-1)/2+j;
        for (int j=1; j<=i; ++j)
            sol[i+1][j]=i*(i-1)/2+j;
    }
    for (int i=ans+1; i>0; --i)
    {
        printf("%d",ans);
        for (int j=ans; j>0; --j)
            printf(" %d",sol[i][j]);
        printf("\n");
    }
    return 0;
}
