/*Ural 1219*/
#include<cstdio>
#include<cstdlib>
int main()
{
    for (int i=0;i<1000000;++i) printf("%c", (rand()%26)+97 );
    printf("\n");
    return 0;
}
