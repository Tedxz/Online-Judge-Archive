/*Ural 1712*/
#include<cstdio>
#include<cstdlib>
#include<cstring>
int tot=0;
char a[7][7],b[7][7],t[7][7],ans[20];
inline void rota()
{
    for (int i=1;i<=4;++i)
        for (int j=1;j<=4;++j)
            t[i][j]=a[5-j][i];
    memcpy(a,t,sizeof(t));
}
int main()
{
    for (int i=1;i<=4;++i)
        scanf("%s",&a[i][1]);
    for (int i=1;i<=4;++i)
        scanf("%s",&b[i][1]);
    for (int i=1;i<=4;++i)
    {
        for (int j=1;j<=4;++j)
            for (int k=1;k<=4;++k)
                if (a[j][k] == 'X')
                    ans[++tot]=b[j][k];
        rota();
    }
    ans[++tot]='\0';
    printf("%s",ans+1);
    return 0;
}
