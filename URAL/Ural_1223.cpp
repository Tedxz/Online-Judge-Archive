/*Ural 1223*/
#include<cstdio>
const int MAX_N=1001/*num of eggs*/,MAX_M=1001/*floor*/;
inline int max(int a, int b) { return a>b?a:b; }
int f[MAX_N][MAX_M],n,m;
void dfs(int i, int j)
{
    if (f[i][j]>0 || !j) return;
    if (i>j) { dfs(j,j); f[i][j]=f[j][j]; return; }
    if (i==1) { f[i][j]=j; return; }
    f[i][j]=m;
    for (int k=1; k<=j; ++k)
    {
        dfs(i,k-1); dfs(i-1,j-k);
        if (f[i][j]>max(f[i][k-1],f[i-1][j-k])) f[i][j]=max(f[i][k-1],f[i-1][j-k])+1;
    }
}
int main()
{
    scanf("%d%d",&n,&m);
    while (n || m)
    {
        if (n>10) n=10;
        dfs(n,m);
        printf("%d\n",f[n][m]);
        scanf("%d%d",&n,&m);
    }
    return 0;
}
