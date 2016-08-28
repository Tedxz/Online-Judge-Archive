/*Ural 1229*/
#include<cstdio>
const short MAX_N=102;
short layer1[2][MAX_N]={0},layer2[2][MAX_N]={0};
short n,m;
int main()
{
    scanf("%hd%hd",&n,&m);
    for (short i=0; i<n>>1; ++i)
    {
        for (short j=0; j<m; ++j) scanf("%hd",&layer1[0][j]);
        for (short j=0; j<m; ++j) scanf("%hd",&layer1[1][j]);
        for (short j=0; j<m; ++j) layer2[0][j]=i*m+j+1,layer2[1][j]=i*m+j+1; 
        for (short j=0; j<m; j+=2) 
            if (layer1[0][j]==layer1[1][j] || layer1[0][j+1]==layer1[1][j+1]) ++layer2[1][j],--layer2[0][j+1];
        for (short j=0; j<m; ++j) printf("%hd ",layer2[0][j]); printf("\n");
        for (short j=0; j<m; ++j) printf("%hd ",layer2[1][j]); printf("\n");
    }       
    return 0;
}
