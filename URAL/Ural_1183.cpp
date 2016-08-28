/*Ural 1183*/
#include<cstdio>
const int MAX_N=103;
short n,a[MAX_N];
short f[MAX_N][MAX_N],sk[MAX_N][MAX_N];
inline char key(const short &x)
{
    switch (x)
    {
        case -1: return '(';
        case  1: return ')';
        case -2: return '[';
        case  2: return ']';
    }
}
void dfs(const int &l, const int &r)
{
    if (sk[l][r] || f[l][r]) return;
    f[l][r]=0x1000;
    if (a[l]<a[r] && a[l]+a[r]==0)
    {
        dfs(l+1,r-1);
        f[l][r]=f[l+1][r-1];
        sk[l][r]=-1;
    }
    for (int k=l; k<r; k++)
    {
        dfs(l,k); dfs(k+1,r);
        if (f[l][r]>f[l][k]+f[k+1][r])
        {
            f[l][r]=f[l][k]+f[k+1][r];
            sk[l][r]=k;
        }
    }
}
void print(const int &l, const int &r)
{
    if (l>r) return;
    if (l==r)
    {
        if (a[l]<0) printf("%c%c",key(a[l]),key(-a[l]));
        else printf("%c%c",key(-a[l]),key(a[l]));
        return;
    }
    if (sk[l][r]<0)
    {
        printf("%c",key(a[l]));
        print(l+1,r-1);
        printf("%c",key(a[r]));
        return;
    }
    print(l,sk[l][r]); print(sk[l][r]+1,r);
}
int main()
{
    char ch;
    for (n=1; scanf("%c",&ch)!=EOF; ++n) 
    {
        switch (ch)
        {
            case '(': a[n]=-1; break;
            case ')': a[n]=1;  break;
            case '[': a[n]=-2; break;
            case ']': a[n]=2;  break;
            default: --n;
        }
    }
    --n;
    for (int i=1; i<=n; ++i) f[i][i]=1;
    for (int i=1; i<n; ++i) 
        if (a[i]<a[i+1] && a[i]+a[i+1]==0) f[i][i+1]=0,sk[i][i+1]=-1;
        else f[i][i+1]=2,sk[i][i+1]=i;
    dfs(1,n);
    print(1,n);
    return 0;
}
