#include <cstdio>
#include <iostream>
#include <cmath>

using namespace std;

int x, y;

int main() {
    cin >> x >> y;
    x = max(x, y);
    switch (x) {
        case 1:
            cout << "1/1" << endl;
            break;
        case 2:
            cout << "5/6" << endl;
            break;
        case 3:
            cout << "2/3" << endl;
            break;
        case 4:
            cout << "1/2" << endl;
            break;
        case 5:
            cout << "1/3" << endl;
            break;
        case 6:
            cout << "1/6" << endl;
            break;
    }
    return 0;
}
