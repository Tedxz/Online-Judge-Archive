//Ural 1110
#include <cstdio>
#include <iostream>

using namespace std;

int n, m, x = 0, y;

int pow(int a, int e, int m) {
    int res = 1;
    for (; e; e >>= 1) {
        if (1 & e) res = res * a % m;
        a = a * a % m;
    }
    return res;
}

int main() {
    cin >> n >> m >> y;
    for (int i = 0; i < m; ++i) {
        if (pow(i, n, m) == y) {
            cout << i << " ";
            x = 1;
        }
    }
    if (!x) cout << -1;
    cout << endl;
    return 0;
}
