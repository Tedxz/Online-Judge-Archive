/*Ural 1745*/
#include<cstdio>
#include<cstring>
#include<algorithm>
#include<queue>
using namespace std;
const int MAX_N=10001,MAX_LEN=10001;
struct sequence { int l,r,len,num; } seq[MAX_N];
inline bool cmp(sequence s1, sequence s2)
{
    return s1.l<s2.l || (s1.l==s2.l && s1.r>s2.r) ;
}
    
int n,ans,num,aend,pre[MAX_N][10001],f[MAX_N][10001];
priority_queue<pair<int,int> > que;
bool inq[MAX_N][5000];
void print()
{
    int tem,sol[MAX_N],i;
    printf("%d ",ans);
    sol[0]=aend; tem=0;
    for (i=0; sol[i]!=-1; ++i)
    {
        //if (i>1999) while(1);
        sol[i+1]=pre[1+sol[i]][tem];
        tem=tem+seq[sol[i]].l-seq[sol[i]].r;
        //if (sol[i]<-1) return;
    }
    printf("%d\n",i);
    for (--i; i>=0; --i )
        printf("%d ",seq[sol[i]].num+1);
}

int main()
{
    char s[MAX_LEN]; int lt,rt,ls,front,back;
    bool q[MAX_LEN];
    scanf("%d",&n);
    for (int i=0; i<n; ++i)
    {
        scanf("%s",&s);
        //calc s;
        ls=strlen(s);
        seq[i].num=i;
        seq[i].len=ls;
        lt=0,rt=0,back=0;
        for (int j=0; j<ls; ++j) //'(' 1  ')' 0
        {
            if (back && q[back-1]==1 && s[j]==')') --back;
            else q[back++]=s[j]=='(';
        }
        for (lt=0; !q[lt] && lt<back; ++lt);
        rt=back-lt;
        seq[i].l=lt; seq[i].r=rt;
    }
    sort(seq,seq+n,cmp);
    aend=-1;
    que.push(make_pair(1,0));
    while (!que.empty())
    {
        int k=-que.top().first, last=que.top().second;
        if (!last && (f[1+k][last]>ans))
        {
            ans=f[1+k][last];
            aend=k;
        }
        for (int i=k+1; seq[i].l<=last && i<n; ++i)
        {
            int new_last=last-seq[i].l+seq[i].r;
            if (f[1+i][new_last]<f[1+k][last]+seq[i].len)
            {
                f[1+i][new_last]=f[1+k][last]+seq[i].len;
                pre[1+i][new_last]=k;
                if (!inq[1+i][new_last])
                {
                    que.push(make_pair(-i,new_last));
                    inq[1+i][new_last]=1;
                }
            }
        }
        que.pop();
    }
    print();
    while(9);
    return 0;
}
