#include <cstdio>
#include <iostream>
#include <utility>
#include <algorithm>

using namespace std;

const int MAX_N = 100001;

pair<int, int> K[MAX_N], C[MAX_N];
int n, m, k, c, ans, an;
int ansv[MAX_N], cnt;

int main() {
    cin >> n >> m;
    for (int i = 1, a, b; i <= n; ++i) {
        scanf("%d%d", &a, &b);
        if (1 & a)
            K[++k] = make_pair(-b, i);
        else
            C[++c] = make_pair(-b, i);
    }
    ++k; ++c;
    sort(K + 1, K + k);
    sort(C + 1, C + c);
    for (int i = 1; i < k; ++i)
        K[i].first = K[i - 1].first - K[i].first;
    for (int i = 1; i < c; ++i)
        C[i].first = C[i - 1].first - C[i].first;
    ans = 0;
    for (int i = 0, tem; i < c && (i << 1) <= m ; ++i) {
        tem = C[i].first + K[min(m - (i << 1), k - 1)].first;
        if (ans < tem) {
            ans = tem;
            an = i;
        }
    }
    cout << ans << endl;
    for (int i = 1; i <= an; ++i)
        ansv[cnt++] = C[i].second;
    for (int i = min(m - (an << 1), k - 1); i > 0; --i)
        ansv[cnt++] = K[i].second;
    sort(ansv, ansv + cnt);
    for (int i = 0; i < cnt; ++i)
        cout << ansv[i] << " ";
    cout << endl;
    return 0;
}
