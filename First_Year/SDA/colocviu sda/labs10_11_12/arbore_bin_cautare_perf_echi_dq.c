#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    int key;
    struct nod *left, *right;
}Nod;   

Nod *newNode(int key){
    Nod *node = (Nod*)malloc(sizeof(Nod));
    node->key = key;
    node->left = node->right = NULL;
    return node;
}

Nod *construct(int *v, int st, int dr){
    if(st > dr){
        return NULL;
    }
    int mij = (st + dr) / 2;
    Nod *root = newNode(v[mij]);
    root->left = construct(v, st, mij - 1);
    root->right = construct(v, mij + 1, dr);
    return root;
}
void postorder(Nod *root){
    if(root){
        postorder(root->left);
        postorder(root->right);
        printf("%d ", root->key);
    }
}
int main(){

    int v[] = {4, 5, 8, 10, 12, 14, 16};

    int n = sizeof(v) / sizeof(v[0]);

    Nod *root = construct(v, 0, n - 1);

    postorder(root);

    return 0;
}