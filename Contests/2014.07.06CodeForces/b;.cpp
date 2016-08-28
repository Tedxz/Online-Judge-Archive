#include <cstdio>
#include <iostream>
#include <algorithm>
#include <map>

using namespace std;

pair<int, int> chem[100];
int react[100][100];
int n, m;

int main() {
    cin >> n >> m;
    for (int i = 1; i <= n; ++i)
        chem[i].second = i;
    for (int i = 0; i < m; ++i) {
        int x, y;
        cin >> x >> y;
        ++chem[x].first;
        ++chem[y].first;
        react[x][y] = react[y][x] = 1;
    }
    sort(chem + 1, chem + n + 1);
    long long ans = 1;
    for (int i = 1; i < n; ++i) {
        int flag = false;
        for (int j = i + 1; j <= n; ++j) {
            if (react[chem[i].second][chem[j].second]) {
                flag = true;
                break;
            }
        }
        if (flag) ans = ans * (long long)2;
    }
    cout << ans << endl;
    return 0;
}
