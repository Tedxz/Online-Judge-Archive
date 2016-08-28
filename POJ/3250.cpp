/*PKU 3250*/
#include<cstdio>
#include<cstdlib>
#include<utility>
using namespace std;
const int MAX_N=80003;
int back,front,n,h,i;
unsigned int ans;
pair<int,int> mono_queue[MAX_N];
inline void push(const int &h)
{
    while (back>front && mono_queue[back].second<=h) 
        ans+=i-mono_queue[back--].first-1;
    mono_queue[++back]=make_pair(i,h);
}
int main()
{
    scanf("%d",&n);
    for (i=0; i<n; ++i)
    {
        scanf("%d",&h);
        push(h);
    }
    push(1000000001);
    printf("%u\n",ans);
    return 0;
}
