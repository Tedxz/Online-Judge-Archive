#include <cstdio>
#include <iostream>

using namespace std;


int main() {
    freopen("a.txt", "w", stdout);
    cout << 217125 << endl;
    for (int i = 1; i <= 30; ++i)
        for (int j = 1; j <= 30; ++j)
            for (int k = 0; k <= i * j; ++k)
                cout << i << " " << j << " " << k << endl;
    return 0;
}
