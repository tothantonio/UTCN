#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[]={NULL, "db_type", "db_name", "db_table_prefix", "db_port"};

int main(void){
    int ntoken, vtoken;

    ntoken = yylex();
    while(ntoken){
        printf("%d\n", ntoken);
        if (yylex()  != COLON){
	    printf("Syntax error in line %d, expected a ':', but found %s\n", yylineno, yytext);
            return 1;
        }
        vtoken = yylex();
	switch(ntoken){
        case TYPE:
        if (vtoken != TYPE) {
            printf("Syntax error in line %d\n", yylineno);
            return 1;
          }
            printf("%s is set to %s\n", names[ntoken], yytext);
        case NAME:
        case TABLE_PREFIX:
          //your code here: you should check that vtoken has the right type
          if (vtoken != IDENTIFIER) {
            printf("Syntax error in line %d\n", yylineno);
            return 1;
          }
           break;
        case PORT:
          //your code here: you should check that vtoken has the right type
          if (vtoken != INTEGER) {
            printf("Syntax error in line %d\n", yylineno);
            return 1;
          }
            printf("%s is set to %s\n", names[ntoken], yytext);
          break;
       default:        
           printf("Syntax error in line %d\n", yylineno);
       }
       //your code here:continue with the next item
        ntoken = yylex();
    }
    return 0;
   
}
