/*XJTU 105*/
#include <cstdio>
#include <cstring>
#include <iostream>

using namespace std;

int n;
int a[10009];
int f[10009][4];

const int bitcount[4] = { 0, 1, 1, 2 };

int main() {
    cin >> n;
    for (int i = 1; i <= n; ++i) 
        cin >> a[i];
    if (a[1] == 3) {
        cout << 0 << endl;
        return 0;
    }
    memset(f, 0, sizeof f);
    for (int i = 0; i < 4; ++i)
        f[1][i] = (a[1] == bitcount[i]);
    
    for (int i = 1; i < n; ++i) 
        for (int j = 0; j < 4; ++j)
            if (f[i][j]) {
                if (bitcount[j] == a[i + 1])
                    ++f[i + 1][(j << 1) & 3];
                if (bitcount[j] == a[i + 1] - 1)
                    ++f[i + 1][((j << 1) & 3) + 1];
                    
            }
    cout << f[n][2] + f[n][0] << endl;
    return 0;
}
//tag : 递推
