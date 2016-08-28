/*Ural 1032*/
#include<cstdio>
const int MAX_N=10001;
int n,a[MAX_N],sum,pos[MAX_N];
int main()
{
    scanf("%d",&n);
    pos[0]=1;
    for (int i=1; i<=n; ++i) 
    {
        scanf("%d",&a[i]);
        sum+=a[i]; sum%=n;
        if (!pos[sum])  pos[sum]=i+1;
        else
        {
            printf("%d\n",i-pos[sum]+1);
            for (int j=pos[sum]; j<=i; ++j) printf("%d\n",a[j]);
            break;
        }
    }
    return 0;
}
