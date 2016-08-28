//Codeforces 309/c
//״ѹDP 
#include <cstdio>
#include <iostream>
#include <cstring>
#include <algorithm>

using namespace std;

#define bit(x) (1 << x)
#define MAX_LG 32

int n, m, ans;
int mc[MAX_LG];
int b[MAX_LG];

void getInt(int &x) {
    for (x = getchar() - '0'; x < 0 || x > 9; ) x = getchar() - '0';
    for (char c = getchar(); c >= '0' && c <= '9'; c = getchar()) x = x * 10 + c - '0';
}

int main() {
    getInt(n); getInt(m);
    for (int a; n--; ) {
        getInt(a);
        for (int j = 0; j < MAX_LG; ++j)
            if (a & bit(j)) ++mc[j];
    }
    for (int x; m--; ) {
        getInt(x);
        ++b[x];
    }
    for (int i = 0, j = 0; i < MAX_LG; ++i) {
        for (int p = 0; p < b[i]; ++p) {
            while (j < i) ++j;
            if (!mc[j]) {
                for (int k = j; ; ++k) {
                    if (k == 32) goto print;
                    if (mc[k] == 0) mc[k] = 1;
                    else {
                        --mc[k];
                        break;
                    }
                }
                ++mc[j];
            }
            --mc[j]; ++ans;
        }
    }
    print:
    cout << ans << endl;
    return 0;
}
