%{
#include <stdio.h>
#include <stdlib.h>

typedef struct _node {
     int type;
     struct _node *first;
     struct _node *second;
     struct _node *third;
     int value;
    } node;

node *opr2(int type, node * first, node *second);
node *opr3(int type, node * first, node *second, node *third);
node *setConst(int value);
void printpre(node *np);

%}


%union { int number;
         char variable;
         struct _node *np;}

%token IF THEN ELSE 
%token <variable> ID
%token <number> NUMBER

%nonassoc THEN
%nonassoc ELSE
%left '+' 
%left '*'

%type <np> prog stmt if_stmt exp cond

%%
prog: prog stmt {printpre($2);}
    | /* nothing */
    ;

if_stmt : IF '(' cond ')'  THEN stmt 
          {$$ = opr3(IF, $3, $5, NULL);}
        | IF '(' cond ')'  THEN stmt ELSE stmt
          {$$ = opr3(IF, $3, $5, $7);}
        ;
stmt : if_stmt {$$ = $1;}
     | ID '=' exp {$$ = opr2('=', opr2(ID, setConst($1), NULL), $3);} 
     |exp {$$ = $1;}
       ;

exp : NUMBER {$$=setConst($1);}
    | ID  {$$=opr2(ID, setConst($1), NULL);}
    | exp '+' exp {$$ = opr2('+', $1, $3);}
    | exp '*' exp {$$ = opr2('*', $1, $3);}
    ;
cond : exp '>' exp {$$ = opr2('>', $1, $3);}
    ;

%%
/*your code here:
include functions from if_functions.c which are needed */

node *opr2(int type, node *first, node *second){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = NULL;
   return p;
}

node *opr3(int type, node *first, node *second, node * third){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = third;
   return p;
}

node *setConst(int value){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= NUMBER;
   p->value=value;
   p->first = p->second = p->third = NULL;
   return p;
}

void printpre(node *opr){
    if (opr==NULL)
       return ;
    if (opr->type ==NUMBER)
       printf("%i ", opr->value);
    else
     {
      switch (opr->type ){
      case IF: printf("( IF ");break;
      case ID: printf("( Variable ");  break;
      default : printf(" ( %c ", opr->type);
      }
      printpre(opr->first);
      printpre(opr->second);
      if (opr->third) printpre(opr->third);
      printf(" ) ");
     }
 
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
