#include <cstdio>
#include <iostream>
#include <cmath>
#include <algorithm>
#include <cstdlib>
#include <utility>

using namespace std;

int main() {
    freopen("he.txt", "w", stdout);
    for (int i = 1; i <= 125; ++i) {
        cout << i << "\t";
        int t = i;
        while (!(t % 2)) {
            cout << 2 << " ";
            t/=2;
        }
        while (!(t % 3)) {
            cout << 3 << " ";
            t/=3;
        }
        while (!(t % 5)) {
            cout << 5 << " ";
            t/=5;
        }
        if (t != 1) cout << "impossible";
        cout << endl;
    }
    return 0;
}
