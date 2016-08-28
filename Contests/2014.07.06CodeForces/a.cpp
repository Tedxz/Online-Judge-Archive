#include <cstdio>
#include <iostream>

using namespace std;

const int MAX_N = 107;

int n, m;
char cb[MAX_N][MAX_N];
int main() {
    cin >> n >> m;
    for (int i = 0; i < n; ++i) {
        cin >> cb[i];
    }
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            char chess = (1 & (i + j)) ? 'W' : 'B';
            if (cb[i][j] == '.')
                cb[i][j] = chess;
        }
    }
    for (int i = 0; i < n; ++i)
        cout << cb[i] << endl;
    return 0;
}
