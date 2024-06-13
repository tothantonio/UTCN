#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {

	int id;
	struct node_type* left, *right;

}NodeT;

NodeT* createBalBinTree(int nbOfNdodes) {
	NodeT* p;
	int nLeft, nRight;

	if (nbOfNdodes <= 0) return NULL;
	else {
		nLeft = nbOfNdodes / 2;
		nRight = nbOfNdodes - nLeft - 1;
		p = (NodeT*)malloc(sizeof(NodeT));
		if (!p)
			return NULL;
		printf("\nNode identifier = ");
		scanf_s("%d", &(p->id));
		p->left = createBalBinTree(nLeft);
		p->right = createBalBinTree(nRight);
	}
	return p;
}

void preorder(NodeT* p) {
	if (!p)
		return NULL;
	else {
		printf("%d\n", p->id);
		preorder(p->left);
		preorder(p->right);
	}
}

int main() {
		
	NodeT* root = NULL;
	int nbOfNodes = 0;

	printf("\n Numarul de noduri din arbore este: ");
	scanf_s("%d", &nbOfNodes);
	root = createBalBinTree(nbOfNodes);
	preorder(root);
	return 0;
}