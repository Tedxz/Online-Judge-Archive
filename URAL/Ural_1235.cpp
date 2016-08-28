/*Ural 1235*/
#include<cstdio>
#include<algorithm>
const int MAX_N=105;
short x[MAX_N],y[MAX_N];
short n,ans=0,ax,ay,h,w;
inline short min(short a, short b) { return a<b?a:b; }
inline short max(short a, short b) { return a>b?a:b; }
inline void calc(short px, short py)
{
    int tem=min(w-px,h-py);
    for (int i=0; i<n; ++i)
        if (x[i]>px && y[i]>py && tem>max(x[i]-px,y[i]-py))
            //tem<?=max(x[i]-px,y[i]-py);
            tem=max(x[i]-px,y[i]-py);
    if (ans<tem) ans=tem,ax=px,ay=py;
}
int main()
{
    scanf("%hd%hd%hd",&n,&w,&h);
    for (int i=0; i<n; ++i)
    {
        scanf("%hd%hd",&x[i],&y[i]);
    }
    x[n]=0; y[n++]=0;
    for (int i=0; i<n; ++i)
        for (int j=0; j<n; ++j)
        {
            calc(x[i],y[j]);
        }
    printf("%d %d %d",ax,ay,ans);
    return 0;
}
    
    
