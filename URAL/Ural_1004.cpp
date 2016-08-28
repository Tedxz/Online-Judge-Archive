#include<iostream>
#include<cstdio>
#include<memory>
#include<cmath>
using namespace std;
const int MAX_N=110,MAX_M=10010,INF=0x02000200;
    int map[MAX_N][MAX_N],dis[MAX_N][MAX_N],pre[MAX_N][MAX_N];
    int sol[MAX_N];
    int x,y,len,min_cir,cir_i,cir_j,cir_k,p;
    int n,m;

inline bool work()
{
    //if (scanf("%d %d\n",&n,&m)<=1) return 0;//
    if (scanf("%d",&n)!=1) return 0;
    if (n==-1) return 0;
    if (scanf("%d",&m)!=1) return 0;
    //fill(map,map+(MAX_N*MAX_N),INF);
    //fill(dis,dis+MAX_N*MAX_N,INF);
    /*memset(map,0x200,sizeof(map));
    memset(dis,0x200,sizeof(dis));
    
    printf("%d\n\n\n",dis[1][1]);*/
    //n=MAX_N;
    for (int i=0; i<n; ++i)
        for (int j=0; j<n; ++j) 
            dis[i][j]=map[i][j]=INF;
    for (int i=0; i<n; ++i) dis[i][i]=map[i][i]=0;
    
    for (int i=0; i<m; ++i)
    {
        scanf("%d%d%d",&x,&y,&len);
        --x,--y;
        map[x][y]=map[y][x]=dis[x][y]=dis[y][x]=min(len,dis[x][y]);
    }
    for (int i=0; i<n; ++i)
        for (int j=0; j<n; ++j)
            pre[i][j]=i;
    min_cir=INF;
    for (int k=0; k<n; ++k)
    {
        for (int i=0; i<k; ++i)
            for (int j=i+1; j<k; ++j)
                if (min_cir>dis[i][j]+map[i][k]+map[j][k]) 
                {
                    min_cir=dis[i][j]+map[i][k]+map[j][k];
                    cir_i=i,cir_j=j,cir_k=k;
                }   
        for (int i=0; i<n; ++i)
            for (int j=0; j<n; ++j)
                if (dis[i][j]>dis[i][k]+dis[k][j])
                    dis[i][j]=dis[i][k]+dis[k][j],pre[i][j]=pre[k][j];
    }
    if (min_cir>=INF) {printf("No solution.\n"); return 1;}
    sol[0]=cir_k;
    p=0;
    for (int tem=cir_j; tem!=cir_i; tem=pre[cir_i][tem]) sol[++p]=tem;
    for (; p>=0; --p) cout<<sol[p]+1<<' '; //printf("%d ",sol[p]+1);
    cout<<cir_i+1;//printf("%d",cir_i+1);
    cout<<endl;////printf("##%d",min_cir);
    //cout<<endl;//printf("\n");
    return 1;
}
    
    

int main()
{
    //freopen("1004.in","r",stdin);
    //freopen("1004.out","w",stdout);
    while (work()) ;
    //work(); cout<<endl;
    return 0;
}

