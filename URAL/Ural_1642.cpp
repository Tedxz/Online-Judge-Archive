/*Ural 1642*/
#include<cstdio>
#include<algorithm>
using namespace std;
int ans_back,ans_foward,left_max=-10000000,right_min=10000000,n,esc,x;
int main()
{
    scanf("%d%d",&n,&esc);
    for (int i=0; i<n; ++i)
    {
        scanf("%d",&x);
        if (x>0) right_min=min(right_min,x);
        else left_max=max(left_max,x);
    }
    if (esc>right_min || esc<left_max) printf("Impossible\n");
    else 
    {
        if (esc<0) ans_foward=right_min*2-esc,ans_back=-esc;
        else ans_foward=esc,ans_back=-left_max*2+esc;
        printf("%d %d\n",ans_foward,ans_back);
    }
    return 0;
}
