#include <cstdio>
#include <iostream>
#include <cstring>

using namespace std;

int T;
long long F[2333][2333];

int main() {
    cin >> T;
    for (int cs = 1; cs <= T; ++cs) {
        int a, b;
        scanf("%d-%d", &a, &b);
        printf("Case #%d: ", cs);
        memset(F, 0, sizeof F);
        F[1][0] = 1;
        for (int i = 1; i <= a; ++i)
        {
            for (int j = 0; j <= min(b, i - 1); ++j)
            {
                if (i - 1 > j)
                    F[i][j] += F[i-1][j];
                if (j > 0)
                    F[i][j] += F[i][j-1];
                if (F[i][j] > 1000000007)
                    F[i][j] %= 1000000007;
            }
        }
        cout << F[a][b] << " ";
        
        memset(F, 0, sizeof F);
        F[0][0] = 1;
        for (int i = 0; i <= b; ++i)
        {
            for (int j = i; j <= b; ++j)
            {
                if (i > 0)
                    F[i][j] += F[i-1][j];
                if (j - 1 >= i)
                    F[i][j] += F[i][j-1];
                if (F[i][j] > 1000000007)
                    F[i][j] %= 1000000007;
            }
        }
        
        cout << F[b][b] << endl;

    }
    return 0;
}
