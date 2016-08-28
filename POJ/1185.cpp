/*PKU 1185*/
#include <cstdio>
#include <iostream>
#include <cstring>
#include <cmath>

using namespace std;

const int MAX_N = 110, MAX_M = 12, MAX_R = 200;

int n, m, t, cnt;
int M[MAX_N], F[MAX_N][MAX_R][MAX_R], P[MAX_R], S[MAX_R], ans = 0;
char s[13];

int bitcount(int x) {
    int res;
    for (res = 0; x; x = x >> 1) 
        res += 1 & x;
    return res;
}

int main() {
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= n; ++i) {
        scanf("%s", &s);
        t = 0;
        for (int j = 0; j < m; ++j) {
            t <<= 1;
            t += (s[j] == 'H');
        }
        M[i] = t;
        //cout << M[i] << endl;
    }
    
    for (int i = 0; i < (1 << m); ++i) {
        if  (!((i << 1 & i) || (i << 2 & i) || (i >> 1 & i) || (i >> 2 & i))) {
            P[cnt] = i;
            S[cnt] = bitcount(i);
            ++cnt;
        }
    }
    
    memset(F, 0, sizeof F);
    for (int i = 0; i < cnt; ++i) {
        if ((P[i] & M[1]) == 0) {
            F[1][0][i] = S[i];
            ans = max(ans, F[1][0][i]);
            //cout << 1 << " " << P[0] << " " << P[i] << " " << F[1][0][i] << endl;
        }
    }
    
    for (int i = 2; i <= n; ++i) {
        for (int j = 0; j < cnt; ++j) {
            if (P[j] & M[i - 2]) continue;
            for (int k = 0; k < cnt; ++k) {
                if (P[k] & M[i - 1]) continue;
                if (P[k] & P[j]) continue;
                for (int l = 0; l < cnt; ++l) {
                    t = P[j] | P[k] | M[i];
                    if (P[l] & t) continue;
                    F[i][k][l] = max(F[i][k][l], F[i - 1][j][k] + S[l]);
                    ans = max(ans, F[i][k][l]);
                    //cout << i << " " << P[k] << " " << P[l] << " " << F[i][k][l] << endl;
                }
            }
        }
    }
    
    printf("%d\n", ans);
    
    return 0;
}
