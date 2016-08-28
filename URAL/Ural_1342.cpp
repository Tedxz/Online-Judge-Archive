/*Ural 1342*/
#include<cstdio>
#include<algorithm>
using namespace std;
const int MAX_N=1010;
int n,m,all=0;
double f[MAX_N][MAX_N];
int pc[MAX_N],sum[MAX_N];
double kt[MAX_N];
inline double cost(const int &i, const int &j)
{
    return ((double)pc[i]+kt[i]*(j-1)+pc[i])*j/2;
}
int main()
{
    scanf("%d%d",&m,&n);
    for (int i=1; i<=m; ++i)
    {
        int tem;
        scanf("%d%d%d",&sum[i],&pc[i],&tem); 
        if (sum[i]==1)
         kt[i]=0; 
        else kt[i]=((double)tem-pc[i])/((double)sum[i]-1);
        all+=cost(i,sum[i]); sum[i]+=sum[i-1]; 
    }
    if (sum[m]<n) 
        printf("Maximum possible amount: %d\n",sum[m]);
    if (sum[m]<=n)
    {
        printf("Minimum possible cost: %.2lf\n",(double)all);
        return 0;
    }
    double tem;
    for (int i=0; i<=m; ++i ) 
        for (int j=0; j<=n; ++j)
            f[i][j]=1000000000.0;
    for (int j=1; j<=sum[1]; ++j) f[1][j]=cost(1,j);
    for (int i=1; i<=m; ++i) f[i][0]=0;
    for (int i=2; i<=m; ++i)
        for (int j=1; j<=min(sum[i],n); ++j)
            for (int k=max(0,j-sum[i-1]); k<=min(sum[i]-sum[i-1],j); ++k)
            {
                tem=f[i-1][j-k]+cost(i,k);
                if (f[i][j]>tem) f[i][j]=tem;
            }
    printf("Minimum possible cost: %.2lf\n",f[m][n]);
    return 0;
}
