#include <cstdio>
#include <iostream>
#include <queue>
#include <string>

using namespace std;

const int MAX_N = 50001;

string s;
int a, b, l, blc = 0;
long long ans = 0;
priority_queue<pair<int, int> > heap;

int main() {
    cin >> s;
    l = s.length();
    for (int i = 0; i < l; ++i) {
        if (s[i] == '(') ++blc;
        if (s[i] == ')') --blc;
        if (s[i] == '?') {
            cin >> a >> b;
            --blc;
            ans -= b;
            heap.push(make_pair(b - a, i));
            s[i] = ')';
        }
        if (blc < 0) {
            if (heap.empty()) {
                cout << -1 << endl;
                return 0;
            }
            ans += heap.top().first;
            s[heap.top().second] = '(';
            heap.pop();
            blc += 2;
        }
    }
    if (blc != 0) 
        cout << -1 << endl;
    else
        cout << -ans << endl << s << endl;
    return 0;
}
