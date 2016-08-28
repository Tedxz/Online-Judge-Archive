/*Ural 1028*/
//Binary Indexed Tree
#include<cstdio>
#include<algorithm>
#include<iostream>
#include<cstring>
using namespace std;
const int MAX_X=33000, MAX_N=16000;
int n,x,y,ans[MAX_N];
class binary_indexed_tree
{
    private:
        int val[MAX_X];
        int lowbit(int k) {return (k) & (-k);}
    public:
        binary_indexed_tree()
        {
            fill(val,val+MAX_X,0);
        }
        void modify(int pos, int key)
        {
            while (pos<MAX_X)
            {
                val[pos]+=key;
                pos+=lowbit(pos);
            }
        }
        int sum(int pos)
        {
            int tem=0;
            while (pos>0)
            {
                tem+=val[pos];
                pos-=lowbit(pos);
            }
            return tem;
        }
}tree;
int main()
{
    scanf("%d",&n);
    for (int i=1; i<=n; ++i)
    {
        scanf("%d%d",&x,&y);
        ans[tree.sum(++x)]++;
        tree.modify(x,1);
    }
    for (int i=0; i<n; ++i) printf("%d\n",ans[i]);
    return 0;
}
    
        
        
        
        
