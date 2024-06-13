#include <stdio.h>
#include <stdlib.h>

int *bestSol;
int bestLenght;

//write solution
void write()
{
	printf("%d\n", bestLenght);
	for (int i = 0; i < bestLenght; i++)
		printf("%d ", bestSol[i]);
}
//construct adjacency matrix
void readEdges(int nrMuchii, int **matrice_adiacenta, FILE *f)
{
	int x, y;

	for (int i = 0; i < nrMuchii; i++)
	{
		fscanf(f, "%d", &(x));
		fscanf(f, "%d", &(y));
		matrice_adiacenta[x][y] = 1;
		matrice_adiacenta[y][x] = 1;
	}
}

//search for largest chain
void dfs(int start, int k, int end, int nrNoduri, int  **matrice_adiacenta, int *vizitat, int *sol)
{
	if (start == end)
	{
		if (k > bestLenght)
		{
			for (int i = 0; i < k; i++)
				bestSol[i] = sol[i];
			bestLenght = k;
		}
	}
	else
	{
		for (int i = 0; i < nrNoduri; i++)
			if (matrice_adiacenta[i][start] && !vizitat[i])
			{
				vizitat[i] = 1;
				sol[k] = i;
				dfs(i, k + 1, end, nrNoduri, matrice_adiacenta, vizitat,sol);
				vizitat[i] = 0;
			}
	}
}

int main(int argc, char* argv[])
{
	int **matrice_adiacenta = NULL;
	int nrNoduri, nrMuchii, x,y;
	int *vizitat = NULL;
	int *sol;

	FILE *f = fopen("date.in", "r");
	if (!f)
	{
		printf("Nu se poate deschide fisierul arbore.txt\n");
		return-1;
	}

	fscanf(f, "%d", &nrNoduri);
	fscanf(f, "%d", &nrMuchii);
	fscanf(f, "%d", &x);
	fscanf(f, "%d", &y);

	nrNoduri++;

	bestSol = (int *)malloc(nrNoduri * sizeof(int));
	sol = (int *)malloc(nrNoduri * sizeof(int));
	vizitat = (int *)calloc(nrNoduri, sizeof(int));
	matrice_adiacenta = (int **)calloc(nrNoduri, sizeof(int **));
	for (int i = 0; i < nrNoduri; i++)
	{
		matrice_adiacenta[i] = (int *)calloc(nrNoduri, sizeof(int*));
	}

	readEdges(nrMuchii, matrice_adiacenta, f);

	fclose(f);
	//initialize the solution vector
	sol[0] = x;
	vizitat[x] = 1;
	//search for longest chain using a DFS variation
	dfs(x, 1, y, nrNoduri, matrice_adiacenta, vizitat, sol);

	write();

	scanf("%*c");

	return 0;
}

