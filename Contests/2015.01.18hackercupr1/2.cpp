#include <cstdio>
#include <iostream>
#include <string>
#include <cstring>
#include <set>
#include <iomanip>
#include <algorithm>

using namespace std;

set<string> s;
string st;

int cpl(const string &s1, const string &s2) {
    int res = 0;
    for (; res < s1.length() && res < s2.length() && s1[res] == s2[res]; ++res);
    //cout << s1 << " " << s2 << " " << res << endl;
    return res + 1;
}

int main() {
    int T, n;
    cin >> T;
    for (int cs = 1; cs <= T; ++cs) {
        cin >> n;
        s.clear();
        int ans = 0;
        st = "";
        s.insert(st);
        st = "~";
        s.insert(st);
        for (int i = 0; i < n; ++i) {
            cin >> st;
            s.insert(st);
            set<string>::iterator i1 = s.find(st);
            set<string>::iterator i2 = s.find(st);
            ++i1; --i2;
            int l1 = cpl(st, *i1);
            int l2 = cpl(st, *i2);
            
            ans += min((int)st.length(), max(l1, l2));
        }
        cout << "Case #" << cs << ": " << ans << endl;
    }
}
