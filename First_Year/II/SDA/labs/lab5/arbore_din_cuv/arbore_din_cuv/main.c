#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node_type {
	char cuv[100];
	struct node_type* left, * right;
} NodeT;

NodeT* createNode(char* cuv) {
	NodeT* p = (NodeT*)malloc(sizeof(NodeT));
	if (!p)
		return NULL;

	strcpy_s(p->cuv, sizeof(p->cuv), cuv);
	p->left = p->right = NULL;
	return p;
}

NodeT* insertNode(NodeT* root, char* cuv) {
	if (root == NULL)
		return createNode(cuv);

	if (strcmp(cuv, root->cuv) < 0)
		root->left = insertNode(root->left, cuv);
	else if (strcmp(cuv, root->cuv) > 0)
		root->right = insertNode(root->right, cuv);

	return root;
}

void preorder(NodeT* root) {
	if (root) {
		printf("%s ", root->cuv);
		preorder(root->left);
		preorder(root->right);
	}
}

NodeT* findMin(NodeT* root) {
	while (root->left)
		root = root->left;
	return root;
}

NodeT* deleteNode(NodeT* root, char* cuv) {
	if (root == NULL)
		return root;

	if (strcmp(cuv, root->cuv) < 0)
		root->left = deleteNode(root->left, cuv);
	else if (strcmp(cuv, root->cuv) > 0)
		root->right = deleteNode(root->right, cuv);
	else {
		if (root->left == NULL) {
			NodeT* tmp = root->right;
			free(root);
			return tmp;
		}
		else if (root->right == NULL) {
			NodeT* tmp = root->left;
			free(root);
			return tmp;
		}

		NodeT* tmp = findMin(root->right);
		strcpy_s(root->cuv, sizeof(root->cuv), tmp->cuv);
		root->right = deleteNode(root->right, tmp->cuv);
	}
	return root;
}

void freeTree(NodeT* root) {
	if (root != NULL) {
		freeTree(root->left);
		freeTree(root->right);
		free(root);
	}
}

int main() {

	FILE* f = fopen("input.txt", "r");
	if (!f)
		return -1;

	NodeT* root = NULL;

	char cuv[100];
	while (fscanf_s(f, "%s", cuv, sizeof(cuv)) != EOF) {
		root = insertNode(root, cuv);
	}

	printf("Arborele in preordine:\n");
	preorder(root);
	printf("\n");

	printf("Introduceti cuvantul pe care doriti sa il stergeti: ");
	if (scanf_s("%s", cuv, sizeof(cuv)) != 1) {
		return -1;
	}

	root = deleteNode(root, cuv);

	printf("Arborele dupa stergere:\n");
	preorder(root);
	printf("\n");

	freeTree(root);
	fclose(f);
	return 0;
}
