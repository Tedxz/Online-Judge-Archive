/*Ural_1356*/
#include<iostream>
#include<cmath>
using namespace std;
const int MAX_N=31623;
int T,n,tot=0,d,q[4],p[3402];
bool found,prime[MAX_N+1]={false};
inline bool IsPrime(int x)
{
    if (x<=MAX_N)  return !prime[x];
    int sqrt_x=(int)sqrt((double)x);
    for (int i=2;i<=sqrt_x;++i)
        if (x%i == 0)
            return false;
    return true;
}
inline void dfs(int k, int x, int y)
{
    if (found)  return;
    if (k==1)
    {
        if (IsPrime(x))
        {
            for (int i=d;i>1;--i)
                cout<<p[q[i]]<<' ';
            cout<<x<<endl;
            found=true;
        }
        return;
    }
    for (int i=y; i<=tot; ++i)
    {
        if (p[i]*k>x)  return;
        q[k]=i;
        dfs(k-1,x-p[i],i);
    }
}
int main()
{
    cin>>T;
    for (int i=2; i<=MAX_N; ++i)
        if (!prime[i])
        {
            int j=i*i;
            while (j<=MAX_N)
            {
                prime[j]=true;
                j+=i;
            }
            p[++tot]=i;
        }
    while (T--)
    {
        cin>>n;
        d=0,found=false;
        while (!found)
            dfs(++d,n,1);
    }
    return 0;
}
