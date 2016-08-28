#include <cstdio>
#include <iostream>

using namespace std;

int main() {
    int n, a, b, ans = 0;
    cin >> n;
    for (int i = 0; i < n; ++i) {
        cin >> a >> b;
        if (a <= b-2) ++ans;
    }
    cout << ans << endl;
    return 0;
}
