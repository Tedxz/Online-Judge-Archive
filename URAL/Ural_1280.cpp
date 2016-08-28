/*Ural 1280*/
#include<cstdio>
const int MAX_M=100010, MAX_N=1010;
struct r
{
    int x,y;
};
int pos[MAX_N];
r a[MAX_M];
int n,m;
int main()
{
    int t; bool flag=1;
    scanf("%d%d",&n,&m);
    for (int i=0; i<m; ++i)
        scanf("%d%d",&a[i].x,&a[i].y);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&t);
        pos[t]=i;
    }
    for (int i=0; i<m; ++i)
        if (pos[a[i].x]>=pos[a[i].y])
        {
            flag=0;
            break;
        }
    flag?printf("YES\n"):printf("NO\n");
    return 0;
}
    
        
