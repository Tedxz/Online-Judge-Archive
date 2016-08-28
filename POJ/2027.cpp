/*PKU 2027*/
#include<cstdio>
int n,x,y;
int main()
{
    scanf("%d",&n);
    for (int i=0; i<n; ++i)
    {
        scanf("%d%d",&x,&y);
        x>=y?printf("MMM BRAINS\n"):printf("NO BRAINS\n");
    }
    return 0;
}
    
