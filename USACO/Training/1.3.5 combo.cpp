/*
ID: xie_zhe1
PROB: combo
LANG: C++
*/
#include <cstdio>
#include <iostream>
#include <cmath>
#include <set>

using namespace std;

int n;
int a[6];
int *b = a+3;

set<int> s;

int ans = 1;

void ado(int x) {
    for (int i = -2; i < 3; ++i) {
        s.insert((x+i+n)%n);
    }
}

int main() {
    freopen("combo.in", "r", stdin);
    freopen("combo.out", "w", stdout);
    cin >> n;
    for (int i = 0; i < 7; ++i) {
        cin >> a[i];
    }

    for (int i = 0; i < 3; ++i) {
        s.clear();
        ado(a[i]);
        ado(b[i]);
        ans *= (min(5,n)*2-s.size());
    }
    cout << min(5,n)*min(5,n)*min(5,n)*2-ans << endl;

    return 0;
}
