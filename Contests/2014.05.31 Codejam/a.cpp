#include <cstdio>
#include <iostream>
#include <algorithm>

using namespace std;

int T, x, n, s[10007];

int main() {
    freopen("A-small-attempt1.in", "r", stdin);
    freopen("A.out", "w", stdout);
    
    cin >> T;
    for (int cs = 1; cs <= T; ++cs) {
        cin >> n >> x;
        for (int i = 0; i < n; ++i)
            cin >> s[i];
        sort(s, s + n);
        int ans = 0;
        for (int l = 0, r = n - 1; r >= l;) {
            ++ans;
            if (l == r) {
                break;
            }
            if (s[l] + s[r] <= x) {
                ++l;
                --r;
            }
            else
                --r;
                
        }
        printf("Case #%d: %d\n", cs, ans);
    }
    return 0;
}
