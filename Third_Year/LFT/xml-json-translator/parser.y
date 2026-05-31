%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();

// Global variable to track indentation level for pretty-printing JSON

int indent = 0;
void printIndent() {
    for(int i = 0; i < indent; i++) printf("    ");
}
%}

%union {
    char* str;
}

// Define token types for the parser

%token LT GT ENDTAGOPEN
%token <str> IDENTIFIER
%token <str> TEXTVALUE

%%

// Grammar rules for parsing XML and converting to JSON

document:
    element { printf("\n"); }
    ;

element:
    LT IDENTIFIER GT
    {
        printf("\"%s\": ", $2);
    }
    content
    ENDTAGOPEN IDENTIFIER GT
    {
        if(strcmp($2, $7) != 0) {
            yyerror("Tag mismatch");
            exit(1);
        }
    }
    ;

// Content can be either text or nested elements 

content:
    TEXTVALUE 
    { 
        printf("\"%s\"", $1); 
        free($1); 
    }
    | 
    { 
        printf("{\n"); 
        indent++; 
    } 
    element_list 
    { 
        printf("\n"); 
        indent--; 
        printIndent(); 
        printf("}"); 
    }
    ;

// List of elements, separated by commas

element_list:
    { printIndent(); } element
    | element_list { printf(",\n"); printIndent(); } element
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "\nEroare: %s\n", s);
}

// Main function to start the parsing process

int main() {
    printf("{\n");
    indent++;
    yyparse();
    indent--;
    printf("}\n");
    return 0;
}