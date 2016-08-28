/*Ural 1350*/
#include<iostream>
#include<string>
#include<set>
using namespace std;
const int MAX_N=101;
int n,m,k,x,tot[MAX_N]={0};
string s;
set<string> t;
int main()
{
    scanf("%d%*c",&n);
    for (int i=1;i<=n;++i)  cin >> s;
    scanf("%d%d%*c",&k,&x);
    for (n-=x;x;--x)
    {
        cin >> s;
        t.insert(s);
    }
    for (int i=1;i<=k;++i)
        for (scanf("%d%*c",&x);x;--x)
        {
            cin >> s;
            if (t.find(s) == t.end())
                ++tot[i];
        }
    scanf("%d",&m);
    for (int i=1;i<=k;++i)
        if ((!tot[i]) || (!m))  printf("YES\n");
        else if (tot[i] > n-m)  printf("NO\n");
        else  printf("MAYBE\n");
    return 0;
}
