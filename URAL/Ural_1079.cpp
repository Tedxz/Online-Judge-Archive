/*Ural 1079*/
#include<cstdio>
const int MAX_N=100010;
int a[MAX_N],max[MAX_N];
int main()
{
    a[0]=0,a[1]=1;
    max[0]=0,max[1]=1;
    for (int i=2; i<=MAX_N; ++i)
    {
        a[i]=a[i>>1]+(i & 1==1?a[(i>>1)+1]:0);
        max[i]=a[i]>max[i-1]?a[i]:max[i-1];
    }
    int k;
    for (scanf("%d",&k); k!=0; scanf("%d",&k)) printf("%d\n",max[k]);
    return 0;
}
        
