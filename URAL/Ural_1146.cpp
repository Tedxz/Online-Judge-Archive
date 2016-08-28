/*Ural 1146*/
#include<cstdio>
#include<algorithm>
using namespace std;
const int MAX_N=101;
short a[MAX_N][MAX_N];
int n,ans=-127,tem;
int main()
{
    scanf("%d",&n);
    for (int i=1; i<=n; ++i)
        for (int j=1; j<=n; ++j)
            scanf("%d",&a[i][j]),a[i][j]+=a[i][j-1];
    for (int l=0; l<n; ++l)
        for (int r=l+1; r<=n; ++r)
        {
            tem=0;
            for (int i=1; i<=n; ++i)
            {
                tem=max(a[i][r]-a[i][l],a[i][r]-a[i][l]+tem);
                ans<tem?ans=tem:0;
            }
        }
    printf("%d",ans);
    return 0;
}
