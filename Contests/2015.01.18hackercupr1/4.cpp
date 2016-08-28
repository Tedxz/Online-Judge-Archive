#include <cstdio>
#include <iostream>
#include <cstring>
#include <iomanip>
#include <vector>

using namespace std;

const int UB = 19;

vector<int> e[200007];

int T, n;
int fa[200007];
int a[UB][200007];

void DFS(int x) {
    for (int p = 0; p < e[x].size(); ++p) {
        DFS(e[x][p]);
    }
    for (int i = 0; i < UB; ++i)
        a[i][x] += i + 1;
    for (int j = 0; j < UB; ++j) {
        int mm = a[(j+1)%UB][x];
        for (int k = 1; k < UB; ++k) {
            mm = min(mm, a[(j+k)%UB][x]);
        }
        a[j][fa[x]] += mm;
    }
        
}

int main() {
    ios::sync_with_stdio(false);
    cin >> T;
    for (int cs = 1; cs <= T; ++cs) {
        cin >> n;
        for (int i = 1; i <= n; ++i) {
            e[i].clear();
        }
        for (int i = 1; i <= n; ++i) {
            cin >> fa[i];
            e[fa[i]].push_back(i);
        }
        memset(a, 0, sizeof a);
        DFS(1);
        
        int mm = a[0][1];
        for (int i = 1; i < UB; ++i)
            mm = min(mm, a[i][1]);
        cout << "Case #" << cs << ": " << mm << endl;
    }
    return 0;
}
