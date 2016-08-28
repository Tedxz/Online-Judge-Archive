/*Ural 1353*/
#include<cstdio>
int a[82],n;
int main()
{
    a[0]=1;
    for (int i=1; i<=9; ++i)
        for (int j=i*9; j>=1; --j)
            for (int k=1; k<=j && k<=9; ++k)
                a[j]+=a[j-k];
    ++a[1];
    scanf("%d",&n);
    printf("%d",a[n]);
    return 0;
}
