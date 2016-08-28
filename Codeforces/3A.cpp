#include <cstdio>
#include <iostream>

using namespace std;

char x1, x2, y1, y2, a, b;
int n, m;

int main() {
    scanf("%c%c\n%c%c", &x1, &y1, &x2, &y2);
    n = x2 - x1;
    m = y2 - y1;
    if (n > 0) {
        a = 'R';
    } else {
        a = 'L'; 
        n = -n;
    }

    if (m > 0) {
        b = 'U';
    } else {
        b = 'D';
        m = -m;
    }
    cout << max(n, m) << endl;
    for (int i = 1; i <= max(n, m); ++i) {
        if (i <= n)
            putchar(a);
        if (i <= m)
            putchar(b);
        putchar('\n');
    }
    return 0;
}
