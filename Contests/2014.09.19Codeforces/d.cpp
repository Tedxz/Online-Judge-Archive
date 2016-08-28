#include <cstdio>
#include <iostream>
#include <string>
#include <hash_map>
#include <map>
#include <vector>
#include <cctype>
#include <cstring>
#include <iterator>

using namespace std;

struct info {
    bool canR;
    int minLen;
    int minLenR;
    info() {
        canR = false;
        minLen = 1000000;
        minLenR = 1000000;
    }
};

int n;
int m;

map<string, int> dict;
vector<int> essay;
vector<int> e[500007];
int minR[500007];
int minLen[500007];
int v[500007];
int num = 0;

int idict(string s) {
    //s = tolower(s);
    for (int i = 0; i < s.length(); ++i)
        s[i] = tolower(s[i]);
    if (dict[s] == 0) dict[s] = ++num;
    int x = dict[s];
    minR[x] = 0;
    for (int i = 0; i < s.length(); ++i)
        minR[x] += (int)(s[i] == 'r');
    minLen[x] = s.length();
    // cout << x << " " << s << " " << minR[x] << " " << minLen[x] << endl;
    return x;
}


pair<int, int> dfs(int x) {
    pair<int, int> t = make_pair(minR[x], minLen[x]);
    if (v[x]) return t;
    v[x] = true;
    for (int i = 0; i < e[x].size(); ++i) {
        pair<int, int> t = dfs(e[x][i]);
        if (minR[x] > t.first || (minR[x] == t.first && minLen[x] > t.second)) {
            minR[x] = t.first;
            minLen[x] = t.second;
        }
    }
    return make_pair(minR[x], minLen[x]);
}

int main() {
    cin >> n;
    essay.reserve(n);
    for (int i = 0; i < n; ++i) {
        string s;
        cin >> s;
        essay.push_back(idict(s));
    }
    cin >> m;
    for (int i = 0; i < m; ++i) {
        string a, b;
        cin >> a >> b;
        e[idict(a)].push_back(idict(b));
    }
    for (int i = 1; i <= num; ++i) {
        memset(v, 0, sizeof v);
        dfs(i);
    }
    // for (map<string, int>::iterator i = dict.begin(); i != dict.end(); ++i) {
    //     cout << i->second << " " << i->first << "\t" ;
    //     cout << minR[i->second] << " " << minLen[i->second] << endl;
    // }
    int ar = 0, al = 0;
    for (int i = 0; i < essay.size(); ++i) {
        //cout << i << endl;
        ar += minR[essay[i]];
        al += minLen[essay[i]];
    }
    cout << ar << " " << al << endl;;
    return 0;
}
