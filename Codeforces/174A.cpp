#include <cstdio>
#include <iostream>
#include <cstring>
#include <cstdlib>

using namespace std;

const int MAX_N = 200007;

int n, q;

class IntervalTree {
public:
    int L[MAX_N * 4], R[MAX_N * 4], len;
    double sum[MAX_N * 4], delta[MAX_N * 4];
    void build(int k, int l, int r) {
        L[k] = l; R[k] = r;
        if (L[k] >= R[k]) return;
        build(k * 2, l, (l + r) >> 1);
        build(k * 2 + 1, (l + r + 2) >> 1, r);
    }
    IntervalTree() {
        memset(L, 0, sizeof L);
        memset(R, 0, sizeof R);
        memset(sum, 0, sizeof sum);
        memset(delta, 0, sizeof delta);
        len = 1;
        build(1, 1, 200001);        
    }
    void down(int k) {
        if (!delta[k]) return;
        if (L[k] == R[k]) return;
        delta[k * 2] += delta[k];
        delta[k * 2 + 1] += delta[k];
        sum[k] += delta[k] * (R[k] - L[k] + 1);
        delta[k] = 0;
    }
    double getSum(int k, int l, int r) {
        if ((l > R[k]) || (L[k] > r))
            return 0;
        if ((l <= L[k]) && (R[k] <= r))
            return sum[k] + delta[k] * (R[k] - L[k] + 1);
        down(k);
        return sum[k] = getSum(k * 2, l, r) + getSum(k * 2 + 1, l, r);
    }
    double getAverage() {
        //cout << getSum(1, 1, len) << " " << len << endl;
        return ((double)getSum(1, 1, len)) / len;
    }
    void modify(int k, int pos, int n) {
        if ((L[k] > pos) || (pos > R[k]))
            return;
        sum[k] += n;
        if (L[k] == R[k]) return;
        if (R[k * 2] >= pos)
            modify(k * 2, pos, n);
        else
            modify(k * 2 + 1, pos, n);
    }
    void push(int n) {
        modify(1, ++len, n);
    }
    void del(int k, int pos) {
        down(k);
        if (L[k] == R[k]) {
            delta[k] = sum[k] = 0;
            return;
        }
        if (R[k * 2] >= pos)
            del(k * 2, pos);
        else
            del(k * 2 + 1, pos);
        sum[k] = getSum(k * 2, L[k], R[k]) + getSum(k * 2 + 1, L[k], R[k]);      
    }
    void pop() {
        del(1, len);
        --len;
    }
    void iadd(int k, int r, int d) {
        if (R[k] <= r) {
            delta[k] += d;
            return;
        }
        if (L[k] > r) return;
        iadd(k * 2, r, d);
        iadd(k * 2 + 1, r, d);
        sum[k] = getSum(k * 2, L[k], R[k]) + getSum(k * 2 + 1, L[k], R[k]);      
    }
    void add(int p, int d) {
        iadd(1, p, d);
    }
}t;

int main() {
    scanf("%d", &n);
    int x, y;
    while (n--) {
        scanf("%d", &q);
        switch(q) {
            case 1:
                scanf("%d%d", &x, &y);
                t.add(x, y);
                break;
            case 2:
                scanf("%d", &x);
                t.push(x);
                break;
            case 3:
                t.pop();
                break;    
        }
        printf("%.6lf\n", t.getAverage());
    }
    return 0;
}
