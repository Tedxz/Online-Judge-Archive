/*XJTU 313*/
#include <cstdio>
#include <iostream>

using namespace std;

long long x;
int c;
char s[100];
int main() {
    while (cin >> x) {
        if (x == 0) {
            puts("0");
            continue;
        }
        for (c = 0; x; ++c) {
            switch (x % 3) {
                case -2:
                    x -= 3;
                case 1:
                    s[c] = '1';
                    break;
                case 2:
                    x += 3;
                case -1:
                    s[c] = '-';
                    break;
                case 0:
                    s[c] = '0';
                    break;
            }
            x = x / 3;
        }
        for (--c; c >= 0; --c)
            putchar(s[c]);
        puts("");
    }
    return 0;
}
//tag : 数论， 数制
