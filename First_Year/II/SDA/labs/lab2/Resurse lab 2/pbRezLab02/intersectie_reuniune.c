
#include<stdio.h>
#include <stdlib.h>

typedef struct nod_
{
	int info;
	struct nod_ *next;
}nod;

void Read(char *c, nod **prim, nod **last);
void Insert(nod *element, nod **prim, nod **last);
void Write(nod *prim);
void Intersection(nod **prim, nod **last, nod *first_list, nod *second_list);
void Union(nod **prim, nod **last, nod *first_list, nod *second_list);

int main(int argc, char* argv[])
{
	nod *prim_lista1, *last_lista1;
	nod *prim_lista2, *last_lista2;
	nod *union_list_prim, *union_list_last;
	nod *intersection_list_prim, *intersection_list_last;

	prim_lista1 = NULL;
	prim_lista2 = NULL;
	last_lista1 = NULL;
	last_lista2 = NULL;
	intersection_list_prim = NULL;
	intersection_list_last = NULL;
	union_list_prim = NULL;
	union_list_last = NULL;

	Read("F1.txt", &prim_lista1, &last_lista1);
	Read("F2.txt", &prim_lista2, &last_lista2);

	Intersection(&intersection_list_prim, &intersection_list_last, prim_lista1, prim_lista2);
	Union(&union_list_prim, &union_list_last, prim_lista1,prim_lista2);

	Write(prim_lista1);
	Write(prim_lista2);
	Write(intersection_list_prim);
	Write(union_list_prim);

	scanf("%*c");
	return 0;
}

void Read(char *c, nod **prim, nod **last)
{
	FILE *fp;

	fp = fopen(c, "r"); // read mode

	if (fp == NULL)
	{
		perror("Error while opening the file.\n");
		exit(EXIT_FAILURE);
	}

	int n;
	while (fscanf(fp, "%d", &n) != EOF)
	{
		nod *newNode;
		newNode = (nod *)malloc(sizeof(nod));
		newNode->info = n;
		newNode->next = NULL;
		Insert(newNode,prim,last);
	}

	fclose(fp);
}
void Write(nod *prim)
{
	nod *iterator;
	iterator = prim;

	while (iterator != NULL)
	{
		printf("%d ", iterator->info);
		iterator = iterator->next;
	}
	printf("\n");
}
void Insert(nod *element, nod **prim, nod **last)
{
	if (*prim == NULL)
	{
		*prim = element;
		*last = element;
	}
	else
	{
		(*last)->next = element;
		*last = element;
	}
}

void Intersection(nod **prim, nod **last, nod *first_list, nod *second_list)
{
	nod *iterator_list1;
	iterator_list1 = first_list;
	nod *iterator_list2;
	iterator_list2 = second_list;

	while (iterator_list1 != NULL && iterator_list2 != NULL)
	{
		if (iterator_list1->info == iterator_list2->info)
		{
			nod *newNode;
			newNode = (nod *)malloc(sizeof(nod));
			newNode->info = iterator_list1->info;
			newNode->next = NULL;

			Insert(newNode, prim, last);

			iterator_list1 = iterator_list1->next;
			iterator_list2 = iterator_list2->next;
		}
		else if (iterator_list1->info < iterator_list2->info)
		{
			iterator_list1 = iterator_list1->next;
		}
		else if (iterator_list1->info > iterator_list2->info)
		{
			iterator_list2 = iterator_list2->next;
		}
	}
}

void Union(nod **prim, nod **last, nod *first_list, nod *second_list)
{
	nod *iterator_list1;
	iterator_list1 = first_list;
	nod *iterator_list2;
	iterator_list2 = second_list;

	while (iterator_list1 != NULL && iterator_list2 != NULL)
	{
		if (iterator_list1->info == iterator_list2->info)
		{
			nod *newNode;
			newNode = (nod *)malloc(sizeof(nod));
			newNode->info = iterator_list1->info;
			newNode->next = NULL;

			Insert(newNode, prim, last);
			iterator_list1 = iterator_list1->next;
			iterator_list2 = iterator_list2->next;
		}
		else if (iterator_list1->info < iterator_list2->info)
		{
			nod *newNode;
			newNode = (nod *)malloc(sizeof(nod));
			newNode->info = iterator_list1->info;
			newNode->next = NULL;

			Insert(newNode, prim, last);
			iterator_list1 = iterator_list1->next;
		}
		else if (iterator_list1->info > iterator_list2->info)
		{
			nod *newNode;
			newNode = (nod *)malloc(sizeof(nod));
			newNode->info = iterator_list2->info;
			newNode->next = NULL;

			Insert(newNode, prim, last);

			iterator_list2 = iterator_list2->next;
		}
	}
}
