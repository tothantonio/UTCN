#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {
	int id;
	struct node_type* left, * right;
}NodeT;

NodeT* head = NULL, * tail = NULL;

NodeT* createBinTreeFromFIle(FILE* f) {
	NodeT* p;
	int c;
	fscanf_s(f, "%d", &c);
	if (c == 0)
		return NULL;
	else {
		p = (NodeT*)malloc(sizeof(NodeT));
		if (!p)
			return NULL;
		p->id = c;
		p->left = createBinTreeFromFIle(f);
		p->right = createBinTreeFromFIle(f);
	}
	return p;
}

void print(NodeT* node) {
	while (node != NULL)
	{
		printf("%d ", node->id);
		node = node->right;
	}
	printf("\n");
}
	
void Bin2DLL(NodeT* root) {
	if (root == NULL)
		return;

	Bin2DLL(root->left);

	if (head == NULL)
		head = tail = root;
	else {
		tail->right = root;
		root->left = tail;	
		tail = root;
	}
	
	Bin2DLL(root->right);
}

int main() {

	NodeT* root;
	FILE* f = fopen("arbore.txt", "r");
	if (!f)
		return -1;
	root = createBinTreeFromFIle(f);
	Bin2DLL(root);
	print(head);

	fclose(f);
	return 0;
}