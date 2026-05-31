
%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);  
extern int yylineno;
%}

%token <svalue> IDENTIFIER

%token COLON
%token TYPE
%token NAME
%token TABLE_PREFIX
%token PORT
%token <ivalue> INTEGER
%start configuration 


%union { int ivalue;
         char* svalue;
       }
%%

configuration : configuration conf 
              | /*NULL*/
              ;
conf : PORT COLON INTEGER          {printf("port: %i\n", $3);} 
      | TYPE COLON IDENTIFIER      {printf("Type: %s\n", $3);} 
      | NAME COLON IDENTIFIER      {printf("Name: %s\n", $3);} 
      | TABLE_PREFIX COLON IDENTIFIER  {printf("Prefix: %s\n", $3);} 
      ;
 

%%

void yyerror(const char *s){
    fprintf(stderr,"At line %d %s ",yylineno, s);
}