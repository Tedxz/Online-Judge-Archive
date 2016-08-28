/*Ural 1147*/
#include<cstdio>
const int MAX_C=2501, MAX_X=10001;
int a,b,n;
int area[MAX_C];
int l[MAX_X],r[MAX_X],u[MAX_X],d[MAX_X],c[MAX_X];
int calc(int x1, int y1, int x2, int y2, int k)
{
    if (x2<=x1 || y2<=y1) return 0;
    if (k==n) return (y2-y1)*(x2-x1);
    if (x1>=r[k] || x2<=l[k] || y1>=u[k] || y2<=d[k])
        return calc(x1,y1,x2,y2,k+1);
    int ans=0;
    if (u[k]<y2) { ans+=calc(x1,u[k],x2,y2,k+1); y2=u[k]; }
    if (d[k]>y1) { ans+=calc(x1,y1,x2,d[k],k+1); y1=d[k]; }
    if (x1<l[k]) ans+=calc(x1,y1,l[k],y2,k+1);
    if (x2>r[k]) ans+=calc(r[k],y1,x2,y2,k+1);
    return ans;
}
int main()
{
    freopen("rect1.in","r",stdin);
    freopen("rect1.out","w",stdout);
    scanf("%d%d%d",&a,&b,&n);
    for (int i=0; i<n; ++i) 
        scanf("%d%d%d%d%d",&l[i],&d[i],&r[i],&u[i],&c[i]);
    area[1]=a*b;
    for (int i=n-1; i>=0; --i)
    {
        int tem;
        tem=calc(l[i],d[i],r[i],u[i],i+1);
        area[c[i]]+=tem;
        area[1]-=tem;
    }
    for (int i=1; i<=2500; ++i)
    {
        if (area[i]>0) printf("%d %d\n",i,area[i]);
    }
    return 0;
}