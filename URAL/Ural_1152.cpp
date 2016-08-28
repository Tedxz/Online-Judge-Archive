/*Ural 1152*/
#include<cstdio>
const int MAX_N=21;
int n,a[MAX_N],shot[MAX_N],ans,lim,f[1<<MAX_N];
void init()
{
    shot[0]=7;
    for (int i=1; i<n; ++i)
    {
        shot[i]=shot[i-1]<<1;
        if (shot[i]>lim) shot[i]-=lim;
    }
    for (int i=0; i<n; ++i) shot[i]^=lim;
}
void dfs(int stat)
{
    if (f[stat] || !stat) return;
    f[stat]=0x10000000;
    for (int i=0; i<n; ++i)
        if (stat & (1<<i))
        {
            dfs(stat & shot[i]);
            f[stat]>f[stat & shot[i]] ? f[stat]=f[stat & shot[i]] : 0;
        }
    for (int i=0; i<n; ++i) if (stat & (1<<i)) f[stat]+=a[i];
}
int main()
{
    scanf("%d",&n);
    lim=(1<<n)-1;
    init();
    for (int i=0; i<n; ++i) scanf("%d",&a[i]);
    dfs(lim);
    for (int i=0; i<n; ++i) f[lim]-=a[i];
    printf("%d",f[lim]);
    return 0;
}
