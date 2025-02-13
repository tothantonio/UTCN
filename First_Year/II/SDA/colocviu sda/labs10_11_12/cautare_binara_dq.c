#include <stdio.h>
#include <stdlib.h>


int cautare_binara(int *v, int n, int x){
    int st = 0, dr = n - 1;
    while(st <= dr){
        int mij = (st + dr) / 2;
        if(v[mij] == x){
            return mij;
        }
        if(v[mij] < x){
            st = mij + 1;
        }else{
            dr = mij - 1;
        }
    }
    return -1;
}

int main(){

    int v[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int n = sizeof(v) / sizeof(v[0]);
    int x = 10;

    int rez = cautare_binara(v, n, x);
    if(rez == -1){
        printf("Elementul %d nu a fost gasit\n", x);
    }else{
        printf("Elementul %d a fost gasit pe pozitia %d\n", x, rez);
    }

    return 0;
}