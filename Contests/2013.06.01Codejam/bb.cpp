#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<algorithm>
#include<cstring>
#include<cmath>

using namespace std;
#define For(i,l,r) for (ll i = l; i <= r; ++i)
typedef long long ll;

ll n,m,p;
ll calc(ll x,ll p,ll w) {
    ll t, tp;
	if (!w) {
        tp = m;
		t = x;
		for (; t > 0; t = (t - 1) / 2) {
			tp >>= 1;
			if (p <= tp) return false;
			p -= tp;
		}
		return true;
	} else {
		tp = m;
		t = m - x - 1; 
        for (; t > 0; t = (t - 1) / 2) {
			tp >>= 1;
		}
        if (p >= tp) return true;
        return false;
    }
}
ll T;
int main() {
	freopen("B-large.in","r",stdin);
    freopen("b.out","w",stdout);
	cin >> T;
	for (int cs = 1; cs <= T; ++cs)
    {
        cout << "Case #" << cs << ": " ;
		cin >> n >> p;
		m = 1ll << n;
		for (int w = 0; w <= 1; ++w) {
			ll l = 0, r = m - 1;
			while (l < r) {
				ll mid = l + r + 1 >> 1;
				if (calc(mid,p,w)) l = mid;
                 else r = mid - 1;
			}
			cout << l << " ";
		}
		cout << endl;
	}
	return 0;
}

