/*Ural 1208*/
#include<cstdio>
#include<cstring>
short n,ans=0,len=-1;
bool map[25][25];
short c[25]={0};
char name[25][25]={0};
short v1[25],v2[25],v3[25];
char s1[25],s2[25],s3[25];
short check(char *s)
{
    for(short i=0;i<=len;i++)
        if(strcmp(s,name[i])==0)
            return i;
    len+=1;
    strcpy(name[len],s);
    name[len][strlen(s)]='\0';
    return len;
}
void dfs(int w)
{
    if(c[0]>ans) ans=c[0];
    if(w>=n) return ;
    short i,j;
    for(i=w;i<n;i++)
    {
        if(c[0]>0)
        {
            for(j=1;j<=c[0];j++)
                if(map[i][c[j]]==false)
                    break;
            if((j<=c[0])&&(map[i][c[j]]==false))
                continue;
        }
        c[0]+=1;
        c[c[0]]=i;
        dfs(i+1);
        c[0]-=1;
    }
}
int main()
{
    scanf("%d",&n);
    for(int i=0;i<n;i++)
    {
        scanf("%s %s %s",s1,s2,s3);
        v1[i]=check(s1),v2[i]=check(s2),v3[i]=check(s3);
    }
    for(int i=0;i<n;i++)
        for(int j=0;j<n;j++)
            if(i!=j)
                if((v1[i]==v1[j])||(v1[i]==v2[j])||(v1[i]==v3[j])||
                   (v2[i]==v1[j])||(v2[i]==v2[j])||(v2[i]==v3[j])||
                   (v3[i]==v1[j])||(v3[i]==v2[j])||(v3[i]==v3[j]))
                    map[i][j]=false;
                else
                    map[i][j]=true;
    dfs(0);
    printf("%d",ans);
    return 0;
}
