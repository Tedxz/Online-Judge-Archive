#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <utility>
#include <algorithm>
#include <cstring>
#include <string>

#define X first
#define Y second

using namespace std;

int T;
unsigned long long n, p, ans;
double tmp;
int main() {
    cin >> T;
    for (int cs = 1; cs <= T; ++cs) {
        cin >> n >> p;
        ans = 0;
        while (n--) {
            if (p <= pow(2, n - 1)) {
                ans <<= 1;
                break;
            } else {
                ans = (ans << 1) + 1;
                p -= pow(2, n - 1);
            }
        }
        while (n--) ans <<= 1;
        printf("Case #%d: ", cs);
        cout << ans << endl;
    }
    return 0;
}
