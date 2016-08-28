/*Ural 1303*/
#include<cstdio>
#include<cstring>
#include<algorithm>
using namespace std;
struct node { int l, r; } line[100010];
bool visit[100010];
int m, tot;
bool cmp(node x, node y)
{
    if(x.l == y.l)  return  x.r < y.r;
    else  return  x.l < y.l;
}
int main()
{
    bool flag = true;
    int i, j, last, x, y, p, pos, ct=0;
    scanf("%d", &m);
    while(scanf("%d%d", &x, &y) != EOF)
    {
        if(y<0 || x>m || x==y)  continue;
        line[tot].l = x;
        line[tot++].r = y;
    }
    sort(line, line+tot, cmp);
    memset(visit, false, sizeof(visit));
    last = pos = 0;
    while(last < m)
    {
        j = p = -1;
        for(i = pos; i < tot; i++)
        {
            if(line[i].l > last)
            {
                pos = i;
                break;
            }
            if(line[i].l<=last && line[i].r>p)
            {
                p = line[i].r;
                j = i;
            }
        }
        if(j!=-1 && line[j].r>last)
        {
            visit[j] = true;
            last = line[j].r;
            ct++;
        }
        else
        {
            flag = false;
            break;
        }
        if(last == m)  break;
    }
    if(!flag)  printf("No solution\n");
    else
    {
        printf("%d\n", ct);
        for(i = 0; i < tot; i++)
            if(visit[i])
                printf("%d %d\n", line[i].l, line[i].r);
    }
    return 0;
}
