/*XJTU 150*/
#include <cstdio>
#include <iostream>

using namespace std;

int l1, r1, u1, d1, f1, b1, l2, r2, u2, d2, f2, b2, ans;

int main() {
    scanf("%d%d%d%d%d%d%d%d%d%d%d%d", &l1, &d1, &f1, &r1, &u1, &b1, &l2, &d2, &f2, &r2, &u2, &b2);
    ans = (r1 - l1) * (u1 - d1) * (b1 - f1) + (r2 - l2) * (u2 - d2) * (b2 - f2);
    if (l1 < l2) l1 = l2;
    if (d1 < d2) d1 = d2;
    if (f1 < f2) f1 = f2;
    if (r1 > r2) r1 = r2;
    if (u1 > u2) u1 = u2;
    if (b1 > b2) b1 = b2;
    if ((r1 - l1) > 0 && (u1 - d1) > 0 && (b1 - f1) > 0)
    ans -= (r1 - l1) * (u1 - d1) * (b1 - f1);
    printf("%d\n", ans);
    return 0;
}
//tag : 水题
