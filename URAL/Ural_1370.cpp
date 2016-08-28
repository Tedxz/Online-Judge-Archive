/*Ural 1370*/
#include<iostream>
using namespace std;
int m,n,a[1001];
int main()
{
    scanf("%d%d",&n,&m);
    m%=n;
    for (int i=0; i<n; ++i) cin>>a[i];
    for (int i=m; i!=(m+10)%n; i=(i+1)%n) cout<<a[i];
    cout<<endl;
    return 0;
}
