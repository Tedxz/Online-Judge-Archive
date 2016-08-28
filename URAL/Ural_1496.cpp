/*Ural 1496*/
#include<iostream>
#include<map>
#include<string>
using namespace std;
int n;
string st;
map<string,int> m;
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n; ++i)
    {
        cin>>st;
        ++m[st];
    }
    for (map<string,int>::iterator iter=m.begin(); iter!=m.end(); ++iter)
        if (iter->second>1) cout<<iter->first<<endl;
    return 0;
}
