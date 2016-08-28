/*PKU 2777*/
#include<cstdio>
const int MAX_N=100010, LIMIT=131075*2;
int len,t,o;
int l[LIMIT],r[LIMIT],c[LIMIT];
class segment_tree
{
    private:
    public:
        int L,R,C;
        int popcount(int x)
        {
            x=(x & 0x55555555)+((x>>1) & 0x55555555);
            x=(x & 0x33333333)+((x>>2) & 0x33333333);
            x=(x & 0x0F0F0F0F)+((x>>4) & 0x0F0F0F0F);
            x=(x & 0x00FF00FF)+((x>>8) & 0x00FF00FF);
            x=(x & 0x0000FFFF)+((x>>16) & 0x0000FFFF);
            return x;
        }
        void build(int k, int left, int right)
        {
            l[k]=left, r[k]=right, c[k]=2;
            if (left==right) return;
            build(k*2,left,(left+right)>>1);
            build(k*2+1,((left+right)>>1)+1,right);
        }   
        int q(int k)
        {
            if (R<l[k] || L>r[k]) return 0;
            if ((L<=l[k] && r[k]<=R) || popcount(c[k])==1) return c[k];
            if (popcount(c[k])==1) c[k*2]=c[k*2+1]=c[k];  //down k
            return q(k*2) | q(k*2+1);
        }
        void cl(int k)
        {
            
            if (R<l[k] || L>r[k]) return;
            if (L<=l[k] && r[k]<=R) { c[k]=1<<C; return; }
            if (popcount(c[k])==1) c[k*2]=c[k*2+1]=c[k];  //down k
            cl(k*2); cl(k*2+1);
            c[k]=c[k*2]|c[k*2+1];                         //updata k
        }
    public:
        segment_tree()
        {
            build(1,1,len);
        }
        int query(int left, int right)
        {
            L=left; R=right;
            return popcount(q(1));
        }
        void color(int left, int right, int col)
        {
            L=left; R=right; C=col;
            cl(1);
        }
};
int main()
{
    scanf("%d%d%d",&len,&t,&o);
    segment_tree tree;
    char ch;
    int left,right,col;
    for (int i=0; i<o; ++i)
    {
        //scanf("%s",&ch);
        ch=getchar();
        while (ch!='P' && ch!='C') ch=getchar();
        switch (ch=='C')
        {
            case 1:scanf("%d%d%d",&left,&right,&col);
                   tree.color(left,right,col);
                   //printf("colored\n");
                   break;
            case 0:scanf("%d%d",&left,&right);
                   printf("%d\n",tree.query(left,right));
                   //printf("query\n");
                   break;
        }
    }
    return 0;
}
        
            
            
