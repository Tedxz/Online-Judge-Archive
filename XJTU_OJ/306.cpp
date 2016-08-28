/*XJTU 306*/
#include <cstdio>
#include <iostream>
#include <utility>
#include <algorithm>

using namespace std;

int n, m, ans;
pair<int, pair<int, int> > edge[5010];
int anc[110];

int find(int x) {
	if (anc[x] == anc[anc[x]])
		return anc[x];
	return anc[x] = find(anc[x]);
}
void uni(int x, int y) {
	anc[find(x)] = find(y);
}

int main() {
	while (cin >> n >> m) {
		ans = 0;
		for (int i = 1; i <= n; ++i)
			anc[i] = i;
		for (int i = 1; i <= m; ++i) 
			cin >> edge[i].second.first >> edge[i].second.second >> edge[i].first;
		sort(edge + 1, edge + m + 1);
		for (int i = 1; i <= m; ++i) {
			if (find(edge[i].second.first) == find(edge[i].second.second)) {
				ans += edge[i].first;
				continue;
			}
			uni(edge[i].second.first, edge[i].second.second);
		}
		cout << ans << endl;
	}
	return 0;
}
//tag : 最小生成树
