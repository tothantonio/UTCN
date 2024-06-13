#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int nr_cif(int x){
    int cnt = 0;
    while(x){
        cnt++;
        x /= 10;
    }
    return cnt;
} 
int karatsuba(int x, int y){
    if(x < 10 || y < 10){
        return x * y;
    }
    long long int m = nr_cif(x) > nr_cif(y) ? nr_cif(x) / 2: nr_cif(y) / 2 ;

    long long int x1 = x / pow(10, m);
    long long int x0 = x % (int)pow(10, m);

    long long int y1 = y / pow(10, m);
    long long int y0 = y % (int)pow(10, m);

    long long int z0 = karatsuba(x0, y0);
    long long int z2 = karatsuba(x1, y1);
    long long int z1 = karatsuba(x1 + x0, y1 + y0) - z2 - z0;

    return z2 * pow(10, 2 * m) + z1 * pow(10, m) + z0;
}

int main(){
    int x = 20;
    int y = 10;
    printf("%d\n", karatsuba(x, y));
    return 0;
}