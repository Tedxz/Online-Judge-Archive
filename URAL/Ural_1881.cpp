/*Ural 1881*/
#include <cstdio>
#include <iostream>
#include <string>

using namespace std;

const int MAX_N = 10100;

int h, n, w;
int l[MAX_N];
string s;

int main() {
    cin >> h >> w >> n;
    for (int i = 1; i <= n; ++i) {
        cin >> s;
        l[i] = s.length();
    }
    
    int line = 1, col = 0;
    for (int i = 1; i <= n; ++i) {
        if (!col) {
            col += l[i];
        } else {
            if (col + l[i] + 1 > w) {
                ++line;
                --i;
                col = 0;
            } else {
                col += l[i] + 1;
            }
        }
    }
    
    cout << (line - 1) / h + 1 << endl;
    
    return 0;
    
}
