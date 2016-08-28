#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<algorithm>
#include<cstring>
#include<cmath>
#include<ctime>
#include<map>
#include<string>
#include<vector>
#include<set>
#include<queue>

using namespace std;
#define For(i,l,r) for (lint i = l; i <= r; ++i)
#define Cor(i,l,r) for (lint i = l; i >= r; --i)
#define Fill(a,b) memset(a,b,sizeof(a))
#define FI first
#define SE second
#define MP make_pair
#define PII pair<lint,lint>
#define flt double
#define INF (0x3f3f3f3f)
#define MaxN 1020304
#define MaxNode 1020304
#define MD 1000002013
#define lint long long

PII a[MaxN]; lint r[MaxN];

map<lint,lint> MAP;
priority_queue <PII, vector<PII> > PQ;
lint n,m;

lint Cal(lint l,lint r) {
	lint N = r - l;
	return ((n + n - N + 1) * N / 2) % MD;
}

int main() {
	freopen("input.txt","r",stdin); freopen("output.txt","w",stdout);
	lint T; cin >> T;
	For(TTT,1,T) {
				if(TTT==2) {
					int z = TTT;
				}
			printf("Case #%I64d: ",TTT);
		cin >> n >> m; MAP.clear(); lint ans = 0;
		For(i,1,m) scanf("%I64d%I64d%I64d",&a[i].FI,&r[i],&a[i].SE), MAP[r[i]] += a[i].SE, ans = (ans + (Cal(a[i].FI,r[i]) * a[i].SE % MD)) % MD;
		sort(r + 1,r + m + 1); 
		sort(a + 1,a + m + 1);
		lint p = 0;
		while (!PQ.empty()) PQ.pop();
		For(i,1,m) if (r[i] > r[i - 1] || i == 1) {
			while (a[p + 1].FI <= r[i] && p < m) {
				++p;
				PQ.push(a[p]);
			}
			lint dec = MAP[r[i]];
			while (dec) {
					if(PQ.empty()) {
							int z = i;
						}
				PII top = PQ.top(); PQ.pop();
				if (dec < top.SE) {
					ans = (ans + MD - Cal(top.FI, r[i]) * dec % MD) % MD;
					PQ.push(MP(top.FI,top.SE - dec)); 
					break ;
				}
				ans = (ans + MD - Cal(top.FI,r[i]) * top.SE % MD) % MD, dec -= top.SE;
			}
		}
		cout << ans << endl;
	}
	return 0;
}

