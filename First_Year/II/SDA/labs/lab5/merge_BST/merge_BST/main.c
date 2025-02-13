#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {
	int id;
	struct node_type* left, * right;
} NodeT;

NodeT* alloc(int val) {
	NodeT* q = calloc(1, sizeof(NodeT));
	if (!q)
		return NULL;
	q->id = val;
	return q;
}

void insertNode(NodeT** root, int key) {
	if (!root)
		return;
	if (!(*root)) {
		*root = alloc(key);
		return;
	}

	if (key < (*root)->id) {
		insertNode(&((*root)->left), key);
	}
	else if (key > (*root)->id) {
		insertNode(&((*root)->right), key);
	}
}

NodeT* merge(NodeT* rootA, NodeT* rootB) {
	if (!rootA)
		return rootB;
	if (!rootB)
		return rootA;

	insertNode(&rootA, rootB->id);

	rootA->left = merge(rootA->left, rootB->left);
	rootA->right = merge(rootA->right, rootB->right);

	return rootA;
}

void inorder(NodeT* root) {

	if (root) {
		inorder(root->left);
		printf("%d ", root->id);
		inorder(root->right);
	}
}

int main() {
	NodeT* root1 = NULL;
	int keys1[] = { 10, 5, 15 };
	for (int i = 0; i < sizeof(keys1) / sizeof(int); i++)
		insertNode(&root1, keys1[i]);

	NodeT* root2 = NULL;
	int keys2[] = { 20, 25, 12 };
	for (int i = 0; i < sizeof(keys2) / sizeof(int); i++)
		insertNode(&root2, keys2[i]);

	printf("Inorder traversal of tree 1: ");
	inorder(root1);
	printf("\n");

	printf("Inorder traversal of tree 2: ");
	inorder(root2);
	printf("\n");

	NodeT* result = merge(root1, root2);

	printf("Inorder traversal of merged tree: ");
	inorder(result);
	printf("\n");

	return 0;
}
