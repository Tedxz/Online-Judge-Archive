/*Ural 1220*/
#include<cstdio>
#include<iostream>
#include<string>
using namespace std;
const int MAX_S=1001, MAX_N=100001;
unsigned int a[MAX_N],pre[MAX_N],last[MAX_S];
int n,cnt=0;
int main()
{
    scanf("%d",&n);
    string s;
    int k;
    for (int i=0; i<n; ++i)
    {
        if (cnt>100000) while (1);
        cin>>s;
        if (s.size()==4)
        {
            scanf("%d%d",&k,&a[cnt]);//cin>>k>>t;
            pre[cnt]=last[k];
            last[k]=cnt++;
        }
        else
        {
            scanf("%d",&k);//cin>>k;
            printf("%u\n",a[last[k]]);//cout<<a[last[k]]<<endl;
            last[k]=pre[last[k]];
        }
    }
    return 0;
}

