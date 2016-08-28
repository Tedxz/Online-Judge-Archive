/*PKU 1004*/
#include<cstdio>
float n=0,x;
int main()
{
    for (short i=0; i<12; ++i) 
    {
        scanf("%f",&x);
        n+=x;
    }
    printf("$%.2f\n",n/12);
    return 0;
}
