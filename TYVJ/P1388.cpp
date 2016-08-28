//TYVJ P1388
#include<cstdio>
#include<iostream>
#include<algorithm>
using namespace std;
const int MAX_N=100010;
class peop
{
    public:
        int num,rp;
};
bool co(peop x, peop y)
{
    if (x.rp<y.rp) return (1);
    return (0);
}
int n,k;
peop a[MAX_N];
int main()
{
    scanf("%d\n",&n);
    for (int i=0; i<n; ++i) 
    {
        scanf("%d",&a[i].rp);
        a[i].num=i+1;
    }
    scanf("%d",&k);
    nth_element(a,a+k-1,a+n,co);
    printf("%d\n",a[k-1].num);
    return 0;
}
    
