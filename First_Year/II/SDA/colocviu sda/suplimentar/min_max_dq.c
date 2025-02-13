#include <stdio.h>
#include <stdlib.h>
int minim(int a, int b){
    return a < b ? a : b;
}

int maxim(int a, int b){
    return a > b ? a : b;
}

int minMax(int *v, int left, int right, int *min, int *max){
    if(left == right){
        *min = v[left];
        *max = v[left];
        return 0;
    }

    if(left == right - 1){
        *min = v[left] < v[right] ? v[left] : v[right];
        *max = v[left] > v[right] ? v[left] : v[right];
        return 0;
    }

    int mid = (left + right) / 2;
    int min1, max1, min2, max2;
    minMax(v, left, mid, &min1, &max1);
    minMax(v, mid + 1, right, &min2, &max2);

    *min = minim(min1, min2);
    *max = maxim(max1, max2);
}

void hanoi(int n, char a, char b, char c){
    if(n == 1){
        printf("Mutam discul 1 de pe tija %c pe tija %c\n", a, c);
        return;
    }
    hanoi(n - 1, a, c, b);
    printf("Mutam discul %d de pe tija %c pe tija %c\n", n, a, c);
    hanoi(n - 1, b, a, c);
}

int suma(int *v, int left, int right){
    if(left == right){
        return v[left];
    }

    if(left == right - 1){
        return v[left] + v[right];
    }

    int mid = (left + right) / 2;
    return suma(v, left, mid) + suma(v, mid + 1, right);
}

int main(){

    int v[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    int n = sizeof(v) / sizeof(v[0]);

    int min, max;

    minMax(v, 0, n - 1, &min, &max);

    printf("Minimul este %d, iar maximul este %d\n", min, max);

    int n1 = 3;
    hanoi(n1, 'A', 'B', 'C');

    int s = suma(v, 0, n - 1);
    printf("Suma elementelor este %d\n", s);
    return 0;
}