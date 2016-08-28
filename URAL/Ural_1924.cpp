//Ural 1924
#include <cstdio>
#include <iostream>

using namespace std;

int n;

int main() {
    cin >> n;
    cout << (1 & ((n >> 1) + (1 & n)) ? "grimy" : "black") << endl;
    return 0;
}
