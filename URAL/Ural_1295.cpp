/*Ural 1295*/
#include<cstdio>
int period[20]={1,1,2,0,2,1,2,0,1,1,2,0,1,1,2,0,1,1,2,0};
int n;
int main () 
{
    scanf("%d",&n);
    printf("%d",period[((n%20)?n%20:20)-1]);
    return 0;
}
