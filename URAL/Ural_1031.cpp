/*Ural 1031*/
#include<cstdio>
#include<algorithm>
using namespace std;
const int MAX_N=10001;
int c1,c2,c3,l1,l2,l3,n,s,t;
int a[MAX_N],f[MAX_N];
int main()
{
    scanf("%d%d%d%d%d%d%d%d%d",&l1,&l2,&l3,&c1,&c2,&c3,&n,&s,&t);
    if (s>t) swap(s,t);
    for (int i=2; i<=n; ++i) scanf("%d",&a[i]);
    f[s]=0;
    int s1=s,s2=s,s3=s;
    for (int i=s+1; i<=t; ++i)
    {
        f[i]=0x70000000;
        while (a[s1]<a[i]-l1) ++s1;
        s1<i && f[i]>f[s1]+c1?f[i]=f[s1]+c1:0;
        while (a[s2]<a[i]-l2) ++s2;
        s2<i && f[i]>f[s2]+c2?f[i]=f[s2]+c2:0;
        while (a[s3]<a[i]-l3) ++s3;
        f[i]>f[s3]+c3?f[i]=f[s3]+c3:0;
    }
    printf("%d\n",f[t]);
    return 0;
}
  
