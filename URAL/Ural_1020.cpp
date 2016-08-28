/*URAL P1020*/
#include <cstdio>
#include <cmath>
int n;
double r, x, y, lx, ly, fx, fy, len = 0.0;
inline double dis(const double &x1, const double &y1, const double &x2, const double &y2)
{
    return sqrt((x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2));
}
int main()
{
    scanf("%d %lf", &n, &r);
    len += 2.0 * r * 3.14159;
    scanf("%lf%lf", &fx, &fy);
    x = fx; y = fy;
    for (int i = 1; i < n; ++i)
    {
        lx = x; ly = y;
        scanf("%lf%lf", &x, &y);
        len += dis(x, y, lx, ly);
    }
    len += dis(fx, fy, x, y);
    printf("%.2lf\n", len);
    return 0;
}
