/*Ural 1079*/
//Segment Tree
#include<cstdio>
#include<iostream>
#include<algorithm>
using namespace std;
const int MAX_N=100010;
class segment_tree
{
    private:
        int l[MAX_N*4],r[MAX_N*4],a[MAX_N],key[MAX_N*4];
        int max(int a, int b) { return a>b?a:b; }
        void build(int k, int left, int right)
        {
            l[k]=left,r[k]=right;
            if (left==right)
            {
                key[k]=a[left];
                return;
            }
            build(k<<1,left,(left+right)>>1);
            build((k<<1)+1,((left+right)>>1)+1,right);
            key[k]=max(key[k<<1],key[(k<<1)+1]);
            //cout<<k<<' '<<l[k]<<' '<<r[k]<<' '<<key[k]<<endl;
        }
            
    public:
        
        segment_tree()
        {
            a[0]=0,a[1]=1;
            for (int i=2; i<=MAX_N; ++i)
                a[i]=a[i>>1]+(i & 1==1?a[(i>>1)+1]:0);
            build(1,0,MAX_N);
        }
        int get_max(int k, int left, int right)
        {
            if ((left>r[k])||(right<l[k])) return -1;
            if ((left<=l[k])&&(right>=r[k])) return key[k];
            return max(get_max(k<<1,left,right),get_max((k<<1)+1,left,right));
        }
}tree;
int main()
{
    int k;
    for (scanf("%d",&k); k!=0; scanf("%d",&k)) printf("%d\n",tree.get_max(1,1,k));
    return 0;
}
