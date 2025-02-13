#include <stdio.h>
#include <stdlib.h>
#include <string.h>

long long solve(int* a, int n){
	//returneaza costul pentru descompunerea optima	
	long long cost = 0;
	
}

int main(){
	int tests;
	long long sol;
	int n;
	int* a;
	FILE* f = fopen("date_numere.txt", "r");
	if (f==NULL){
	  printf("Fisier inexistent\n");
	  return -1;
	}
	fscanf(f,"%d", &tests);
	for (int testi = 0; testi < tests; testi++){
		fscanf(f, "%d%I64d", &n, &sol);
		a = (int*)malloc(n*sizeof(int));
		for (int i = 0; i < n; i++)
			fscanf(f, "%d", a + i);		
		long long cost = solve(a, n);
		printf("test %d: result %10I64d, expected %10I64d\n", testi, cost, sol);
		free(a);
	}
	fclose(f);
	return 0;
}
