#include <stdio.h>
#include <stdlib.h>

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
int bfs(int nod, int **matrice_adiacenta, int nrNoduri)
{
	int *coada, st, dr;
	int *pus[2];
	
	coada = (int *)malloc(nrNoduri * sizeof(int));
	pus[0] = (int *)calloc(nrNoduri, sizeof(int));
	pus[1] = (int *)calloc(nrNoduri, sizeof(int));

	st = 0;
	dr = 1;
	coada[st] = nod;//nodul
	pus[0][nod] = 1;//daca a fost sau nu vizitat
	pus[1][nod] = 1; //culoarea
	st++;

	while (st <= dr)
	{
		int nodCurrent = coada[st - 1];

		for (int i = 1; i < nrNoduri; i++)
			if (matrice_adiacenta[i][nodCurrent])
			{
				if (!pus[0][i])
				{
					coada[dr] = i;
					dr++;
					pus[0][i] = 1;
					pus[1][i] = pus[1][nodCurrent] ^ 1;

				}
				else
				{
					if (pus[1][i] == pus[1][nodCurrent])
					{
						return 0;//graful nu e bipartit am ajuns la un nod din aceeasi clasa care a mai fost vizitat
					}
				}
			}
		st++;
	}
	return 1;
}

int main(int argc, char* argv[])
{
	int **matrice_adiacenta = NULL;
	int nrNoduri, nrMuchii;

	FILE *f = fopen("date.in", "r");
	if (!f)
	{
		printf("Nu se poate deschide fisierul arbore.txt\n");
		return-1;
	}

	fscanf(f, "%d", &nrNoduri);
	fscanf(f, "%d", &nrMuchii);

	nrNoduri++;

	matrice_adiacenta = (int **)calloc(nrNoduri, sizeof(int **));
	for (int i = 0; i < nrNoduri; i++)
	{
		matrice_adiacenta[i] = (int *)calloc(nrNoduri, sizeof(int*));
	}

	readEdges(nrMuchii, matrice_adiacenta, f);

	fclose(f);

	if (bfs(1, matrice_adiacenta, nrNoduri))
	{
		printf("Graful e bipartit");
	}
	else
	{
		printf("Graful nu e bipartit");
	}
	
	scanf("%*c");

	return 0;
}

