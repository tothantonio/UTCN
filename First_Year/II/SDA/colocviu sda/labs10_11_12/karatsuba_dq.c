#include <stdio.h>
#include <stdlib.h>

int karatsuba(int x, int y){
    if(x < 10 || y < 10){
        return x * y;
    }
    int n = 1;
    if(x > y){
        n = x;
    }else{
        n = y;
    }
    n = n / 2;
    int a = x / n;
    int b = x % n;
    int c = y / n;
    int d = y % n;
    int ac = karatsuba(a, c);
    int bd = karatsuba(b, d);
    int abcd = karatsuba(a + b, c + d);
    return ac * n * n + (abcd - ac - bd) * n + bd;
}



int main(){

    int x = 1234;
    int y = 5678;

    int rez = karatsuba(x, y);
    printf("%d\n", rez);
    return  0;
}