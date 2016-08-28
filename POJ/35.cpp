#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <utility>
#include <algorithm>

using namespace std;

int n, m, c[100007], d[100007], b[100007], ans;
pair<int, int> arr[100007];
bool flag;

int main() {
    while (cin >> n >> m) {
        for (int i = 0; i < n; ++i) {
            cin >> b[i];
        }
        for (int i = 0; i < m; ++i) {
            cin >> arr[i].second;
        }
        for (int i = 0; i < m; ++i) {
            cin >> arr[i].first;
        }
        sort(arr, arr + m);
        for (int i = 1; i < m; ++i) {
            if (arr[i].second < arr[i - 1].second)
                arr[i].second = arr[i - 1].second;
        }
        ans = 0;
        flag = false;
        for (int i = 0, L, R, M; i < n; ++i) {
            for (L = 0, R = m - 1; L < R; ) {
                M = (L + R) >> 1;
                if (arr[M].second >= b[i])
                    R = M;
                else
                    L = M + 1;
            }
            if (arr[L].second >= b[i]) ans += arr[L].first;
            else {
                cout << "No" << endl;
                flag = true;
                break;
            }
        }
        if (!flag)
            cout << ans << endl;
    }
    return 0;
}
