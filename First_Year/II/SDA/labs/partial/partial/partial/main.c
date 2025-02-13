#include <stdio.h>
#include <stdlib.h>

typedef struct cell {

	int val;
	int status;
}CELL;

enum{FREE, OCCUPIED};

void set_table_free(CELL* T, int m) {
	for (int i = 0; i < m; i++)
		T[i].status = FREE;
}

void print_table(CELL* T, int m) {
	printf("\nTabela de dispersie este:\n");
	for (int i = 0; i < m; i++) {
		if (T[i].status == OCCUPIED)
			printf("T[%d] = %d\n", i, T[i].val);
		else printf("T[%d] = --\n", i);
	}
}

void insert(CELL* T, int k, int m, int(*(hash_func)(int k, int m, int i))) {
	for (int i = 0; i < m; i++) {
        int index = hash_func(k, m, i);
		if (T[index].status == FREE) {
			T[index].val = k;
			T[index].status = OCCUPIED;
			return;
		}
    }
}

int search(CELL* T, int k, int m, int(*hash_func)(int k, int m, int i)) {
	for (int i = 0; i < m; i++) {
		int index = hash_func(k, m, i);
		if (T[index].status == OCCUPIED && T[index].val == k)
			return index;
	}
	return -1;
}

int h1(int k, int m) {
	return k % m;
}

int quadratic_probing(int k, int m, int i) {
	return (h1(k, m) + i + i * i) % m;
}

void print_table_colisions(CELL* T, int m) {
	int nbOfColisions = 0;
	printf("\Coliziunile fiecarui element din tabela:\n");
	for (int i = 0; i < m; i++) {
		if (T[i].status == OCCUPIED)
		{
			printf("T[%d] = %d -- >%d coliziuni\n", i, T[i].val, nbOfColisions);
			nbOfColisions++;

		}
		else if (T[i].status == FREE)
			printf("T[%d] = --\n", i);
	}
}

float factor(CELL* T, int m, int* cnt) {

	float c = *cnt;
	float f = (c / m) * 100;
	if (f == 0)
		printf("Tabela este goala\n");
	else if (f == 100)
		printf("Tabela este plina\n");
	else {
	printf("Factorul tabelei este: %d / %d = %f%%\n", *cnt, m, f);
	return f;
	}

}

void function(CELL* T, int m, int*cnt) {

	if (factor(T, m, &cnt) > 70)
	{
		T = (CELL*)malloc((2 * m) * sizeof(CELL));
		if (!T)
			return -1;
		set_table_free(T, m);
	}
	else return;
}

int main() {

	int m = 11; 
	CELL* T = (CELL*)malloc(11 * sizeof(CELL));
	if (!T)
		return -1;
	set_table_free(T, m);

	int keys[] = { 1, 12, 23};
	int cnt = 0;

	for (int i = 0; i < sizeof(keys) / sizeof(int); i++)
	{
		insert(T, keys[i], m, quadratic_probing);
		cnt++;
	}
	print_table(T, m);

	int val = -3;
	int pos = search(T, val, m, quadratic_probing);
	if (pos != -1)
		printf("cheia %d este pe pozitia %d\n", val, pos);
	else printf("cheia %d nu a fost gasita\n", val);

	factor(T, m, &cnt);

	print_table_colisions(T, m);

	//function(T, m, &cnt);
	int n = 22;

	CELL* T2 = (CELL*)malloc(22 * sizeof(CELL));
	if (!T2)
		return -1;
	set_table_free(T2, n);

	for (int i = 0; i < sizeof(keys) / sizeof(int); i++)
		insert(T2, keys[i], n, quadratic_probing);
	print_table(T2, n);

	free(T);

	return 0;
}