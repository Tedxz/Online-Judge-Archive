/*Ural 1005*/
#include<cstdio>
#include<iostream>
using namespace std;
const int MAX_N=21;
int ans,n,a[MAX_N],all;
void dfs(int k, int sum)
{
    if (k==n)
    {
        if (abs(sum*2-all)<ans) ans=abs(sum*2-all);
        return;
    }
    dfs(k+1,sum);
    dfs(k+1,sum+a[k]);
}
int main()
{
    cin>>n;
    ans=2000000;
    for (int i=0; i<n; ++i) cin>>a[i],all+=a[i];
    dfs(0,0);
    cout<<ans<<endl;
    return 0;
}
    
