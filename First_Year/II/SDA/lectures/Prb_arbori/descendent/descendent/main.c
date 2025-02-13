#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node_type {
	int id;
	struct node_type* left, * right;
}NodeT;

NodeT* createTreeNode(int val) {
	NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));
	if (!new_node)
		return NULL;
	new_node->id = val;
	new_node->left = NULL;
	new_node->right = NULL;
	return new_node;
}

bool exista(NodeT* root, int val) {
	if (root == NULL)
		return false;
	if (root->id == val)
		return true;
	return exista(root->left, val) || exista(root->right, val);
}

bool isDescendent(NodeT* root, int x, int y) {
	if (root == NULL)
		return false;

	if (root->id == x) {
		printf("%d \n", root->id);
		return exista(root, y);
	}
	bool left = isDescendent(root->left, x, y);
	bool right = isDescendent(root->right, x, y);
	if (left || right)
	{
		printf("%d ", root->id);
		return true;
	}
	return false;
}

int main() {

	NodeT* root = createTreeNode(20);
	root->left = createTreeNode(10);
	root->right = createTreeNode(30);
	root->left->left = createTreeNode(5);
	root->left->right = createTreeNode(15);
	root->right->left = createTreeNode(25);
	root->right->right = createTreeNode(35);

	int x = 20; // Cheia x
	int y = 15; // Cheia y

	// Verificam daca y este descendentul lui x si afisam calea de la x la y
	if (isDescendent(root, x, y)) {
		printf("%d\n", y);
	}
	else {
		printf("%d nu este descendentul lui %d\n", y, x);
	}
	free(root->left->left);
	free(root->left->right);
	free(root->right->left);
	free(root->right->right);
	free(root->left);
	free(root->right);
	free(root);

	return 0;
}