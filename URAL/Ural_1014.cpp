/*Ural 1014*/
#include<cstdio>
int a[8]; 
int n;
int main()
{
    scanf("%d",&n);
    if (n==0) { printf("10\n"); return 0; }
    if (n==1) { printf("1\n"); return 0; }
    for (int i=9; i>1; --i)
        while (n%i==0) n/=i,++a[i-2];
    if (n!=1) { printf("-1\n"); return 0; }
    for (int i=2; i<10; ++i)
        for (int j=1; j<=a[i-2]; ++j) printf("%d",i);
    printf("\n");
    return 0;
}
