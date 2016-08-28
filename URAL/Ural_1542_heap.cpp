/*Ural 1542*/
//Trie
#include<cstdio>
#include<iostream>
#include<string>
#include<cstdlib>
#include<algorithm>
#include<vector>
using namespace std;
const int MAX_N=100010, MAX_M=15010;
class word
{
    public:
        string key;
        int val;
};
word read_word()
{
    word tem;
    cin>>tem.key/*>>tem.val*/;
    scanf("%d",&tem.val);
    return tem;
}
class trie_node
{
    public:
        int val;
        trie_node *ch[26];
        trie_node():val(-1) { memset(ch,0,sizeof(ch)); }
};
class trie
{
    private:
        trie_node *root;
        vector<word> list;
        void dfs(trie_node *p,string s)
        {
            if (p->val>0)
            {
                word tem;
                tem.key=s;
                tem.val=p->val;
                list.push_back(tem);
                push_heap(list.begin(),list.end(),cmp);
                if (list.size()>13) list.pop_back();
            }
            for (int i=25; i>=0; --i)
            {
                if (p->ch[i]!=NULL) dfs(p->ch[i],s+(char)('a'+i));
            }
        }
        inline int min(int a, int b) { return a<b?a:b; }
        static bool cmp(word a, word b)
        {
            return (a.val>b.val)||((a.val==b.val)&&(a.key<b.key));
        }
    public:
        trie() { root=new trie_node; }
        void insert(word w)
        {
            trie_node *p=root;
            for (int i=0; i<w.key.size(); ++i)
            {
                if (p->ch[w.key[i]-'a']==NULL) p->ch[w.key[i]-'a']=new trie_node;
                p=p->ch[w.key[i]-'a'];
            }
            p->val=w.val;
        }
        void find_pre(string s)
        {
            trie_node *p=root;
            for (int i=0; i<s.size(); ++i)
            {
                if (p->ch[s[i]-'a']==NULL) return;
                p=p->ch[s[i]-'a'];
            }
            list.clear();
            dfs(p,"");
            sort_heap(list.begin(),list.end(),cmp);
            for (int i=0; i<min(list.size(),10); ++i)
            {
                cout<<s<<list[i].key<<endl;
            }
        }
}t;
int n,m;
string s;
int main()
{
//    freopen("a.txt","w",stdout);
    scanf("%d",&n); //cin>>n;
    for (int i=1; i<=n; ++i) t.insert(read_word());
    scanf("%d",&m); //cin>>m;
    cin>>s;
    t.find_pre(s);
    for (int i=2; i<=m; ++i)
    {
        printf("\n"); //cout<<endl;
        cin>>s;
        t.find_pre(s);
    }
    return 0;
}
