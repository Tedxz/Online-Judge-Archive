/*Ural 1280*/
#include<cstdio>
const int MAX_M=100010, MAX_N=1010;
int pos[MAX_N];
short x[MAX_M],y[MAX_M];
int n,m;
int main()
{
    int t; bool flag=1;
    scanf("%d%d",&n,&m);
    for (int i=0; i<m; ++i)
        scanf("%d%d",&x[i],&y[i]);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&t);
        pos[t]=i;
    }
    for (int i=0; i<m; ++i)
        if (pos[x[i]]>=pos[y[i]])
        {
            flag=0;
            break;
        }
    flag?printf("YES\n"):printf("NO\n");
    return 0;
}
    
        
