/*Ural 1711*/
#include<cstdio>
#include<iostream>
#include<utility>
#include<string>
#include<vector>
#include<algorithm>
using namespace std;
const int MAX_N=50;
int n,p=1;
pair<string,int> a[MAX_N*3];
vector<int> ans;
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n*3; ++i)
        cin>>a[i].first;
    for (int i=1; i<=n; ++i)
    {
        int x;
        scanf("%d",&x);
        a[x*3-3].second=a[x*3-2].second=a[x*3-1].second=i;
    }
    sort(a,a+n*3);
    for (int i=0; i<n*3; ++i)
    {
        if (a[i].second==p) ans.push_back(i),++p;
    }
    if (p<=n) printf("IMPOSSIBLE\n");
    else 
        for (int i=0; i<n; ++i) cout<<a[ans[i]].first<<endl;
    return 0;
}
        
        
