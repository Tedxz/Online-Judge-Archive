/*XJTU 151*/
#include <cstdio>
#include <iostream>

using namespace std;

int a[5], ans = 1000000, tem;

int gcd(int a, int b) {
    if (!b) return a;
    return gcd(b, a % b);
}

int lcm(int a, int b) {
    return a * b / gcd(a, b);
}

int main() {
    for (int i = 0; i < 5; ++i)
        cin >> a[i];
    for (int i = 0; i < 3; ++i)
        for (int j = i + 1; j < 4; ++j)
            for (int k = j + 1; k < 5; ++k) {
                tem = lcm(lcm(a[i], a[j]), a[k]);
                if (ans > tem)
                    ans = tem;
            }
    cout << ans << endl;
    return 0;
}
//tag : 数论
