#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define max_lenght 20
#define m 100

typedef struct cell {

	char key[max_lenght];
	int found;
}CELL;

int hFunction(char s[]) {
	int hash = 0;
	for (int i = 0; s[i]; i++) {
		hash = 31 * hash + s[i];
	}
	return hash % m;
}

void insert(CELL T[], char s[]) {
	int index = hFunction(s);
	while (T[index].found && strcmp(T[index].key, s) != 0)
		index = (index + 1) % m;

	strcpy_s(T[index].key,sizeof(s), s);
	T[index].found = 1;
}

int main()
{
	CELL T[m] = { 0 };
	char word[max_lenght];
	int cnt = 0;

	FILE* fin = fopen("date.in", "r");
	if (!fin)
		return -1;

	FILE* fout = fopen("date.out", "w");
	if (!fout)
		return -2;

	while (fscanf_s(fin, "%s", word) != EOF)
		insert(T, word);

	for (int i = 0; i < m; i++)
	{
		if (T[i].found)
			cnt++;
	}

	fprintf_s(fout, "%d", cnt);
	fclose(fin);
	fclose(fout);
	return 0;
}