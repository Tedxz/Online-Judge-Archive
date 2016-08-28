/*URAL P1037*/
#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <queue>
using namespace std;
const int N = 80010, T = 600;
bool END;
int Time, Num, Lim = 0;
char ch;
int A[N];
priority_queue<int> Free;
priority_queue<pair<int, int> > Allocated;
inline int GetInt(int &x)
{
    for (ch = getchar(); ch < '0' || ch > '9'; ch = getchar()) if (ch == EOF) return EOF;
    for (x = 0; ch >= '0' && ch <= '9'; ch = getchar()) x = x * 10 + ch - '0';
    return 1;
}
int main()
{
    while (GetInt(Time) != EOF)
    {
        while (!Allocated.empty() && -Allocated.top().first <= Time - T)
        {
            --A[Allocated.top().second];
            if (!A[Allocated.top().second]) Free.push(-Allocated.top().second);
            Allocated.pop();
        }
        ch = getchar(); getchar();
        if (ch == '+')
        {
            if (Free.empty())
            {
                Allocated.push(make_pair(-Time, ++Lim));
                A[Lim] = 1;
                printf("%d\n", Lim);
            }
            else
            {
                Allocated.push(make_pair(-Time, -Free.top()));
                A[-Free.top()] = 1;
                printf("%d\n", -Free.top());
                Free.pop();
            }
        }
        else
        {
            GetInt(Num);
            if (!A[Num])
                printf("-\n");
            else
            {
                printf("+\n");
                ++A[Num];
                Allocated.push(make_pair(-Time, Num));
            }
        }
    }
    return 0;
}
