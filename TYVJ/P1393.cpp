//TYVJ P1393
#include<iostream>
#include<cstdio>
using namespace std;
const int MAX_N=1010;
int q[MAX_N],x,n,m,h=0,t=0,ans=0;
bool v[MAX_N];
int main()
{
    fill(v,v+MAX_N,0);
    scanf("%d %d\n",&m,&n);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&q[++t]);
        if (!v[q[t]])
        {
            ++ans;
            v[q[t]]=1;
            if (t-h>m) v[q[++h]]=0;
        }
        else --t;
    }
    printf("%d\n",ans);
    return 0;
}
