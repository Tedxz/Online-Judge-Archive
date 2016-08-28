/*Ural 1207*/
#include<cstdio>
#include<algorithm>
#include<vector>
using namespace std;
int n;
vector< pair<__int64,int> > v;
int main()
{
    scanf("%d",&n);
    v.reserve(n);
    for (int i=0; i<n; ++i)
    {
        __int64 x,y;
        scanf("%I64d%I64d",&x,&y);
        v.push_back(make_pair(x,i));
    }
    sort(v.begin(),v.end());
    printf("%d %d\n",v[n>>1].second+1,v[(n>>1)-1].second+1);
    return 0;
}
