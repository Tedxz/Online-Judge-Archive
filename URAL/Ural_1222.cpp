/*Ural 1222*/
#include<cstdio>
#include<cstring>
struct big_int
{
    big_int(short x)
    {
        memset(v,0,sizeof(v));
        v[0]=x;
        for (len=0; v[len]!=0; ++len)
        {
            v[len+1]+=v[len]/10;
            v[len]%=10;
        }
    }   
    short v[500];
    short len;
    void print()
    {
        for (int i=len-1; i>=0; --i) printf("%d",v[i]);
        printf("\n");
    }
};
big_int operator * (big_int a, big_int b)
{
    big_int c(0);
    c.len=a.len+b.len;
    for (int i=0; i<a.len; ++i)
    {
        for (int j=0; j<b.len; ++j)
        {
            c.v[i+j]+=a.v[i]*b.v[j];
        }
        for (int j=0; j<i+b.len; ++j)
        {
            c.v[j+1]+=c.v[j]/10;
            c.v[j]%=10;
        }
    }
    while (c.v[c.len-1]==0) --c.len;
    c.len==0?c.len=1:0;
    return c;
}
            

big_int ans(1),tem(3);
int n;
int main()
{
    big_int z(1);
    scanf("%d",&n);
    if (n==1)
    {
        printf("1\n");
        return 0;
    }
    switch (n%3)
    {
        case 0: break;
        case 1: n-=4;
                z=big_int(4);
                break;
        case 2: n-=2;
                z=big_int(2);
    }
    n/=3;
    while (n>0) 
    {
        if (1 & n) ans=ans*tem;
        n>>=1;
        tem=tem*tem;
    }
    ans=ans*z;
    ans.print();
    return 0;
}
