#include <cstdio>
#include <iostream>
#include <map>
#include <string>
#include <cstdlib>
#include <cstdlib>

using namespace std;

string a, b, list[120];
int T, n, m, cnt;

int main() {
    cin >> T;
    for (int t = 1; t <= T; ++t) {
        cin >> n >> m;
        map<string, string> ma;
        for (int i = 0; i < m; ++i) {
            cin >> a >> b;
            ma[a] = b;
        }
        cnt = 0;
        while (cin >> list[cnt]) {
            for (int i = 1; i < n; ++i) {
                if (!ma.count(list[cnt]))
                    break;
                else
                    list[cnt] = ma[list[cnt]];
            }
            cnt++;
            if (getchar() != ' ') break;
        }
        cout << "Case #" << t << ": ";
        for (int i = 0; i < cnt - 1; ++i) 
            cout << list[i] << " ";
        cout << list[cnt - 1] << endl;
    }
    return 0;
}

