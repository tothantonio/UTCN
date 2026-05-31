%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);  
%}

%token IDENTIFIER
%token COLON
%token TYPE
%token NAME
%token TABLE_PREFIX
%token PORT
%token INTEGER

%start configuration
%%

/* pay attention to the new line character in the test file */
configuration : configuration conf '\n'
              | /*NULL*/
              ;


conf : 
       |TYPE COLON IDENTIFIER {printf("\n descriere type");}
       |TABLE_PREFIX COLON IDENTIFIER  {printf("\n descriere prefix");}
       |PORT COLON INTEGER           {printf("\n descriere port ");} 
          
       | NAME COLON IDENTIFIER  {printf("\n descrierea numelui bazei de date ");} 
          ;
%%


