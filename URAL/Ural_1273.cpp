/*Ural 1273*/
#include<cstdio>
#include<algorithm>
using namespace std;
const short MAX_N=101;
struct p { short x,y; };
inline bool cmp(p p1, p p2) { return p1.x<p2.x; }
short n,ans=0;
p a[MAX_N];
short f[MAX_N]={0x1000};
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n; ++i) scanf("%d%d",&a[i].x,&a[i].y);
    sort(a,a+n,cmp);
    int l,r,m;
    for (int i=0; i<n; ++i)
    {
        l=1; r=ans+1; m=(l+r)>>1;
        while (l<r) 
        {
            f[m]<a[i].y?l=m+1:r=m;
            m=(l+r)>>1;
        }
        f[l]=a[i].y;
        l>ans?ans=l:0;
    }
    printf("%d",n-ans);
    return 0;
}
    
