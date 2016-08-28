/*Ural 1613*/
#include<cstdio>
#include<algorithm>
#include<map>
#include<vector>
using namespace std;
const int MAX_N=70010, MAX_Q=70010;
map<int,vector<int> > m;
int n,q;
int main()
{
    int x,l,r;
    vector<int>::iterator iter;
    vector<int> tem;
    scanf("%d",&n);
    for (int i=1; i<=n; ++i)
    {
        scanf("%d",&x);
        m[x].push_back(i);
    }
    scanf("%d",&q);
    for (int i=0; i<q; ++i)
    {
        scanf("%d%d%d",&l,&r,&x);
        if (m.find(x)==m.end())
            printf("0");
        else
        {
            iter=lower_bound(m[x].begin(),m[x].end(),l);
            iter==m[x].end() || (*iter)>r ? printf("0"):printf("1");
        }
    }
    return 0;
}
            
