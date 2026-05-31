#include <stdio.h>
#include "myscanner.h"

extern int yylex();

int main(void){
    int ntoken;

    ntoken = yylex();
    while(ntoken){
        printf("%d\n", ntoken);
        ntoken = yylex();
    }
    return 0;
   
}