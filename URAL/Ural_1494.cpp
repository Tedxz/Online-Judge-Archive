/*Ural 1494*/
#include<cstdio>
const int MAX_N=100001;
int stack[MAX_N],back,n,now=0,x;
bool ins[MAX_N];
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&x);
        if (x<now && x!=stack[back-1]) {printf("Cheater\n"); return 0;}
        while (now<x) stack[back++]=++now;
        --back;
    }
    printf("Not a proof\n");
    return 0;
}
