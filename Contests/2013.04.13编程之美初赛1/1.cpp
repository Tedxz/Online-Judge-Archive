#include <cstdio>
#include <iostream>

using namespace std;

int T, n, a, b;
int sgn(int x) {
    if (x > 0) return 1;
    if (x < 0) return -1;
    return 0;
}
int main() {
    cin >> T;
    for (int t = 1; t <= T; ++t) {
        cin >> n >> a >> b;
        cout << "Case #" << t << ": ";
        if (n == 0) {
            cout << 0 << endl;
            continue;
        }
        if (n == 1) {
            if (a >= b) cout << 1 << endl;
            else cout << -1 << endl;
            continue;
        }
        if (a + b <= n) {
            cout << sgn(a - b) << endl;
            continue;
        }
        if ((b - a) * 2 == n) {
            cout << 0 << endl;
        } else if ((b - a) * 2 <= n){
            cout << 1 << endl;
        } else {
            cout << -1 << endl;
        }
    }
    return 0;
}

