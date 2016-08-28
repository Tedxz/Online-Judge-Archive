/*PKU 3225*/
#include<cstdio>
#define none -32768
const int LIM=65536*2;
class segment_tree
{
    private:
        short mark[LIM*2];
        bool rev[LIM*2];
        int left[LIM*2],right[LIM*2];
        int pos[LIM*2];
        int L,R,C;
        bool flag,p;
        void build(const int &k, const int &L, const int &R)
        {
            left[k]=L; right[k]=R; mark[k]=false; rev[k]=false;
            if (L==R) { pos[L]=k; return; }
            build(k*2  ,L         ,(L+R)>>1);
            build(k*2+1,(L+R+2)>>1,R       );
        }
        inline void down(const int &k)
        {
            if (rev[k] && mark[k]!=none) { mark[k]=!mark[k]; rev[k]=false;}
            if (left[k]==right[k]) return;
            if (mark[k]!=none)
            {
                mark[k*2]=mark[k*2+1]=mark[k];
                rev[k*2]=rev[k*2+1]=false;
                mark[k]=none;
            }
            if (rev[k]) { rev[k*2]=!rev[k*2]; rev[k*2+1]=!rev[k*2+1]; rev[k]=false; }
        }
        void paint(const int &k)
        {
            if (left[k]>R || right[k]<L) return;
            if (L<=left[k] && right[k]<=R) { mark[k]=C; rev[k]=false; return; }
            down(k);
            paint(k*2); paint(k*2+1);
        }
        void reverse(const int &k)
        {
            if (left[k]>R || right[k]<L) return;
            if (L<=left[k] && right[k]<=R && mark[k]!=none) { mark[k]=!mark[k]; return; }
            if (L<=left[k] && right[k]<=R) { rev[k]=!rev[k]; return; }   
            down(k);
            reverse(k*2); reverse(k*2+1);
        }
        inline void print(const bool &f, const int &pos)
        {
            if (f)
            {
                if (p) printf(" ");
                if (pos&1) printf("[%d,",(int)pos/2);
                else printf("(%d,",(int)pos/2-1);
            }
            else
            {
                if (pos&1) printf("%d]",(int)pos/2);
                else printf("%d)",(int)pos/2);
            }
            p=1;
        }
        void count(const int &k)
        {
            if (mark[k]!=none)
            {
                if (rev[k]) { mark[k]=!mark[k]; rev[k]=false; }
                if (mark[k]!=flag)
                {
                    if (flag) print(0,left[k]-1);
                    else print(1,left[k]);
                    flag=!flag;
                }
                return;
            }
            down(k);
            count(k*2); count(k*2+1);
        }
    public:
        segment_tree() { build(1,1,65536*2); }
        void paint(const int &l, const int &r, const int &color)
        {
            if (l>r) return;
            L=l; R=r; C=color;
            paint(1);
        }
        void reverse(const int &l, const int &r)
        {
            if (l>r) return;
            L=l; R=r;
            reverse(1);
        }
        void count()
        {
            flag=0; p=0;
            count(1);
            if (!p) printf("empty set\n"); else printf("\n");
        }
}t;
int main()
{
    int l,r;
    char cmd,lc,rc;
    while (scanf(" %c %c%d,%d%c",&cmd,&lc,&l,&r,&rc)==5)
    {
        l=(l<<1)+1+(lc=='(');
        r=(r<<1)+(rc==']');
        switch (cmd)
        {
            case 'U':
                t.paint(l,r,1);
                break;
            case 'I':
                t.paint(1,l-1,0);
                t.paint(r+1,131071,0);
                break;
            case 'D':
                t.paint(l,r,0);
                break;
            case 'C':
                t.paint(1,l-1,0);
                t.paint(r+1,131071,0);
                t.reverse(l,r);
                break;
            case 'S':
                t.reverse(l,r);
                break;
        }
    }
    t.count();
    return 0;
}
