/*Ural 1837*/
#include<cstdio>
#include<string>
#include<iostream>
#include<map>
#include<queue>
using namespace std;
const int MAX_N=110, MAX_E=1000, MAX_V=310, INF=200;
struct edge{ int a,next; };
int head[MAX_V];
edge e[MAX_E];
int n,num=0,tot=0;
map<string,int> m;
int dis[MAX_V];
void make_edge(int x, int y)
{
    e[++tot].a=y; e[tot].next=head[x]; head[x]=tot;
    e[++tot].a=x; e[tot].next=head[y]; head[y]=tot;
}
void spfa()
{
    queue<int> q; int v[MAX_V];
    fill(dis,dis+MAX_V,INF);
    if (m.insert(make_pair("Isenbaev",0)).second) { m.erase("Isenbaev"); return; }
    memset(v,0,sizeof(v));
    dis[m["Isenbaev"]]=0;
    q.push(m["Isenbaev"]);
    while (!q.empty())
    {
        int tem=q.front();
        q.pop();
        v[tem]=0;
        for (int k=head[tem]; k!=0; k=e[k].next)
            if (dis[e[k].a]>dis[tem]+1)
            {
                dis[e[k].a]=dis[tem]+1;
                if (!v[e[k].a])
                {
                    q.push(e[k].a);
                    v[e[k].a]=1;
                }
            }
    }
}
int main()
{
    string s1,s2,s3;
    cin>>n;
    memset(head,0,sizeof(head));
    for (int i=0; i<n; ++i)
    {
        cin>>s1>>s2>>s3;
        if (m.insert(make_pair(s1,num)).second) ++num;
        if (m.insert(make_pair(s2,num)).second) ++num;
        if (m.insert(make_pair(s3,num)).second) ++num;
        make_edge(m[s1],m[s2]);
        make_edge(m[s3],m[s2]);
        make_edge(m[s1],m[s3]);
    }
    spfa();
    for (map<string,int>::iterator iter=m.begin(); iter!=m.end(); ++iter)
    {
        cout<<iter->first<<' ';
        if (dis[iter->second]==INF) cout<<"undefined"<<endl;
        else cout<<dis[iter->second]<<endl;
    }
    return 0;
}
