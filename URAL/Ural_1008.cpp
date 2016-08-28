/*Ural 1008*/
#include <cstdio>
#include <iostream>
#include <utility>
#include <vector>
#include <algorithm>

using namespace std;

const int dx[] = { 1, 0, -1, 0 };
const int dy[] = { 0, 1, 0, -1 };
const char cd[] = { 'R', 'T', 'L', 'B' };

int n, x = -1, y;
bool a[11][11];

pair<int, int> q[150];
int head, tail;

vector<pair<int, int> > ans;

void BFS() {
    int tx, ty;
    head = 0; tail = 1;
    q[head] = make_pair(x, y);
    a[x][y] = false;
    while (head != tail) {
        tx = q[head].first;
        ty = q[head].second;
        ++head;
        for (int i = 0; i < 4; ++i) {
            if (a[tx + dx[i]][ty + dy[i]]) {
                q[tail++] = make_pair(tx + dx[i], ty + dy[i]);
                a[tx + dx[i]][ty + dy[i]] = false;
                putchar(cd[i]);
            }
        }
        puts(head == tail? "." : ",");
        
    }
}

bool cmp(pair<int, int> a, pair<int, int> b) {
    return (a.first < b.first) || ((a.first == b.first) && (a.second < b.second));
}

void BFS2() {
    head = 0; tail = 1;
    q[head] = make_pair(x, y);
    a[x][y] = true;
    ans.push_back(q[tail - 1]);   
    while (head != tail) {
        int tx, ty;
        tx = q[head].first;
        ty = q[head].second;
        ++head;
        char s[6];
        scanf("%s", &s);
        for (int i = 0; s[i]; ++i) {
            for (int j = 0; j < 4; ++j) {
                if (s[i] == cd[j]) {
                    q[tail++] = make_pair(tx + dx[j], ty + dy[j]);
                    ans.push_back(q[tail - 1]);
                }
            }
        }
        
    }

}

int main() {
    scanf("%d", &n);
    if (getchar() == ' ') {
        x = n;
        scanf("%d", &y);
        BFS2();
        printf("%d\n", ans.size());
        sort(ans.begin(), ans.end(), cmp);
        for (int i = 0; i < ans.size(); ++i)
            printf("%d %d\n", ans[i].first, ans[i].second);
        
    } else {
        while (n--) {
            int tx, ty;
            scanf("%d%d", &tx, &ty);
            a[tx][ty] = true;
            if (x == -1) {
                x = tx;
                y = ty;
            }
        }
        printf("%d %d\n", x, y);
        BFS();
    }
    return 0;
}
