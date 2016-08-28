/*Ural 1249*/
#include<cstdio>
const int MAX_N=3001;
int n,m;
bool a[2][MAX_N]={0};
int main()
{
    scanf("%d%d",&n,&m);
    int x;
    for (int i=1; i<=n; ++i)
        for (int j=1; j<=m; ++j)
        {
            scanf("%d",&x);
            a[1&i][j]=(bool)x;
            if (a[1&i][j]+a[1&i][j-1]+a[!(1&i)][j]+a[!(1&i)][j-1]==3) 
            {
                printf("No\n");
                return 0;
            }
        }
    printf("Yes\n");
    return 0;
}
