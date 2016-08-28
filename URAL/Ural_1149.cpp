//Ural 1149
#include <cstdio>
#include <iostream>

using namespace std;

void printA(int n) {
    for (int i = 1; i < n; ++i)
        printf("sin(%d%c", i, (1 & i ? '-' : '+'));
    printf("sin(%d)", n);
    for (int i = 1; i < n; ++i)
        putchar(')');
}

void printS(int n) {
    for (int i = 1; i < n; ++i)
        putchar('(');
    for (int i = 1; i < n; ++i) {
        printA(i);
        printf("+%d)", n + 1 - i);
    }
    printA(n);
    printf("+%d", 1);
}

int n;

int main() {
    scanf("%d", &n);
    printS(n);
    return 0;
}

