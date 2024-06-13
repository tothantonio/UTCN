#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {

	int id;
	struct node_type* left, * right;

}NodeT;

NodeT* alloc(int key) {
	NodeT* q = calloc(1, sizeof(NodeT));
	if (q == NULL)
		return NULL;
	q->id = key;
	return q;
}

void insert(NodeT** root, int key) {
	if (!root)
		return NULL;
	if (!(*root))
	{
		*root = alloc(key);
		return;
	}

	if (key < (*root)->id)
		insert(&((*root)->left), key);
	else if (key > (*root)->id)
		insert(&((*root)->right), key);
}

int arbori_in_oglinda(NodeT* rootA, NodeT* rootB) {

	if (rootA == NULL && rootB == NULL)
		return 1;

	if (rootA == NULL || rootB == NULL)
		return 0;

	return (rootA->id == rootB->id) && arbori_in_oglinda(rootA->left, rootB->right) && arbori_in_oglinda(rootA->right, rootB->left);	
}

int main() {

	NodeT* rootA = NULL;
	NodeT* rootB = NULL;

	int keys1[] = {1, 3, 2, 5, 4};
	int keys2[] = {1, 2, 4, 5, 3};

	for (int i = 0; i < sizeof(keys1) / sizeof(int);i++)
		insert(&rootA, keys1[i]);

	for (int i = 0; i < sizeof(keys2) / sizeof(int);i++)
		insert(&rootB, keys2[i]);

	if (arbori_in_oglinda(rootA, rootB))
		printf("Arborii sunt in oglinda");
	else printf("Nu sunt in oglinda");
	return 0;
}