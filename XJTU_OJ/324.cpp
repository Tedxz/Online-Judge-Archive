/*XJTU 324*/
#include <cstdio>
#include <iostream>

using namespace std;

int n;

int main() {
    cin >> n;
    for (int i = n - 1; i > 1; --i) {
        if ((n % i == 0) && (1 & i) && (n / i - (i >> 1) > 0))
            cout << n / i - (i >> 1) << " " << n / i + (i >> 1) << endl;
        if ((n % i) && !(n * 2 % i) && !(1 & i) && (n / i - (i >> 1) >= 0))
            cout << n / i - (i >> 1) + 1 << " " << n / i + (i >> 1) << endl;
    }
    return 0;
}
//tag : 水题
