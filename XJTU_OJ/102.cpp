/*XJTU 102*/
#include <cstdio>
#include <iostream>
#include <cmath>
#include <algorithm>

using namespace std;

long long a, b, c, n, m;

int main() {
    cin >> n;
    m = 1 + n + n;
    a = n; b = 1; c = 1;
    for (int i = 1; i < n; ++i) {
        if (n % i) continue;
        for (int j = (int)sqrt(n / i); j > 0; --j) {
            if (n % (i * j)) continue;
            int k = n / i / j;
            if (i * j + j * k + i * k < m) {
                m = i * j + j * k + i * k;
                a = i; b = j; c = k;
            }
            break;
        }
    }
    cout << a << " " << b << " " << c << endl;
    return 0;
}
