/*Ural 1172*/
#include<cstdio>
#include<cstring>
#include<iostream>
using namespace std;
const short MAX_N=31;
class bigint
{
    public:
        short v[130];      // v[0]为个位 
        short len;           // bigint的位数，v[len]指向最高位的下一位 
        bigint()
        {
            memset(v,0,sizeof(v));
            len=1;
        }
        bigint(int k)
        {
            memset(v,0,sizeof(v));
            v[0]=k;
            for (len=0; v[len]>9; ++len) v[len+1]+=(short)v[len]/10,v[len]%=10;
            ++len;
        }
};
bigint to_bigint(short k)
{
    bigint x;
    memset(x.v,0,sizeof(x.v));
    x.v[0]=k;
    for (x.len=0; x.v[x.len]>9; ++x.len) x.v[x.len+1]+=(short)x.v[x.len]/10,x.v[x.len]%=10;
    ++x.len;
    return x;
}
void write(const bigint &t)
{
    for (short i=t.len-1; i>=0; --i) printf("%d",t.v[i]);
    printf("\n");
}
bigint operator + (const bigint &a, const bigint &b)
{
    bigint c(0);
    c.len=max(a.len,b.len);
    for (short i=0; i<c.len; ++i) 
    {
        c.v[i]+=a.v[i]+b.v[i];
        if (c.v[i]>9) ++c.v[i+1],c.v[i]-=10;
    }
    if (c.v[c.len]>0) ++c.len;
    //while (c.len>1 && c.v[c.len-1]==0) --c.len;
    return c;
}
bigint operator * (const bigint &a, const bigint &b)
{
    bigint c;
    c.len=a.len+b.len;
    for (int i=0; i<a.len; ++i)
    {
        for (short j=0; j<b.len; ++j) c.v[i+j]+=a.v[i]*b.v[j];
        for (short j=i; j<i+b.len; ++j) 
            if (c.v[j]>9)
            {
                c.v[j+1]+=c.v[j]/10;
                c.v[j]%=10;
            }
    }
    if (c.v[c.len-1]==0) --c.len;
    //while (c.len>1 && c.v[c.len-1]==0) --c.len;
    return c;
}
bigint operator / (bigint a, int b)
{
    for (short i=a.len-1; i>0; --i)
    {
        a.v[i-1]+=(a.v[i]%b)*10;
        a.v[i]/=b;
    }
    a.v[0]/=b;
    if (!a.v[a.len-1] && a.len>1)  --a.len;
    return a;
}
    
int n;
bigint f[MAX_N][MAX_N][MAX_N][3];
void dfs(short i, short j, short k, short x)
{
    if (f[i][j][k][x].len>1 || f[i][j][k][x].v[0]>0) return;
    if (x!=0 && i>0) { dfs(i-1,j,k,0); f[i][j][k][x]=f[i][j][k][x]+to_bigint(i)*f[i-1][j][k][0]; }
    if (x!=1 && j>0) { dfs(i,j-1,k,1); f[i][j][k][x]=f[i][j][k][x]+to_bigint(j)*f[i][j-1][k][1]; }
    if (x!=2 && k>0) { dfs(i,j,k-1,2); f[i][j][k][x]=f[i][j][k][x]+to_bigint(k)*f[i][j][k-1][2]; }
}
int main()
{
    freopen("a.txt","w",stdout);
    for (n=1; n<=30; ++n)
    {f[0][0][1][0]=to_bigint(1); f[0][1][0][0]=to_bigint(1); 
    f[0][0][1][1]=to_bigint(1); f[0][1][0][2]=to_bigint(1);
    dfs(n-1,n,n,0);
    write(f[n-1][n][n][0]/2);}
    return 0;
}


/*Ural 1172*/
#include<cstdio>
#include<cstring>
#include<iostream>
using namespace std;
const short MAX_N=31;
class bigint
{
    public:
        short v[130];      // v[0]为个位 
        short len;           // bigint的位数，v[len]指向最高位的下一位 
        bigint()
        {
            memset(v,0,sizeof(v));
            len=1;
        }
        bigint(int k)
        {
            memset(v,0,sizeof(v));
            v[0]=k;
            for (len=0; v[len]>9; ++len) v[len+1]+=(short)v[len]/10,v[len]%=10;
            ++len;
        }
};
bigint to_bigint(short k)
{
    bigint x;
    memset(x.v,0,sizeof(x.v));
    x.v[0]=k;
    for (x.len=0; x.v[x.len]>9; ++x.len) x.v[x.len+1]+=(short)x.v[x.len]/10,x.v[x.len]%=10;
    ++x.len;
    return x;
}
void write(const bigint &t)
{
    for (short i=t.len-1; i>=0; --i) printf("%d",t.v[i]);
    printf("");
}
bigint operator + (const bigint &a, const bigint &b)
{
    bigint c(0);
    c.len=max(a.len,b.len);
    for (short i=0; i<c.len; ++i) 
    {
        c.v[i]+=a.v[i]+b.v[i];
        if (c.v[i]>9) ++c.v[i+1],c.v[i]-=10;
    }
    if (c.v[c.len]>0) ++c.len;
    //while (c.len>1 && c.v[c.len-1]==0) --c.len;
    return c;
}
bigint operator * (const bigint &a, const bigint &b)
{
    bigint c;
    c.len=a.len+b.len;
    for (int i=0; i<a.len; ++i)
    {
        for (short j=0; j<b.len; ++j) c.v[i+j]+=a.v[i]*b.v[j];
        for (short j=i; j<i+b.len; ++j) 
            if (c.v[j]>9)
            {
                c.v[j+1]+=c.v[j]/10;
                c.v[j]%=10;
            }
    }
    if (c.v[c.len-1]==0) --c.len;
    //while (c.len>1 && c.v[c.len-1]==0) --c.len;
    return c;
}
bigint operator / (bigint a, int b)
{
    for (short i=a.len-1; i>0; --i)
    {
        a.v[i-1]+=(a.v[i]%b)*10;
        a.v[i]/=b;
    }
    a.v[0]/=b;
    if (!a.v[a.len-1] && a.len>1)  --a.len;
    return a;
}
    
int n;
bigint f[MAX_N][MAX_N][MAX_N][3];
void dfs(short i, short j, short k, short x)
{
    if (f[i][j][k][x].len>1 || f[i][j][k][x].v[0]>0) return;
    if (x!=0 && i>0) { dfs(i-1,j,k,0); f[i][j][k][x]=f[i][j][k][x]+to_bigint(i)*f[i-1][j][k][0]; }
    if (x!=1 && j>0) { dfs(i,j-1,k,1); f[i][j][k][x]=f[i][j][k][x]+to_bigint(j)*f[i][j-1][k][1]; }
    if (x!=2 && k>0) { dfs(i,j,k-1,2); f[i][j][k][x]=f[i][j][k][x]+to_bigint(k)*f[i][j][k-1][2]; }
}
int main()
{
    freopen("a.txt","w",stdout);
    for (n=1; n<=30; ++n)
    {f[0][0][1][0]=to_bigint(1); f[0][1][0][0]=to_bigint(1); 
    f[0][0][1][1]=to_bigint(1); f[0][1][0][2]=to_bigint(1);
    dfs(n-1,n,n,0);
    printf("        case %d:printf(\"",n); 
    write(f[n-1][n][n][0]/2);
     printf("\\n\"); break;\n");
    }
    return 0;
}

