/*Ural 1367*/
#include<cstdio>
#include<iostream>
#include<cstring>
#include<cstdlib>
#include<queue>
using namespace std;
const int MAX_N=1100, MAX_NUM=110;
char a[MAX_N*3][MAX_N*3];
bool cnct[MAX_NUM][MAX_NUM];
int dfn[MAX_NUM];
char s[MAX_N];
int w,h,num=0,mark=0;

struct point
{
    short x,y;
};
point p(int x, int y)
{
    point a;
    a.x=x; a.y=y;
    return a;
}
void printmap()
{
    for (int i=0; i<=h*3+1; ++i)
    {
        for (int j=0; j<=w*3+1; ++j)
            if ((a[i][j]<120)&&(a[i][j]>0))
                cout<<(int)a[i][j];
            else cout<<a[i][j];
        printf("\n");
    }
}
void dfs(short x, short y)
{
    if (a[x][y]==120) return;
    if (a[x][y]>0)
    {
        dfn[a[x][y]]=mark;
        return;
    }
    a[x][y]=120;
    if (a[x+1][y]!=120) dfs(x+1,y);
    if (a[x][y+1]!=120) dfs(x,y+1);
    if (a[x-1][y]!=120) dfs(x-1,y);
    if (a[x][y-1]!=120) dfs(x,y-1);
}
void bfs(short x, short y)
{
    queue<point> q;
    q.push(p(x,y));
    while (!q.empty())
    {
        x=q.front().x;
        y=q.front().y;
        q.pop();
        if (a[x][y]>0)
        {
            dfn[a[x][y]]=mark;
            continue;
        }
        a[x][y]=120;
        if (a[x+1][y]!=120) q.push(p(x+1,y));
        if (a[x][y+1]!=120) q.push(p(x,y+1));
        if (a[x-1][y]!=120) q.push(p(x-1,y));
        if (a[x][y-1]!=120) q.push(p(x,y-1));
    }
}
int main()
{
    char ch;
    memset(a,0,sizeof(a));
    for (h=1; scanf("%s",&s)>0; ++h)
    {
        for (w=strlen(s)-1; w>=0; --w) 
        switch (s[w])
        {
            case '.':break;
            case '|':a[h*3][w*3+2]=120;
                     a[h*3-1][w*3+2]=120;
                     a[h*3-2][w*3+2]=120;
                     break;
            case '-':a[h*3-1][w*3+1]=120;
                     a[h*3-1][w*3+2]=120;
                     a[h*3-1][w*3+3]=120;
                     break;
            case '+':a[h*3][w*3+2]=120;
                     a[h*3-2][w*3+2]=120;
                     a[h*3-1][w*3+1]=120;
                     a[h*3-1][w*3+2]=120;
                     a[h*3-1][w*3+3]=120;
                     break;
            case '#':++num;
                     a[h*3][w*3+2]=num;
                     a[h*3-2][w*3+2]=num;
                     a[h*3-1][w*3+1]=num;
                     a[h*3-1][w*3+2]=num;
                     a[h*3-1][w*3+3]=num;
                     break;
        }
        
    }
    --h; w=strlen(s);
    for (int i=0; i<=h*3+1; ++i) a[i][w*3+1]=120,a[i][0]=120;
    for (int i=0; i<=w*3+1; ++i) a[0][i]=120,a[h*3+1][i]=120;
    for (int i=1; i<=h*3; ++i)
        for (int j=1; j<=w*3; ++j)
            if (a[i][j]!=120)
            {
                ++mark;
                bfs(i,j);
                for (int k=1; k<=num; ++k)
                    if (dfn[k]==mark)
                        for (int l=k; l<=num; ++l) 
                            if (dfn[l]==mark) 
                                cnct[k][l]=1,cnct[l][k]=1;
            }
    for (int i=1; i<=num; ++i)
    {
        for (int j=1; j<=num; ++j) printf("%d",cnct[i][j]);
        printf("\n");
    }
    return 0;
}
