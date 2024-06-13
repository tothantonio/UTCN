// Expresie.cpp : Defines the entry point for the console application.
//

#include<stdio.h>
#include <stdlib.h>
#include <string.h>


struct nod
{
	char caracter;
	nod *next;
};

nod *prim, *second;


void push(nod **prim, char caracter)
{
	nod *element;
	element = (nod *)malloc(sizeof(nod));
	element->caracter = caracter;
	element->next = NULL;
	if (prim == NULL)
	{
		*prim = element;
	}
	else
	{
		element->next = *prim;
		*prim = element;
	}
}
char pop(nod **prim)
{
	if (prim == NULL) return 0;
	else
	{
		nod *iterator_;
		iterator_ = *prim;
		char c = (*prim)->caracter;
		*prim = (*prim)->next;
		free(iterator_);
		return c;
	}
}

void Write()
{
	nod *iterator_;
	iterator_ = prim;

	while (iterator_ != NULL)
	{
		printf(" %d ", iterator_->caracter);
		printf("\n");
		iterator_ = iterator_->next;
	}
}

int main(int argc, char* argv[])
{
	char c[100];
	scanf("%s", &c);
	int i = 0;
	int yes_no_ = 0;

	while (i < strlen(c))
	{
		if (c[i] != ')')
			push(&prim, c[i]);
		else
		{
			int index = 0; 
			char carac;
			do{
				carac = pop(&prim);
				index++;
			} while (carac != '(' && carac != 0);
			if (index <= 2){
				yes_no_ = 0;
				break;
			}
			else
			{
				yes_no_ = 1;
			}
		}
		i++;
	}

	if (yes_no_ == 0)
		printf(" NO ");
	else
		printf(" YES ");

	scanf("%d", &i);

	return 0;
}

