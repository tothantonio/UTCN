#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {

	int id;
	struct node_type* left, * right;

}NodeT;

NodeT* alloc(int val) {
	NodeT* q = calloc(1, sizeof(NodeT));
	if (!q)
		return NULL;
	q->id = val;
	return q;
}

void insertNode(NodeT** root, int val) {
	if (!root)
		return ;
	if (!(*root))
	{
		*root = alloc(val);
		return;
	}

	NodeT* node = *root;
	while(1)
	{
		if (val < node->id) {
			if (node->left == NULL) {
				node->left = alloc(val);
				return;
			}
			node = node->left;
		}
		else if (val > node->id) {
			if (node->right == NULL) {
				node->right = alloc(val);
				return;
			}
			node = node->right;
		}
		else return;
	}
}

void preorder(NodeT* root) {
	if (root) {
		printf("%d ", root->id);
		preorder(root->left);
		preorder(root->right);
	}
}

NodeT* ABC_perfect_echi(int arr[], int st, int dr) {
	if (st > dr)
		return NULL;

	NodeT* root = alloc(arr[(st + dr) / 2]);

	root->left = ABC_perfect_echi(arr, st, (st + dr) / 2 - 1);
	root->right = ABC_perfect_echi(arr, (st + dr) / 2 + 1, dr);

	return root;
}

int main()
{
	NodeT* root = NULL;
	int keys[] = { 1, 2, 3, 4, 5, 6, 7 };
	for (int i = 0; i < sizeof(keys) / sizeof(int); i++)
		insertNode(&root, keys[i]);

	preorder(root);
	printf("\n");

	NodeT* ABC = ABC_perfect_echi(keys, 0, sizeof(keys) / sizeof(int) - 1);

	preorder(ABC);
	return 0;
}