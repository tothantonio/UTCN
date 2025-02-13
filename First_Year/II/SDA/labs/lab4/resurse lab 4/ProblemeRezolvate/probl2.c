#include <stdio.h>
#include <stdlib.h>

typedef struct _nod
{
	int info;
	struct _nod *left;
	struct _nod *right;
}nod;

nod **coada;

void spiral(nod *root, int nrNoduri)
{
	coada = (nod **)malloc(nrNoduri * sizeof(nod*));
	int sens = 0;
	coada[0] = root;
	int start, fin,i;
	start = 0;
	fin = 1;

	while (fin < nrNoduri)
	{
		nod *current;

			int oldFinish = fin - 1;
			int oldFinish2 = fin;
			while (start <= oldFinish)
			{
				if (sens)
				{
					current = coada[oldFinish];
					if (current->left != NULL)
						coada[fin++] = current->left;
					if (current->right != NULL)
						coada[fin++] = current->right;
				}
				else
				{
					current = coada[oldFinish];
					if (current->right != NULL)
						coada[fin++] = current->right;
					if (current->left != NULL)
						coada[fin++] = current->left;
				}
				oldFinish--;
			}

			start = oldFinish2;

		sens ^= 1;
	}
}

nod *createBinaryTreeFromFilte(FILE *f, int *nrNoduri)
{
	nod *p;
	int c;

	fscanf(f, "%d", &c);
	if (c == 0) return NULL;
	else{
		p = (nod *)malloc(sizeof(nod));
		if (p == NULL)
		{
			printf("Nu mai avem memorie");
			exit(1);
		}
		p->info = c;
		(*nrNoduri)++;
		p->left = createBinaryTreeFromFilte(f, nrNoduri);
		p->right = createBinaryTreeFromFilte(f, nrNoduri);
	}
	return p;
}

void write(int nrNoduri)
{
	int i;
	for (i = 0; i < nrNoduri; i++)
	{
		printf("%d ", coada[i]->info);
	}
}

int main(int argc, char* argv[])
{
	nod *root;
	int nrNoduri = 0;
	FILE *f = fopen("arbore.txt", "r");
	if (!f)
	{
		printf("Nu se poate deschide fisierul arbore.txt\n");
		return-1;
	}

	root = createBinaryTreeFromFilte(f, &nrNoduri);
	fclose(f);
	spiral(root, nrNoduri);
	write(nrNoduri);

	return 0;
}

