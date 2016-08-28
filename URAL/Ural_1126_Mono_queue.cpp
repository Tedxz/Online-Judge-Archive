/*Ural 1126*/
#include<cstdio>
#include<cstdlib>
#include<utility>
using namespace std;
const int MAX_M=14001, MAX_N=25001;
pair<int,int> mono_queue[MAX_N];
int m,i;
int front=0,back=0;
inline void push()
{
    static int x;
    scanf("%d",&x);
    if (x==EOF) exit(0);
    while(back>front && mono_queue[back].second<=x) --back;
    mono_queue[++back]=make_pair(i,x);
}
inline void pop()
{
    while(mono_queue[front+1].first<i-m+1) ++front;
    printf("%d\n",mono_queue[front+1].second);
}
int main()
{
    scanf("%d",&m);
    for (i=1; i<m; ++i) push();
    for (; ; ++i) { push(); pop(); }
    return 0;
}
