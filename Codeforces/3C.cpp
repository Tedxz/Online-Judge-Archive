#include <cstdio>
#include <iostream>

using namespace std;

int cx, co, wx, wo;
char s[3][4];

int main() {
    for (int i = 0; i < 3; ++i)
        scanf("%s", s[i]);
    for (int i = 0; i < 3; ++i)
        for (int j = 0; j < 3; ++j) {
            if (s[i][j] == 'X') ++cx;
            if (s[i][j] == '0') ++co;
        }
    if (cx - co > 1 || co - cx > 0) {
        printf("illegal\n");
        return 0;
    }
    if ('X' == s[0][0] && 'X' == s[0][1] && 'X' == s[0][2]
        || 'X' == s[1][0] && 'X' == s[1][1] && 'X' == s[1][2]
        || 'X' == s[2][0] && 'X' == s[2][1] && 'X' == s[2][2]
        || 'X' == s[0][0] && 'X' == s[1][0] && 'X' == s[2][0]
        || 'X' == s[0][1] && 'X' == s[1][1] && 'X' == s[2][1]
        || 'X' == s[0][2] && 'X' == s[1][2] && 'X' == s[2][2]
        || 'X' == s[0][0] && 'X' == s[1][1] && 'X' == s[2][2]
        || 'X' == s[0][2] && 'X' == s[1][1] && 'X' == s[2][0]) {
        wx = 1;
    }
    if ('0' == s[0][0] && '0' == s[0][1] && '0' == s[0][2]
        || '0' == s[1][0] && '0' == s[1][1] && '0' == s[1][2]
        || '0' == s[2][0] && '0' == s[2][1] && '0' == s[2][2]
        || '0' == s[0][0] && '0' == s[1][0] && '0' == s[2][0]
        || '0' == s[0][1] && '0' == s[1][1] && '0' == s[2][1]
        || '0' == s[0][2] && '0' == s[1][2] && '0' == s[2][2]
        || '0' == s[0][0] && '0' == s[1][1] && '0' == s[2][2]
        || '0' == s[0][2] && '0' == s[1][1] && '0' == s[2][0]) {
        wo = 1;
    }
    if (wx && wo || wx && cx == co || wo && cx > co) {
        printf("illegal\n");
        return 0;
    }
    if (wx) {
        printf("the first player won\n");
        return 0;
    }
    if (wo) {
        printf("the second player won\n");
        return 0;
    }
    if (cx + co == 9) {
        printf("draw\n");
        return 0;
    }
    if (cx > co)
        printf("second\n");
    else
        printf("first\n");
    return 0;
}
