#include <stdio.h>
#include <stdlib.h>

typedef struct _TREE_NODE
{
    int key;
    struct _TREE_NODE *left;
    struct _TREE_NODE *right;
} TREE_NODE;

TREE_NODE* alloc(int x)
{
    TREE_NODE* q = calloc(1, sizeof(TREE_NODE));
	if (q == NULL)
		return NULL;
    q->key = x;
    return q;
}

void insertNode(TREE_NODE** root, int key) { //O(h)
    if (root == NULL) {
        return;
    }

    //Insert in empty tree
    if (*root == NULL) {
        *root = alloc(key);
        return;
    }

    TREE_NODE* node = *root;

    while (1) {
        if (key < node->key) {
            if (node->left == NULL) {
                node->left = alloc(key);
                return;
            }
            node = node->left;
        }
        else if (key > node->key) {
            if (node->right == NULL) {
                node->right = alloc(key);
                return;
            }
            node = node->right;
        }
        else return;
    }
}

void insertNodeRec(TREE_NODE** root, int key){ // poti face fara double pointer, returnand nodul 
    if (root == NULL){
        return;
    }
    //Insert in empty tree
    if (*root == NULL) {
        *root = alloc(key);
        return;
    }

    if (key < (*root)->key) {
        insertNodeRec(&((*root))->left, key);
    }
    else if (key > (*root)->key) {
        insertNodeRec(&((*root))->right, key);
    }
}

TREE_NODE* searchKey(TREE_NODE* root, int key) {
    if (root == NULL) return NULL;
    if (root->key == key) return root;
    else if (key < root->key)
        return searchKey(root->left, key);
    else return searchKey(root->right, key);
}

TREE_NODE* findMin(TREE_NODE* root) {
    if (root == NULL)
        return NULL;
    while (root->left != NULL)
        root = root->left;
    return root;
}

TREE_NODE* findMax(TREE_NODE* root) {
    if (root == NULL)
        return NULL;
    while (root->right != NULL)
        root = root->right;
    return root;
}

TREE_NODE* succesor(TREE_NODE* root, TREE_NODE* node) {
    if (node->right != NULL) return findMin(node->right);

    else if(node->right == NULL)
    {
        TREE_NODE* succ = NULL;
        while (root != NULL) {
            if (node->key < root->key) {
                succ = root;
                root = root->left;
            }
            else if (node->key > root->key)
                root = root->right;

            else break;
        }
        return succ;
    }
}

TREE_NODE* predecesor(TREE_NODE* root, TREE_NODE* node) {
    if (node->left != NULL) return findMax(node->left);

    else if (node->left == NULL) {
        TREE_NODE* pred = NULL;
        while (root != NULL) {
            if (node->key > root->key) {
                pred = root;
                root = root->right;
            }
            else if (node->key < root->key)
                root = root->left;

            else break;
        }
        return pred;
    }
}

void deleteKey(TREE_NODE** root, int key) { // O(h)
    if (root == NULL || *root == NULL)
        return;

    TREE_NODE* node = *root;
    if (key < node->key) {
        deleteKey(&(node->left), key);
    }

    else if (key > node->key) {
        deleteKey(&(node->right), key);
    }

    else {
        // caz 1 - nodul este frunza 
        if (node->left == NULL && node->right == NULL)
        {
            *root = NULL; // foarte important, nu trebuie sa folosesc un parent
            free(node);
            return;
        }

        // caz 2 - are copil drept
        if (node->left == NULL)
        {
            *root = node->right; 
            free(node);
            return;
        }

        // caz 2* - are copil stang
        if (node->right == NULL)
        {
            *root = node->left;
            free(node);
            return;
        }

        // caz 3 - are 2 copii
        TREE_NODE* succ = node->right;
        TREE_NODE* succ_parent = node;

        while (succ->left != NULL) {
            succ_parent = succ;
            succ = succ->left;
        }

        node->key = succ->key; // pun succ in nodul pe care vr sa l sterg

        if (succ == succ_parent->right) { // daca merg doar o singura data in dreapa si gasesc succesorul
            succ_parent->right = succ->right; // sau (*root)->right = succ->right
         
        }
        else if (succ == succ_parent->left) {
            succ_parent->left = succ->right;
        }
        free(succ);
    }
}

void inOrder(TREE_NODE* root) {
    if (root != NULL) {
        inOrder(root->left);
        printf("%d ", root->key);
        inOrder(root->right);
    }
}

void preOrder(TREE_NODE* root) {
    if (root != NULL) {
        printf("%d ", root->key);
        preOrder(root->left);
        preOrder(root->right);
    }
}

void postOrder(TREE_NODE* root) {
    if (root != NULL) {
        postOrder(root->left);
        postOrder(root->right);
        printf("%d ", root->key);
    }
}

int main()
{
    TREE_NODE* root = NULL;

    int keys[] = {15, 6, 18, 17, 20, 3, 7, 2, 4, 13, 9};
    for (int i = 0; i < sizeof(keys) / sizeof(int); i++)
        insertNode(&root, keys[i]);

    printf( "\nPreorder listing\n" );
    preOrder( root);
    printf( "\nInorder listing\n" );
    inOrder( root );
    printf( "\nPostorder listing\n" );
    postOrder( root);
    printf("\n");

    int search_keys[] = {15, 6, 18, 17, 20, 3, 7, 2, 4, 13, 9, -1, 0, 12, 30};
    for(int i = 0; i < sizeof(search_keys) / sizeof(int); i++){
        TREE_NODE* q = searchKey(root, search_keys[i]);
        if (q)
            printf("nodul cu cheia %d a fost gasit la %p\n", search_keys[i], q);
        else
            printf("nodul cu cheia %d nu a fost gasit\n", search_keys[i]);
    }

    TREE_NODE* q = findMin(root);
    printf("Nodul cu cheie minima este: %d %p\n", q->key, q);
    printf("Parcurgere succesori:\n");
    while(q){
        printf("%d ", q->key);
        q = succesor(root, q);
    }
    printf("\n");

    q = findMax(root);
    printf("Nodul cu cheie maxima este: %d %p\n", q->key, q);
    printf("Parcurgere predecesori:\n");
    while(q){
        printf("%d ", q->key);
        q = predecesor(root, q);
    }
    printf("\n");

    int delete_keys[] = {9, 7, 3, 15, 18, -1, 0, 12, 30, 2, 4, 6, 13, 17, 20, 21, 20};
    printf("Arborele inainte de stergeri:\n");
    inOrder(root);
    printf("\n");
    for(int i = 0; i < sizeof(delete_keys) / sizeof(int); i++){
        deleteKey(&root, delete_keys[i]);
        printf("dupa stergere nod cu %d\n", delete_keys[i]);
        inOrder(root);
        printf("\n");
    }

    return 0;
}
