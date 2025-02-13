#include <stdio.h>
#include <stdlib.h>
#include <string.h>

 typedef struct nod_
{
	char nume[20];
	char prenume[20];
	char group_id[10];
	double nota1, nota2, nota3;
	double media;
	struct nod_ *next;
}nod;

nod *prim, *last;

void Read();
void Insert(nod *element);
void Write();
void Group_Average();
void Passed_Students();
void Sort();

int main(int argc, char* argv[])
{
	Read();
	Sort();
	Write();
	printf("Group Average \n");
	Group_Average();
	printf("Passed Students \n");
	Passed_Students();
	Write();
	scanf("%*c");

	return 0;
}
void Insert(nod *element)
{
	if (prim == NULL)
	{
		prim = element;
		last = element;
	}
	else
	{
		last->next = element;
		last = element;
	}
}
void Sort()
{
	int sort = 0;
	nod *iterator;
	iterator = prim;

	do
	{
		sort = 1;
		nod *iterator_;
		iterator = prim;
		while (iterator->next->next != NULL)
		{
			if (iterator == prim)
			{
				if (strcmp(iterator->group_id, iterator->next->group_id) > 0)
				{
					nod *aux = iterator_;
					nod *aux2 = iterator->next;
					aux->next = aux2->next;
					aux2->next = aux;
					prim = aux2;

					sort = 0;
				}
			}
			else if (iterator->next == last)
			{
				if (strcmp(iterator->group_id, iterator->next->group_id) > 0)
				{
					nod *aux = iterator;
					nod *aux2 = iterator->next;
					aux->next = aux2->next;
					aux2->next = aux;
					last = aux2;

					sort = 0;
				}
			}
			else
			{
				if (strcmp(iterator->next->group_id, iterator->next->next->group_id) > 0)
				{
					nod *aux = iterator;
					nod *aux2 = iterator->next;
					nod *aux3 = iterator->next->next;

					aux->next = aux3;
					aux2->next = aux3->next;
					aux3->next = aux2;

					sort = 0;
				}
			}
			iterator = iterator_->next;
		}

	} while (!sort);
}
void Read()
{
	FILE *fp;

	fp = fopen("student.in", "r"); // read mode

	if (fp == NULL)
	{
		perror("Error while opening the file.\n");
		exit(EXIT_FAILURE);
	}
	char name[20];

	while (fscanf(fp, "%s", &name) != EOF)
	{
		nod *newNode;
		newNode = (nod *)malloc(sizeof(nod));
		strcpy(newNode->nume ,name);
		fscanf(fp, "%s", &newNode->prenume);
		fscanf(fp, "%s", &newNode->group_id);
		fscanf(fp, "%lf %lf %lf", &newNode->nota1, &newNode->nota2, &newNode->nota3);
		newNode->media = 0.4 * newNode->nota1 + 0.1 * newNode->nota2 + 0.5 * newNode->nota3;
		newNode->next = NULL;
		Insert(newNode);
	}

	fclose(fp);

}
void Write()
{
	nod *iterator;
	iterator = prim;

	while (iterator != NULL)
	{
		printf("Group : %s \n Name : %s \n Surname : %s \n Final Mark : %lf", iterator->group_id, iterator->nume, iterator->prenume, iterator->media);
		printf("\n");
		iterator = iterator->next;
	}
}
void Group_Average()
{
	nod *iterator;
	iterator = prim;
	double average = 0;
	int nr = 0;

	while (iterator->next != NULL)
	{
		if (average == 0)
		{
			printf("Group : %s ", iterator->group_id);
			average += iterator->media;
			nr += 1;
		}
		if (strcmp(iterator->group_id, iterator->next->group_id) == 0)
		{
			average += iterator->next->media;
			nr += 1;
		}
		else
		{
			printf("%lf \n", average / nr);
			average = 0;
			nr = 0;
		}
		iterator = iterator->next;
	}
	printf("%lf \n", average / nr);
}
void Passed_Students()
{
	nod *iterator;
	iterator = prim;

	if (iterator == prim)
	{
		if (iterator->media < 5)
		{
			nod *q = iterator;
			iterator = iterator->next;
			prim = iterator;
			if (iterator == NULL)
				last = NULL;
			free(q);
		}
	}
	while (iterator->next != NULL)
	{

	  if (iterator->next == last)
		{
			if (iterator->next->media < 5)
			{
				nod *q = iterator->next;
				last = iterator;
				iterator->next = NULL;
				free(q);
			}
		}
		else
		{
			if (iterator->next->media < 5)
			{
				nod *q = iterator->next;
				iterator->next = q->next;
				free(q);
			}
			else
			{
				iterator = iterator->next;
			}
		}
	}
}
