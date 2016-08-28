/*XJTU 152*/
#include <cstdio>
#include <iostream>
#include <cstdlib>

using namespace std;

bool a[128], b[128], flag;
char c;

int main() {
    while (!a['\n']) {
        a[getchar()] = true; 
    }
    while (!b['\n']) {
        b[getchar()] = true;
    }
        
    flag = false;
    for (c = 'A'; c != '9' + 1; ++c) {
        if (a[c] || b[c]) {
            putchar(c);
            flag = true;
        }
        if (c == 'Z') c = 'a' - 1;
        if (c == 'z') c = '0' - 1;
    }
    if (!flag) puts("NO!");
    else puts("");
    flag = false;
    for (c = 'A'; c != '9' + 1; ++c) {
        if (a[c] && b[c]) {
            putchar(c);
            flag = true;
        }
        if (c == 'Z') c = 'a' - 1;
        if (c == 'z') c = '0' - 1;
    }
    if (!flag) puts("NO!");
    else puts("");
    
    flag = false;
    for (c = 'A'; c != '9' + 1; ++c) {
        if (a[c] != b[c]) {
            putchar(c);
            flag = true;
        }
        if (c == 'Z') c = 'a' - 1;
        if (c == 'z') c = '0' - 1;
    }
    if (!flag) puts("NO!");
    else puts("");
    flag = false;
    for (c = 'A'; c != '9' + 1; ++c) {
        if (!a[c] && !b[c]) {
            putchar(c);
            flag = true;
        }
        if (c == 'Z') c = 'a' - 1;
        if (c == 'z') c = '0' - 1;
    }
    if (!flag) puts("NO!");
    else puts("");
    return 0;
}
//tag : 字符串处理
