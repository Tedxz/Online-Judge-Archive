/*Ural 1876*/
#include <cstdio>

#define max(a, b) ((a) > (b) ? (a) : (b))

int a, b;

int main() {
    scanf("%d%d", &a, &b);
    printf("%d\n", max(40 + b * 2, 39 + a * 2));
    return 0;
}
