/*Ural 1220*/
#include<cstdio>
#include<iostream>
#include<string>
using namespace std;
const int MAX_S=1001, MAX_N=100001;
unsigned int a[MAX_N];
short b[MAX_N];
int n,cnt=0;
int main()
{
    scanf("%d",&n);
    string s;
    int k,j;
    for (int i=0; i<n; ++i)
    {
        if (cnt>100000) while (1);
        cin>>s;
        if (s.size()==4)
        {
            scanf("%d%d",&b[cnt],&a[cnt]);//cin>>k>>t;
            cnt++;
        }
        else
        {
            scanf("%d",&k);//cin>>k;
            for (j=cnt; b[j]!=k; --j);
            b[j]=0;
            printf("%u\n",a[j]);//cout<<a[last[k]]<<endl;
        }
    }
    return 0;
}

