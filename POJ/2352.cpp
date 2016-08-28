/*PKU 2352*/
#include<cstdio>
const int MAX_X=32768, MAX_N=15000;
int t[MAX_X]={0},ans[MAX_N]={0};
int n,x,y;
int lowbit(int k) { return k & -k; }
int find(int pos)
{
    int tem=0;
    while (pos>0) 
    {
        tem+=t[pos];
        pos-=lowbit(pos);
    }
    return tem;
}
void modify(int pos)
{
    while (pos<MAX_X)
    {
        t[pos]++;
        pos+=lowbit(pos);
    }
}
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n; ++i)
    {
        scanf("%d%d",&x,&y);
        ans[find(x+1)]++;
        modify(x+1);
    }
    for (int i=0; i<n; ++i)
        printf("%d\n",ans[i]);
    return 0;
}
