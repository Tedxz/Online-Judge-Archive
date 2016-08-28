/*XJTU 108*/
#include <cstdio>
#include <iostream>
#include <utility>

using namespace std;

const int MAX_N = 110;

int n, m, x1[MAX_N], x2[MAX_N], y1[MAX_N], y2[MAX_N], x, y;

int calc(int x, int y) {
    double h = 0.0, th;
    int num = 0;
    for (int i = 1; i <= n; ++i) {
        if (x >= x1[i] && x <= x2[i]) {
            th = (double)y1[i] + ((double)(x - x1[i])) / (double)(x2[i] - x1[i]) * (y2[i] - y1[i]);
            if (th > h && th < y)
                h = th, num = i;
        }
    }
    if (num) {
        if (y1[num] < y2[num]) 
            return calc(x1[num], y1[num]);
        else
            return calc(x2[num], y2[num]);
    }
    return x;
}

int main() {
    cin >> n;
    for (int i = 1; i <= n; ++i) {
        cin >> x1[i] >> y1[i] >> x2[i] >> y2[i];
        if (x1[i] > x2[i])
            swap(x1[i], x2[i]), swap(y1[i], y2[i]);
    }
    cin >> m;
    for (int i = 1; i <= m; ++i) {
        cin >> x >> y;
        cout << calc(x, y) << endl;
    }
}
//tag : 模拟
