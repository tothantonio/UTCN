%{
void yyerror (char *s);
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h> /* C exit function */
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%union {int num; char id;}         /* Yacc definitions */
%start line
%token print
%token exit_command
%token <num> number
%token <id> identifier
%type <num> line exp term 
%type <id> assignment

%%

/* descriptions of expected inputs     corresponding actions (in C) */

line    : assignment ';'		{/*your code here*/}
		| exit_command ';'	{/*your code here*/}
		| print exp ';'		{printf("Printing %d\n", $2);}
		| line assignment ';'	{/*your code here*/}
		| line print exp ';'	{/*your code here*/}
		| line exit_command ';'	{/*your code here*/}
        ;

assignment : identifier '=' exp  { /*your code here: use updateSymbolVal function */ }
			;
exp    	: term                  {/*your code here*/}
       	| exp '+' term          {/*your code here*/}
       	| exp '-' term          {/*your code here*/}
       	;
term   	: number                {/*your code here*/}
	| identifier		{/*your code here: use symbolVal function */} 
        ;

%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

