#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {
	int id;
	struct node_type* left, * right;
}NodeT;


NodeT* create_tree_node(int val) {
	NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));
	if (!new_node)
		return NULL;
	new_node->id = val;
	new_node->left = NULL;
	new_node->right = NULL;
	return new_node;
}

NodeT* insert(NodeT* root, int val) {
	if (root == NULL)
		return create_tree_node(val);
	if (val < root->id)
		root->left = insert(root->left, val);
	else if (val > root->id)
		root->right = insert(root->right, val);
	return root;
}

void print_inorder(NodeT* root) {
	if (root) {
		print_inorder(root->left);
		printf("%d ", root->id);
		print_inorder(root->right);
	}
}

void freeTree(NodeT* root) {
	if (root) {
		freeTree(root->left);
		freeTree(root->right);
		free(root);
	}
}

int main() {

	//O(nlogn) complexity
	int n = 3;
	NodeT* root = NULL;
	for (int i = 0; i < n; i++)
	{
		int num;
		scanf_s("%d", &num);
		root = insert(root, num);
	}

	printf("Sirul ordonat:\n");
	print_inorder(root);
	
	freeTree(root);
	return 0;
}