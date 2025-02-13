#include <stdio.h>
#include <stdlib.h>

#define MAX(a, b) ((a) > (b) ? (a) : (b))

typedef struct node_type {
	int id;
	struct node_type* left, * right;
}NodeT;

NodeT* createBinTreeFromFile(FILE* f) {
	NodeT* p;
	int c;
	fscanf_s(f, "%d", &c);
	if (c == 0)
		return NULL;
	else
	{
		p = (NodeT*)malloc(sizeof(NodeT));
		if (!p)
			return NULL;
		p->id = c;
		p->left = createBinTreeFromFile(f);
		p->right = createBinTreeFromFile(f);
	}
	return p;
}

void preorder(NodeT* root) {

	if (root != NULL) {
		printf("%d \n", root->id);
		preorder(root->left);
		preorder(root->right);
	}
}

int height(NodeT* root) {
	if (root == NULL)
		return 0;
	return 1 + MAX(height(root->left), height(root->right));
}

int adancime_max(NodeT* root) {
	if (root == NULL)
		return 0;
	else {
		int adancime_left = adancime_max(root->left);
		int adancime_right = adancime_max(root->right);
		return 1 + MAX(adancime_left, adancime_right);
	}
}

int diameter(NodeT* root) {
	if (root == NULL)
		return 0;

		int heightLeft = height(root->left);
		int heightRight = height(root->right);

		int diaLeft = diameter(root->left);
		int diaRight = diameter(root->right);

		return MAX(heightLeft + heightRight + 1, MAX(diaLeft, diaRight));
}

int main() {

	NodeT* root;
	FILE* f = fopen("arbore.txt", "r");
	if (!f)
		return -1;
	root = createBinTreeFromFile(f);
	preorder(root);
	printf("Inaltimea este: %d\n", height(root));
	printf("Adancimea maxima este: %d\n", adancime_max(root));
	printf("Diametrul este: %d", diameter(root));

	fclose(f);
	return 0;
}
