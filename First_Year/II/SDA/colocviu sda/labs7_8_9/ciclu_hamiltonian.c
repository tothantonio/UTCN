#include <stdio.h>
#include <stdlib.h>

int path[50], vizitat[50];
int n;
int m[50][50];

void print_path(){
    for(int i = 0; i < n; i++)
        printf("%d ", path[i]);
    printf("%d\n", path[0]);
}

int is_valid(int nod, int poz){
    if(m[path[poz - 1]][nod] == 65535)
        return 0;
    
    for(int i = 0; i < poz; i++)
        if(path[i] == nod)
            return 0;
    
    return 1;
}

int backT(int poz){
    if(poz == n){
        if(m[path[poz - 1]][path[0]] != 65535)
            return 1;
        else return 0;
    }

    for(int i = 1; i < n; i++){
        if(is_valid(i, poz)){
            path[poz] = i;
            vizitat[i] = 1;
            if(backT(poz + 1) == 1)
                return 1;
            vizitat[i] = 0;
        }
    }
    return 0;
}
int main(){

    printf("Introduceti numarul de noduri: ");
    scanf("%d", &n);

    printf("Matricea de costuri:\n");
    for(int i = 0 ; i < n; i++){
        for(int j = 0; j < n; j ++){
            scanf("%d", &m[i][j]);
        }
    }

    path[0] = 0;
    vizitat[0] = 1;
    if(backT(1)){
        print_path(path);
    }
    else printf("Nu exista solutie.");
    return 0;
}