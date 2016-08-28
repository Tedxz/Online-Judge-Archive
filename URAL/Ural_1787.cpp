/*Ural 1787*/
#include<cstdio>
#include<algorithm>
using namespace std;
int n,k,x,sum;
int main()
{
    scanf("%d%d",&k,&n);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&x);
        sum=max(sum+x-k,0);
    }
    printf("%d",sum);
    return 0;
}
