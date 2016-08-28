/*PKU 3264*/
#include<cstdio>
const int MAX_N=50010;
int n,m;
int a[MAX_N];
int vmax[131072],vmin[131072],l[131072],r[131072];
class segment_tree
{
    private:
        int max(int a, int b) { return a>b?a:b; }
        int min(int a, int b) { return a<b?a:b; }
        void build(int k, int left, int right)
        {
            l[k]=left,r[k]=right;
            if (left==right) 
            {
                vmax[k]=a[left],vmin[k]=a[left];
                return ;
            }
            build(k*2,left,(left+right)>>1);
            build(k*2+1,((left+right)>>1)+1,right);
            vmin[k]=min(vmin[k*2],vmin[k*2+1]);
            vmax[k]=max(vmax[k*2],vmax[k*2+1]);
        }   
        int get_max(int k, int left, int right)
        {
            if (left<=l[k] && r[k]<=right) return vmax[k];
            if (left>r[k] || right<l[k]) return 0;
            return max(get_max(k*2,left,right),get_max(k*2+1,left,right));
        }
        int get_min(int k, int left, int right)
        {
            if (left<=l[k] && r[k]<=right) return vmin[k];
            if (left>r[k] || right<l[k]) return 0x1000000;
            return min(get_min(k*2,left,right),get_min(k*2+1,left,right));
        }
    public:
        segment_tree(int n)
        {
            build(1,1,n);
        }
        int get_delta(int left, int right)
        {
            return get_max(1,left,right)-get_min(1,left,right);
        }
};
int main()
{
    int left,right;
    scanf("%d%d",&n,&m);
    for (int i=1; i<=n; ++i) scanf("%d",&a[i]);
    segment_tree tree(n);
    for (int i=0; i<m; ++i)
    {
        scanf("%d%d",&left,&right);
        printf("%d\n",tree.get_delta(left,right));
    }
    return 0;
}
