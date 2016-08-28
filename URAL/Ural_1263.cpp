/*Ural 1263*/
#include<cstdio>
const short MAX_N=10001;
short a[MAX_N]={0};
short n,m,x;
int main()
{
    scanf("%d%d",&n,&m);
    for (int i=0; i<m; ++i)
    {
        scanf("%d",&x);
        ++a[x];
    }
    for (int i=1; i<=n; ++i) printf("%.2f%%\n",100.0*a[i]/m);
    return 0;
}
