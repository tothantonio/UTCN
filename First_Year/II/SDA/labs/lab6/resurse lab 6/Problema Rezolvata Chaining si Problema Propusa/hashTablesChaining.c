#include <stdio.h>
#include <stdlib.h>
#define MAX_SIZE 1000

typedef struct nod_
{
	int key;
	int frequency;
	struct nod* next;
}nod;
typedef struct frequencies_
{
	int key;
	struct frequencies *next;
}frequencies;

nod *hash[MAX_SIZE];
frequencies *frequencyTable[MAX_SIZE];

int hashFunction(int key)
{
	return key % 991;// functia de hashing este data de numar mod un nr prim mare
}
void removeFrequencyNode(int key, int frequencyKey)
{
	frequencies *q, *q1;
	q1 = NULL;
	q = frequencyTable[frequencyKey];
	while (q != NULL)
	{
		if (q->key == key)
			break;
		q1 = q;
		q = q->next;
	}
	if (q != NULL)
	{
		if (q == frequencyTable[frequencyKey])
		{
			frequencyTable[frequencyKey] = frequencyTable[frequencyKey]->next;
			free(q);
		}
		else
		{
			q1->next = q->next;
			free(q);
		}
	}	
}
void addFrequencyNode(int val, int frequencyKey)
{
	frequencies *nou = NULL;
	nou = (frequencies*)malloc(sizeof(frequencies ));
	nou->key = val;
	nou->next = NULL;
	if (frequencyTable[frequencyKey] == NULL)
	{
		
		frequencyTable[frequencyKey] = nou;
	}
	else
	{
		//inserare la inceput
		frequencies *iterator;
		iterator = frequencyTable[frequencyKey];
		nou->next = iterator;
		frequencyTable[frequencyKey] = nou;

	}
}
void addElement(int key)
{
	nod *nou = NULL;
	int hashValue = hashFunction(key);
	if (hash[hashValue] == NULL)
	{
		nou = (nod*)malloc(sizeof(nod));
		nou->key = key;
		nou->frequency = 1;
		addFrequencyNode(key, 1);
		nou->next = NULL;
		hash[hashValue] = nou;
	}
	else //avem coliziune
	{
		nod *iterator;
		int gasit = 0;
		iterator = hash[hashValue];
		while (iterator != NULL)
		{
			if (iterator->key == key)
			{
				removeFrequencyNode(iterator->key, iterator->frequency);
				iterator->frequency += 1;
				addFrequencyNode(key, iterator->frequency);
				gasit = 1;
				break;
			}
			
			iterator = iterator->next;	
		}
		if (gasit == 0)//nu am gasit elementul curent si totusi avem coliziune => chaining
		{
			nou = (nod*)malloc(sizeof(nod));
			nou->key = key;
			nou->frequency = 1;
			nou->next = hash[hashValue];
			hash[hashValue] = nou;
			
		}
	}
}


int main(int argc, char* argv[])
{
	int n,k, i;
	scanf("%d", &n);
	scanf("%d", &k);
	for (i = 0; i < n; i++)
	{
		int x;
		scanf("%d", &x);
		addElement(x);
	}
	int p = 1;
	int index = 0;
	int kth_index = 0;
	while (p != k)
	{

		if (frequencyTable[index] != NULL)
		{
			p++;
			kth_index = index;
		}
		index++;
	}
		if (p == k)
		{
			printf("%d", frequencyTable[index]->key);
		}
		else
		{
			printf("Numarul diferit de elemente din datele de intrare e mai mic ca si k");
		}

	scanf("%d",&n);
	return 0;
}

