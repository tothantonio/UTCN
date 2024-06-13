#include <stdio.h>
#include <stdlib.h>

char* cel_mai_lung_prefix_comun(char **siruri, int n){
    if(n == 1){
        return siruri[0];
    }
    int mij = n / 2;
    char *s1 = cel_mai_lung_prefix_comun(siruri, mij);
    char *s2 = cel_mai_lung_prefix_comun(siruri + mij, n - mij);
    int i = 0;
    while(s1[i] && s2[i] && s1[i] == s2[i]){
        i++;
    }
    char *rez = (char*)malloc((i + 1) * sizeof(char));
    for(int j = 0; j < i; j++){
        rez[j] = s1[j];
    }
    rez[i] = '\0';
    return rez;
}


int main(){

    char *siruri[] = {"apple", "ape", "april"};
    int n = sizeof(siruri) / sizeof(siruri[0]);

    char *rez = cel_mai_lung_prefix_comun(siruri, n);
    printf("%s\n", rez);
    return 0;
}