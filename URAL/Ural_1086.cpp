/*Ural 1086*/
//Prime
#include<cstdio>
#include<bitset>
using namespace std;
const int inf=170000, MAX_N=15010;
bool prime[inf]; //0-> is prime
int plist[MAX_N];
int n,k,cnt;
int main()
{
    prime[0]=1,prime[1]=1;
    for (__int64 i=1; i<=inf,cnt<MAX_N; ++i)
        if (!prime[i])
        {
            for (__int64 j=i*i; j<=inf; j+=i) prime[j]=1;
            plist[++cnt]=i;
        }
    scanf("%d",&n);
    for (int i=1; i<=n; ++i)
    {
        scanf("%d",&k);
        printf("%d\n",plist[k]);
    }
    return 0;
}
