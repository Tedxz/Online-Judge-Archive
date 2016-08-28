/*Ural 1213*/
#include<cstdio>
#include<iostream>
#include<string>
#include<cstdlib>
#include<map>
using namespace std;
map<string,short> m;
int ans=0;
int main()
{
    string s1,s2,st;
    cin>>st;
    m[st]=1;
    while(1)
    {
        cin>>st;
        string::iterator iter=st.begin();
        if (st=="#") break;
        for (iter=st.begin(); *iter!='-'; ++iter);
        s1.assign(st.begin(),iter);
        s2.assign(++iter,st.end());
        m[s1]?0:(m[s1]=1,++ans);
        m[s2]?0:(m[s2]=1,++ans);
    }
    cout<<ans<<endl;
    return 0;
}
        
