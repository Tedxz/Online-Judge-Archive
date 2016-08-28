/*Ural 1820*/
#include<cstdio>
#include<algorithm>
#include<cmath>
using namespace std;
int n,k;
int main()
{
    scanf("%d%d",&n,&k);
    printf("%d",(int)ceil((double)max(n,k)*2/k));
    return 0;
}
