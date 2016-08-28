//Ural 1196
#include <cstdio>
#include <iostream>
#include <set>

using namespace std;

set<int> tl;
int n, ans = 0, x;

int main() {
    scanf("%d", &n);
    while (n--) {
        scanf("%d", &x);
        tl.insert(x);
    }
    scanf("%d", &n);
    while (n--) {
        scanf("%d", &x);
        ans += tl.count(x);
    }
    cout << ans << endl;
    return 0;
}
