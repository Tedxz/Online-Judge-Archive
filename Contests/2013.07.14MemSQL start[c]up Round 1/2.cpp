#include <cstdio>
#include <iostream>
#include <vector>
#include <algorithm>

#define gen(x) ((x << i) + ((long long)1 << (i - 1)))

using namespace std;

const long long INF = 1E18;

long long n;
vector<long long> ans;

long long calc(long long x) {
    long long res = 0;
    while (x) {
        if (1 & x && x != 1) {
            res += (x - 1) * x / 2;
            break;
        }
        x /= 2;
        res += x;
    }
    return res;
}

int main() {
    cin >> n;
    for (int i = 1; i <= 61; ++i) {
        long long L = 0, R = ((long long)1E9 >> i) + 1, M = (L + R) >> 1;
        while (calc(gen(R)) < n) {
            if (gen(R) > 2305843009213693952) continue;
            L = R + 1;
            R <<= 1;
        }
        for (; L < R; M = (L + R) >> 1) {
            if (calc(gen(M)) >= n) R = M;
            else L = M + 1;
        }
        if (calc(gen(L)) == n)  {
            ans.push_back(gen(L));
        }
    }
    sort(ans.begin(), ans.end());
    ans.erase(unique(ans.begin(), ans.end()), ans.end());
    for (vector<long long>::iterator i = ans.begin(); i != ans.end(); ++i) {
        cout << *i << endl;
    }
    if (ans.size() == 0) cout << "-1" << endl;
    return 0;
}
