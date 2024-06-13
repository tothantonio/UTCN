#include <stdio.h>
#include <math.h>

int main() {
    double AX = 5;
    double BX = 13;
    double DI = 2;
    double a = 13;
    double y = 4;

    double sum_result = 0;
    for(int j = 1; j < 20; j++)
        sum_result += ((j * AX) / pow(a, y) - pow(BX, DI)) / (20 + j);

    printf("The result is: %f\n", sum_result);

    return 0;
}
