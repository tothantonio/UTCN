#include <stdio.h>
#include <stdlib.h>

struct TreeNode {
    int val;
    struct TreeNode* left;
    struct TreeNode* right;
};

// Funcție pentru a crea un nod nou în arbore
struct TreeNode* createNode(int val) {
    struct TreeNode* newNode = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    if (newNode == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }
    newNode->val = val;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Funcție pentru a insera un nod în arbore
struct TreeNode* insertNode(struct TreeNode* root, int val) {
    if (root == NULL) {
        return createNode(val);
    }
    if (val < root->val) {
        root->left = insertNode(root->left, val);
    }
    else if (val > root->val) {
        root->right = insertNode(root->right, val);
    }
    return root;
}

// Funcție care verifică dacă există un șir de k noduri în arbore cu suma m
int checkSequence(struct TreeNode* root, int k, int m) {
    if (root == NULL) {
        return 0;
    }
    // Verificăm dacă există un șir de k noduri începând cu nodul curent
    return checkSequenceFromNode(root, k, m) ||
        // Verificăm pentru subarborii stângi și drept
        checkSequence(root->left, k, m) ||
        checkSequence(root->right, k, m);
}

// Funcție care verifică dacă există un șir de k noduri începând cu un nod specific
int checkSequenceFromNode(struct TreeNode* node, int k, int m) {
    if (node == NULL) {
        return 0;
    }
    // Încercăm să găsim un șir de lungime k începând cu acest nod
    return checkSum(node, k, m, 0) ||
        checkSequenceFromNode(node->left, k, m) ||
        checkSequenceFromNode(node->right, k, m);
}

// Funcție care verifică dacă există un șir de k noduri cu suma m, pornind de la un nod specific
int checkSum(struct TreeNode* node, int k, int m, int sum) {
    if (node == NULL) {
        return 0;
    }
    sum += node->val;
    // Dacă am ajuns la un șir de lungime k, verificăm suma
    if (k == 1) {
        return sum == m;
    }
    // Verificăm pentru subarborele stâng și subarborele drept
    return checkSum(node->left, k - 1, m, sum) || checkSum(node->right, k - 1, m, sum);
}

// Funcție pentru eliberarea memoriei folosite de arbore
void freeTree(struct TreeNode* root) {
    if (root != NULL) {
        freeTree(root->left);
        freeTree(root->right);
        free(root);
    }
}

// Funcția principală
int main() {
    // Citirea valorilor pentru k și m
    int k, m;
    printf("Introduceți valoarea pentru k: ");
    scanf_s("%d", &k);
    printf("Introduceți valoarea pentru m: ");
    scanf_s("%d", &m);

    // Construirea arborelui binar de căutare
    struct TreeNode* root = NULL;
    int num;
    printf("Introduceți valorile pentru noduri (introduceți -1 pentru a încheia): ");
    while (1) {
        scanf_s("%d", &num);
        if (num == -1) {
            break;
        }
        root = insertNode(root, num);
    }

    // Verificarea pentru fiecare caz
    printf("\nRezultatele pentru fiecare caz:\n");
    printf("1. k = 2 și m = 0: %s\n", checkSequence(root, 2, 0) ? "Există" : "Nu există");
    printf("2. k = 3 și m = 0: %s\n", checkSequence(root, 3, 0) ? "Există" : "Nu există");
    printf("3. k = 3 și m > 0: %s\n", checkSequence(root, 3, m) ? "Există" : "Nu există");

    // Eliberarea memoriei
    freeTree(root);

    return 0;
}
