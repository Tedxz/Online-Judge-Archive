/*URAL P1068*/
#include<iostream>
#include<cmath>
using namespace std;
int main()
{
    long long n;
    cin>>n;
    n=(1+n)*(abs(1-n)+1)/2;
    cout<<n<<endl;
    return 0;
}
