#include <cstdio>
#include <iostream>
#include <cstring>
#include <utility>
#include <algorithm>

using namespace std;

typedef long long ll;

ll n, ans = 0;

int main() {
    cin >> n;
    while (!(n % 3))
        n /= 3;
    ans = (n + 2) / 3;
    cout << ans << endl;
}
