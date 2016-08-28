#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <cassert>
#include <utility>
#include <cstring>
#include <algorithm>

using namespace std;

#define Lc(x) (x << 1)
#define Rc(x) ((x << 1) + 1)

const int MAX_N = 500007, MAX_S = MAX_N * 4;

int n, T, ans1, ans2;
pair<int, int> pos[MAX_N];
string s[MAX_N];

class IT {
public:
    int L[MAX_S], R[MAX_S], B[MAX_S], S[MAX_S];
    void build(int k, int l, int r) {
        //cerr << k << " " << l << " " << r << endl;
        L[k] = l; R[k] = r;
        B[k] = 0; S[k] = n + 1;
        if (l == r)
            return;
        build(Lc(k), l, (l + r) >> 1);
        build(Rc(k), (l + r + 2) >> 1, r);
    }
    void reset() {
        build(1, 1, n);
    }
    IT() {
        /*
        memset(L, 0, sizeof L);
        memset(R, 0, sizeof R);
        memset(S, 0, sizeof S);
        memset(B, 0, sizeof B);
        */
        //reset();
    }
    void insert(int k, int v) {
        if (v < L[k] || v > R[k]) return;
        S[k] = min(S[k], v);
        B[k] = max(B[k], v);
        if (L[k] == R[k]) return;
        insert(Lc(k), v);
        insert(Rc(k), v);
    }
    int getB(int k, int lb, int rb) {
        assert(lb == 1);
        if ((rb < L[k]) || (lb > R[k]))
            return 0;
        if ((lb <= L[k]) && (R[k] <= rb))
            return B[k];
        return max(getB(Lc(k), lb, rb), getB(Rc(k), lb, rb));
    }
    int getS(int k, int lb, int rb) {
        assert(rb == n);
        if ((rb < L[k]) || (lb > R[k]))
            return n + 1;
        if ((lb <= L[k]) && (R[k] <= rb))
            return S[k];
        return min(getS(Lc(k), lb, rb), getS(Rc(k), lb, rb));
    }
    
}it;

char exs(int k, int pos) {
    if (s[k].length() > pos)
        return s[k][pos];
    return '0';
}

string genS(int l, int r) {
    int pos = 0;
    string st;
    //cout << l << " " << r << endl;
    //cout << s[l] << endl << s[r] << endl;
    while (exs(l, pos) == exs(r, pos)) ++pos;
    assert(exs(l, pos) == '0');
    assert(exs(r, pos) == '1');
    for (pos += 1; ; ++pos) {
        if (exs(l, pos) == '0') {
            ans1 += pos + 1;
            st.reserve(pos + 2);
            for (int j = 0; j < pos; ++j) {
                st += exs(l, j);
                ans2 += (st[j] == '1');
            }
            st += '1';
            ++ans2;
            return st;
        }
        if (exs(r, pos) == '1') {
            ans1 += pos + 2;
            st.reserve(pos + 3);
            for (int j = 0; j < pos; ++j) {
                st += exs(r, j);
                ans2 += (st[j] == '1');
            }
            st += '0';
            st += '1';
            ++ans2;
            return st;
        }
    }
    
}

int main() {
    scanf("%d", &T);
    for (int t = 1; t <= T; ++t) {
        //memset(s, 0, sizeof s);
        scanf("%d", &n);
        s[0] = "0";
        s[n + 1] = "1";
        ans1 = 2;
        ans2 = 1;
        it.reset();
        for (int i = 1, x; i <= n; ++i) {
            scanf("%d", &pos[i].first);
            pos[i].second = i;
        }
        sort(pos + 1, pos + n + 1);
        for (int i = 1; i <= n; ++i) {
            pos[i].first = pos[i].second;
            pos[i].second = i;
        }
        sort(pos + 1, pos + n + 1);
        for (int i = 1, ml, mr; i <= n; ++i) {
            ml = it.getB(1, 1, pos[i].second);
            mr = it.getS(1, pos[i].second, n);
            it.insert(1, pos[i].second);
            s[pos[i].second] = genS(ml, mr);
            //cout << i << " " << pos[i].second << " " << ml << " " << mr << endl;
        }
        //for (int i = 0; i <= n + 1; ++i) {
        //    cout << s[i] << endl;
        //}
        printf("Case #%d: %d %d\n", t, ans1, ans2);
    }
    return 0;
}
