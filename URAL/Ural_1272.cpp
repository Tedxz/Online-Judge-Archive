/*Ural 1272*/
#include<cstdio>
const int MAX_N=10001;
int n,k,m;
int anc[MAX_N];
int find(int x)
{
    int tem=x;
    if (x!=anc[x])
    {
        tem=find(anc[x]);
        anc[x]=tem;
    }
    return tem;
}
int main()
{
    scanf("%d%d%d",&n,&k,&m);
    for (int i=1; i<=n; ++i) anc[i]=i;
    --n;
    for (int i=0; i<k; ++i)
    {
        int x,y;
        scanf("%d%d",&x,&y);
        x=find(x),y=find(y);
        if (x!=y) { --n,anc[x]=y; }
    }
    printf("%d",n);
    return 0;
}
