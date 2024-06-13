#include <stdio.h>
#include <stdlib.h>

//declarare nod arbore
typedef struct _nod
{
	int info;
	struct _nod *left;
	struct _nod *right;
}nod;

//citire arbore din fisier
nod *createBinaryTreeFromFilte(FILE *f, int **nrNoduri)
{
	nod *p;
	int c;

	fscanf(f, "%d", &c);
	if (c == 0)
		return NULL;
	else
	{
		p = (nod *)malloc(sizeof(nod));
		if (p == NULL)
		{
			printf("Nu mai avem memorie");
			exit(1);
		}
		p->info = c;
		(*(*nrNoduri))++;
		p->left = createBinaryTreeFromFilte(f, nrNoduri);
		p->right = createBinaryTreeFromFilte(f, nrNoduri);
	}
	return p;
}
//populare matrice de adiacenta
void populateMatrix(nod *root, int **matrice_adiacenta)
{
	if (root != NULL)
	{
		if (root->left != NULL)
		{
			matrice_adiacenta[root->info][root->left->info] = 1;
			matrice_adiacenta[root->left->info][root->info] = 1;
			populateMatrix(root->left, matrice_adiacenta);
		}
		if (root->right != NULL)
		{
			matrice_adiacenta[root->info][root->right->info] = 1;
			matrice_adiacenta[root->right->info][root->info] = 1;
			populateMatrix(root->right, matrice_adiacenta);
		}
	}
}
void write(int nrNoduri, int **coada)
{
	int k = 1;
	for (int i = 0; i < nrNoduri - 1; i++)
	{
		if (coada[1][i] == k)
		{
			printf("%d ", coada[0][i]);
		}
		else
		{
			k++;
			printf("\n%d ", coada[0][i]);
		}
	}
}
//afisare noduri pe nivel
void bfs(int nod, int **matrice_adiacenta, int nrNoduri)
{
	int *coada[2], st, dr;
	int *pus;

	coada[0] = (int *)malloc(nrNoduri * sizeof(int));
	coada[1] = (int *)malloc(nrNoduri * sizeof(int));
	pus = (int *)calloc(nrNoduri, sizeof(int));

	st = 0;
	dr = 1;
	coada[0][st] = nod;
	coada[1][st] = 1;
	pus[nod] = 1;
	st++;

	while (st <= dr)
	{
		int nodCurrent = coada[0][st - 1];

		for (int i = 1; i < nrNoduri; i++)
			if (matrice_adiacenta[i][nodCurrent] && !pus[i])
			{
				coada[0][dr] = i;
				coada[1][dr] = coada[1][st - 1] + 1;
				dr++;
				pus[i] = 1;
			}
		st++;
	}

	write(nrNoduri, coada);

}

int main(int argc, char* argv[])
{

	nod *root;
	int **matrice_adiacenta;
	int *nrNoduri ;
	nrNoduri = (int *)malloc(sizeof(int));
	*nrNoduri = 0;

	FILE *f = fopen("arbore.txt", "r");
	if (!f)
	{
		printf("Nu se poate deschide fisierul arbore.txt\n");
		return-1;
	}
	//citim arborele
	root = createBinaryTreeFromFilte(f, &nrNoduri);
	fclose(f);
	//allocam memorie pentru matricea de adiacenta
	(*nrNoduri)++;//nodurile din graf sunt numerotate de la 1 la n
	matrice_adiacenta = (int **)calloc(*nrNoduri, sizeof(int *));
	for (int i = 0; i < *nrNoduri; i++)
	{
		matrice_adiacenta[i] = (int *)calloc(*nrNoduri, sizeof(int));
	}
	//populam matricea de adiacenta corespunzatoare grafului format din arbore
	populateMatrix(root, matrice_adiacenta);
	//afisam matricea de adiacenta
	for (int i = 1; i < *nrNoduri; i++)
	{
		for (int j = 1; j < *nrNoduri; j++)
			printf("%d ", matrice_adiacenta[i][j]);
		printf("\n");
	}
	//bfs si afisare
	bfs(1, matrice_adiacenta, *nrNoduri);

	scanf("%*c");

	return 0;
}

