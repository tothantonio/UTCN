#include<stdio.h>
#include<stdlib.h>

typedef struct _nod
{
    int info;
    struct _nod *left;
    struct _nod *right;
}nod;

void pathExists(nod *root, int suma, int *done)
{
    if (*done != 1)
    {
        if ((suma - root->info) == 0 && root->left == NULL && root->right == NULL)
        {
            *done = 1;
        }
        else if ((suma - root->info) > 0)
        {
            if (root->left != NULL)
                pathExists(root->left, suma - root->info, done);
            if (root->right != NULL)
                pathExists(root->right, suma - root->info, done);
        }
    }
}
nod *createBinaryTreeFromFilte(FILE *f, int *nrNoduri)
{
    nod *p;
    int c;

    fscanf(f, "%d", &c);
    if (c == 0)
        return NULL;
    else
    {
        p = (nod *)malloc(sizeof(nod));
        if (p == NULL)
        {
            printf("Nu mai avem memorie");
            exit(1);
        }
        p->info = c;
        nrNoduri++;
        p->left = createBinaryTreeFromFilte(f, nrNoduri);
        p->right = createBinaryTreeFromFilte(f, nrNoduri);
    }
    return p;
}

int main(int argc, char* argv[])
{
    nod *root;
    int nrNoduri = 0;
    int suma,done;
    suma = 0;
    done = 0;
    FILE *f = fopen("arbore_sum.txt", "r");
    if (!f)
    {
        printf("Nu se poate deschide fisierul arbore.txt\n");
        return-1;
    }
    fscanf(f,"%d", &suma);

    root = createBinaryTreeFromFilte(f, &nrNoduri);
    fclose(f);

    pathExists(root, suma, &done);

    if (done)
        printf("There is a path from the root to a node having the sum %d\n", suma);
    else
        printf("There is no path from the root to a leaf with the given sum\n");

    return 0;
}
