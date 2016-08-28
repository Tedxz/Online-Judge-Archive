/*Ural 1019*/
#include<cstdio>
const int MAX_N=5001;
int n,ans=0,ans_left,ans_right;
int l[MAX_N],r[MAX_N];
char c[MAX_N];
int min(int a, int b) { return a<b?a:b; }
int max(int a, int b) { return a>b?a:b; }
void solve(int left, int right, int k)
{
    if (k>n) 
    {
        if (right-left>ans) { ans_left=left; ans_right=right; ans=right-left; }
        return;
    }
    /*
    *区间不重合：继续上浮 
    *白色重合：合并到k，停止 
    *黑色重合：没有被覆盖的部分继续上浮 
    */ 
    if (right<l[k] || r[k]<left)
    {
        solve(left,right,k+1);
        return;
    }
    if (c[k]=='w')
    {
        l[k]>left?l[k]=left:l[k];
        r[k]<right?r[k]=right:r[k];
    }
    else
    {
        if (left<l[k]) solve(left,l[k],k+1);
        if (right>r[k]) solve(r[k],right,k+1);
    }
}
int main()
{
    scanf("%d",&n);
    l[0]=0; r[0]=1000000000; c[0]='w';
    for (int i=1; i<=n; ++i)
    {
        scanf("%d%d%s",&l[i],&r[i],&c[i]);
    }
    for (int i=0; i<=n; ++i)
    {
        if (c[i]=='w') solve(l[i],r[i],i+1);
    }
    printf("%d %d",ans_left,ans_right);
    return 0;
}
    
