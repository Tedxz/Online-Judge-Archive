/*XJTU 152*/
#include <cstdio>
#include <iostream>

using namespace std;

int n, ans;

bool chk(int n) {
    if (n < 100) return true;
    if (n < 1000)
        if ((n / 10) % 10 - n % 10 == n / 100 - (n / 10) % 10)
            return true;
    return false;
}

int main() {
    cin >> n;
    if (n < 100) {
        cout << n;
        return 0;
    }
    ans = 99;
    for (int i = 111; i <= n; ++i)
        ans += chk(i);
    cout << ans << endl;
    return 0;
}
//tag : 水题
