/*XJTU 296*/
#include <cstdio>
#include <iostream>
#include <string>
#include <cstring>

using namespace std;

int a[110], b[110], c[210];
int la, lb, lc;
string s;

int main() {
    while (true) {
        memset(a, 0, sizeof a);
        memset(b, 0, sizeof b);
        memset(c, 0, sizeof c);
        s = "";
        cin >> s;
        la = s.length();
        if (la == 0)
            break;
        for (int i = 0; i < s.length(); ++i)
            a[la - i - 1] = s[i] - 48;
        cin >> s;
        lb = s.length();
        for (int i = 0; i < s.length(); ++i)
            b[lb - i - 1] = s[i] - 48;
        
        for (int i = 0; i < la; ++i)
            for (int j = 0; j < lb; ++j) {
                c[i + j] += a[i] * b[j];
                c[i + j + 1] += c[i + j] / 10;
                c[i + j] %= 10;
            }
        lc = la + lb;
        while (lc > 1 && c[lc - 1] == 0) --lc;
        while (lc > 0) cout << c[--lc];
        cout << endl;
    }
    return 0;
}
//tag : 高精度
