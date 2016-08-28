/*Ural 1413*/
#include<cstdio>
#include<cmath>
int u,r,ul,ur;
double x,y;
int main()
{
    char ch;
    while (scanf("%c",&ch)!=EOF&&ch!='0')
    {
        switch (ch)
        {
            case '1':--ur;break;
            case '2':--u;break;
            case '3':--ul;break;
            case '4':--r;break;
            case '6':++r;break;
            case '7':++ul;break;
            case '8':++u;break;
            case '9':++ur;break;
        }
    }
    x=r+((double)ur-ul)*sqrt(2.0)/2.0;
    y=u+((double)ur+ul)*sqrt(2.0)/2.0;
    printf("%.10lf %.10lf\n",x,y);
    return 0;
}
                
