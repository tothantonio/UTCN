%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
extern int yylex();
%}

%union {
    char *str;
}

%token <str> IDENTIFIER VALID_TYPE
%token STRUCT_KEY MEMBERS_KEY TYPE_KEY NAME_KEY
%token COLON COMMA LBRACE RBRACE LBRACKET RBRACKET ERROR

%%

start:
    LBRACE struct_def COMMA members_def RBRACE { 
        printf("Validation Successful: Correct C Struct Definition.\n"); 
    }
    ;

struct_def:
    STRUCT_KEY COLON IDENTIFIER { 
        if (strlen($3) == 0) { 
            printf("Error: missing identifier (Input 2)\n"); 
            YYABORT; 
        }
    }
    | STRUCT_KEY COLON ERROR { YYABORT; } /* Caught by lexer */
    | STRUCT_KEY COLON COLON { 
        printf("Error: misplaced operator (Input 4)\n"); 
        YYABORT; 
    }
    ;

members_def:
    MEMBERS_KEY COLON LBRACKET member_list RBRACKET
    ;

member_list:
    /* empty */ 
    | member_obj
    | member_list COMMA member_obj
    ;

member_obj:
    LBRACE TYPE_KEY COLON VALID_TYPE COMMA NAME_KEY COLON IDENTIFIER RBRACE
    | LBRACE TYPE_KEY COLON IDENTIFIER COMMA NAME_KEY COLON IDENTIFIER RBRACE {
        printf("Error: unrecognized data type '%s' (Input 5)\n", $4);
        YYABORT;
    }
    | LBRACE error RBRACE { 
        printf("Error: incomplete definition (Input 6)\n"); 
        YYABORT; 
    }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Status: %s\n", s);
}

int main() {
    return yyparse();
}