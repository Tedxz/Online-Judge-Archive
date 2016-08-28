/*Ural 1136*/
#include<cstdio>
const int MAX_N=3000;
int a[MAX_N],n;
int binary_search(int l, int r, int key)
{
    int mid=(l+r)>>1;
    while (l!=r)
    {
        a[mid]<key?l=mid+1:r=mid;
        mid=(l+r)>>1;
    }
    return l;
}
void dfs(int l, int r)
{
    if (l>r) return;
    if (l==r)
    {
        printf("%d ",a[r]);
        return;
    }   
    int mid=binary_search(l,r,a[r]);
    dfs(mid,r-1);
    dfs(l,mid-1);
    r==n-1?printf("%d\n",a[r]):printf("%d ",a[r]);
}
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n; ++i) scanf("%d",&a[i]);
    dfs(0,n-1);
    return 0;
}
