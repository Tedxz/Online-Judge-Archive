/*Ural 1581*/
#include<cstdio>
#include<vector>
using namespace std;
typedef vector<pair<int,int> > vec;
int n;
vec v;
int main()
{
    scanf("%d",&n);
    v.push_back(make_pair(-1,0));
    for (int i=0; i<n; ++i) 
    {
        int x;
        scanf("%d",&x);
        if (v.rbegin()->first==x) ++v.rbegin()->second;
        else v.push_back(make_pair(x,1));
    }
    for (vec::iterator iter=v.begin()+1; iter!=v.end(); ++iter)
        printf("%d %d ",iter->second,iter->first);
    return 0;
}
