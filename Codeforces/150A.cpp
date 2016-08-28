#include <cstdio>
#include <iostream>

using namespace std;

const int MAX_N = 33, MAX_K = 33;

int n, k, a[MAX_K];
bool u[MAX_N * MAX_K];

int main() {
    cin >> n >> k;
    for (int i = 1; i <= k; ++i) {
        cin >> a[i];
        u[a[i]] = true;
    }
    for (int i = 1, l = 1; i <= k; ++i) {
        cout << a[i];
        for (int j = 1; j < n; ++j) {
            while (u[l]) ++l;
            cout << " " << l++;
        }
        cout << endl;
    }
    return 0;
}
