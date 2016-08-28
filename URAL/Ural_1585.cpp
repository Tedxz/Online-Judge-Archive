/*Ural 1585*/
#include<iostream>
#include<string>
#include<map>
#include<algorithm>
using namespace std;
int n;
map<string,int> m;
int main()
{
    int max=0;
    string st;
    cin>>n;
    getline(cin,st);
    for (int i=0; i<n; ++i) 
    {
        getline(cin,st);
        m[st]++;
    }
    for (map<string,int>::iterator iter=m.begin(); iter!=m.end(); ++iter) 
        if (max<iter->second) { max=iter->second; st=iter->first; }
    cout<<st<<endl;
    return 0;
}
