#include <stdio.h>
#include <stdlib.h>

#define MAX(a, b) (((a) > (b)) ? (a) : (b))
typedef struct node_type
{
    int id; /* numele nodului */
    /* alte informatii  utile */
    struct node_type *left, *right;
} NodeT;

void fatalError( const char *msg )
{
    printf( msg );
    printf( "\n" );
    exit ( 1 );
}

void postorder( NodeT *p ){

    if (!p)
    {
        postorder(p->left);
        postorder(p->right);
        printf("%d\n", p->id);
    }

}

void inorder( NodeT *p ){
    printf("%d\n", p->id);
    postorder(p->left);
    postorder(p->right);
}

int leaf_node(NodeT *node){
    if (!node)
        return 0;
    else if (node->left == NULL && node->right == NULL)
        return 1;
    else return leaf_node(node->left) + leaf_node(node->right);
   return 0;
}

int noduri_interne(NodeT *node){
   //scrieti codul pentru calcularea numarului de noduri interne ale unui
    if (node == NULL || (node->left == NULL && node->right == NULL))
        return 0;
    else return 1 + noduri_interne(node->left) + noduri_interne(node->right);
}

int inaltime(NodeT *node){
   //scrieti codul pentru calcularea inaltimii unui arbore
    if (!node)
        return -1;
    else return 1 + MAX(inaltime(node->left), inaltime(node->right));
}

void preorder( NodeT *p )
/*
 * p = nodul curent;
*/
{
    if ( p != NULL )
    {
        printf( "%d \n", p->id );
        preorder( p->left);
        preorder( p->right);
    }
}
//creaza un arbore binar prin citirea de la tastatura
NodeT *createBinTree( int branch, NodeT *parent )
{
    NodeT *p;
    int id;

    /* read node id */
    if ( branch == 0 )
        printf( "Valoarea pentru radacina [0 pt null] =" );
    else if ( branch == 1 )
        printf( "Fiul stang al nodului cu valoarea %d [0 pt null] =",
                parent->id );
    else
        printf( "Fiul drept al nodului cu valoarea %d [0 pt null] =",
                parent->id );
    scanf_s("%d", &id);
    if ( id == 0 )
        return NULL;
    else
    {
        /* construim nodul la care pointeaza p */
        p = ( NodeT *)malloc(sizeof( NodeT ));
        if ( p == NULL ){
            printf( "Nu mai avem memorie in createBinTree" );
            exit(1);
        }
        /* fill in node */
        p->id = id;
        p->left = createBinTree( 1, p );
        p->right = createBinTree( 2, p );
    }
    return p;
}
NodeT *createBinTreeFromFile(FILE* f)
{
  NodeT *p;
  int c;

  /* se citeste id-ul nodului */
  fscanf_s(f, "%d", &c);
  if ( c == 0 )
    return NULL; /* arbore vid, nu facem nimic */
  else /* else inclus pentru claritate */
  { /* construim nodul la care pointeaza p */
    p = ( NodeT *) malloc( sizeof( NodeT ));
    if ( p == NULL )
      fatalError( "Nu mai avem memorie in createBinTree" );
    /* se populeaza nodul */
    p->id = c;
    p->left = createBinTreeFromFile(f);
    p->right = createBinTreeFromFile(f);
  }
  return p;
}

NodeT* search(NodeT* root, int key) {
    if (root == NULL)
        return NULL;
    if (root->id == key)
        return root;

        return search(root->left, key);
    return search(root->right, key);
}


int main()
{
    NodeT *root;
    FILE *f = fopen("ArboreBinar.txt", "r");
    if (!f){
        printf("Nu se poate deschide fisierul ArboreBinar.txt\n");
        return -1;
    }
    root = createBinTreeFromFile(f);
    fclose(f);


    printf( "\nParcurgere in preordine\n" );
    preorder( root );

	//TODO
	postorder(root);

	inorder(root);

	int nr_frunze = leaf_node(root);
	printf("Numarul de frunze este %d\n", nr_frunze);//3

    printf("Noduri interne = %d \n", noduri_interne(root));//5

    printf("Inaltimea arborelui = %d \n", inaltime(root)); //3

    NodeT* node = search(root, 7);
    printf("Inaltimea nodului cautat = %d\n", inaltime(node));
    return 0;
}
