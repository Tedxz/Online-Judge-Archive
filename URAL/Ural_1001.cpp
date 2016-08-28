/*URAL P1001*/
#include<iostream>
#include<cstdio>
#include<vector>
#include<iterator>
#include<cmath>
using namespace std;
vector<__int64> vect;
__int64 n;
int main()
{
    while (scanf("%lld",&n)>0)
    {
        vect.push_back(n);
    }
    for (vector<__int64>::iterator iter=vect.end()-1; iter>=vect.begin(); --iter)
    {
        printf("%.4lf\n",sqrt((long double)*iter));
    }
    return 0;
}
