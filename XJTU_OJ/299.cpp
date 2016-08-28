#include <cstdio>
#include <iostream>
#include <map>
#include <string>
#include <cstdlib>
#include <cctype>

using namespace std;

map<string, int> list;
string word;

bool get_word(string &w) {
	static char buff[64];
	int len = 0;
	for (buff[0] = getchar(); !isalpha(buff[0]); buff[0] = getchar())
		if (buff[0] == EOF)
			return false;
	for (len = 0; isalpha(buff[len]); buff[++len] = getchar());
	w.assign(buff, len);
	return true;	
}

int main() {
	while (get_word(word))
		++list[word];
	for (map<string, int>::iterator iter = list.begin(); iter != list.end(); ++iter)
		cout << iter->first << " " << iter->second << endl;
	return 0;
}
//tag : 统计, map
