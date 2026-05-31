%{

#include <stdio.h>
int yylex();
void yyerror(const char*);
int nr;
%}

%token ORDER PREFER QUANT PIZZA WITH INGREDIENT AND SIZE


%%
tot : prog {printf("numar total de ingrediente: %d", $1);}
    ;

prog: prog desc_order '.'    {$$=$1+$2;}
    | prog desc_pref   '.'    {$$=$1+$2;}
    |  {$$=0;}
    ;

desc_order:    ORDER QUANT desc_pizza {printf("_____COMANDA___\n");
                                       printf("Cantitate: %d\n", $2);
                                       printf("Ingrediente: %d\n", $3);
                                       $$=$3;
                                       } 
desc_pref:     PREFER  desc_pizza   {$$=$2;}

desc_pizza:  desc_size PIZZA WITH desc_ingred {$$=$4;}
           |  desc_size PIZZA  {$$=0;}
           ;

desc_size:  SIZE
         |
         ;
desc_ingred : desc_ingred concat INGREDIENT {$$=$1+1;}
            | INGREDIENT  {$$=1;}
            
            ;

concat:   ','
      |   ',' AND
      ;
