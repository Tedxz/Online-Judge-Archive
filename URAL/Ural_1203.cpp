/*Ural 1203*/
#include<cstdio>
#include<vector>
#include<algorithm>
using namespace std;
int n,ans=0;
vector< pair<int,int> > list;
int main()
{
    scanf("%d",&n);
    list.reserve(n);
    for (int i=0; i<n; ++i)
    {
        int s,t;
        scanf("%d%d",&s,&t);
        list.push_back(make_pair(t,s));
    }
    sort(list.begin(),list.end());
    int time=0;
    for (vector< pair<int,int> >::iterator iter=list.begin(); iter!=list.end(); ++iter)
    {
        if (iter->second>time)
        {
            time=iter->first;
            ++ans;
        }
    }
    printf("%d",ans);
    return 0;
}
    
