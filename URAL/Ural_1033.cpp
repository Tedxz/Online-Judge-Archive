/*Ural 1033*/
#include<cstdio>
#include<iostream>
#include<string>
using namespace std;
const int MAX_N=35;
char map[MAX_N][MAX_N];
bool v[MAX_N][MAX_N];
int n,ans=0;;
void dfs(int x, int y)
{
    if (v[x][y]==1) return ;
    v[x][y]=1;
    if (map[x][y+1]!='#') dfs(x,y+1); else ++ans;
    if (map[x+1][y]!='#') dfs(x+1,y); else ++ans;
    if (map[x][y-1]!='#') dfs(x,y-1); else ++ans;
    if (map[x-1][y]!='#') dfs(x-1,y); else ++ans;
}

int main()
{
    cin>>n;
    memset(v,0,sizeof(v));
    memset(map,'#',sizeof(map));
    for (int i=1; i<=n; ++i) 
        {
            for (int j=1; j<=n; ++j)
                cin>>map[i][j];
        }
    dfs(1,1);
    dfs(n,n);
    cout<<(ans-4)*9<<endl;
    return 0;
}
