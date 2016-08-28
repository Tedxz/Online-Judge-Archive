#include <cstdio>
#include <iostream>

using namespace std;

int a, b, n;

char s[100];
char ss[100];

int len;

bool checkstr(int i1, int i2, int l) {
    for (int i = 0; i < l; ++i)
        if (s[i1 + i] != s[i2 + i]) 
            return false;
            
    return true;
}

bool check1(int a, int b) {
    //cerr << "check1" << " " << a << " " << b << endl;
    //chech ababa
    if (a * 3 + b * 2 != len)
        return false;
    if (!b) return false;
    if ((a == b) && (checkstr(0, a, a))) return false;
    if (!checkstr(0, a + b, a))
        return false;
    if (!checkstr(0, a + b + a + b, a))
        return false;
    if (!checkstr(a, a + b + a, b))
        return false;
    return true;
}

bool check2(int a, int b, int c) {
    //cerr << "check2" << " " << a << " " << b << " " << c << endl;
    // check ababcab
    if (a * 3 + b * 3 + c != len) return false;
    if (!c) return false;
    if (!b) return false;
    if ((a == b) && (checkstr(0, a, a))) return false;
    if ((c == b) && (checkstr(a, (a+b)*2, c))) return false;
    if ((a == c) && (checkstr(0, (a+b)*2, a))) return false;
    
    if (!checkstr(0, a + b, a))
        return false;
    if (!checkstr(0, (a + b) * 2 + c, a))
        return false;
    if (!checkstr(a, a + b + a, b))
        return false;
    if (!checkstr(a, (a + b) * 2 + c + a, b))
        return false;
    return true;
}

bool check() {
    for (int a = 1; a <= (len) / 3; ++a) {
        int b = (len - a * 3) / 2;
        if (check1(a, b)) return true;
    }
    
    for (int a = 1; a <= len / 3; ++a)
        for (int b = 1; (a + b) * 3 <= len; ++b) {
            int c = len - (a+b) * 3;
            if (check2(a, b, c)) return true;
        }
    return false;
    
}

int main() {
    cin >> n;
    for (int cs = 0; cs < n; ++cs) {
         
         scanf("%s", ss);
         
         len = 0;
         for (int i = 0; ss[i]; ++i) {
             if (isalpha(ss[i]))
             s[len++] = tolower(ss[i]);
         }
         s[len] = 0;
         //cerr << cs << " " << s << endl;
         if (check()) {
             cout << "Yes" << endl;
         } else {
             cout << "No" << endl;
         }
            
    }
    return 0;
}

