%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

/*
    * Function to trim leading and trailing whitespace from a string.
    * This is used to clean up text values extracted from the XML.
*/
char* trim(char* str) {
    char *end;
    while(isspace((unsigned char)*str)) str++;
    if(*str == 0) return str;
    end = str + strlen(str) - 1;
    while(end > str && isspace((unsigned char)*end)) end--;
    end[1] = '\0';
    return str;
}
%}

// Define token types for the lexer
%%

"</"                { return ENDTAGOPEN; }
"<"                 { return LT; }
">"                 { return GT; }

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return IDENTIFIER;
}

[^<>\n\r\t ][^<>]* {
    char *cleaned = trim(yytext);
    yylval.str = strdup(cleaned);
    return TEXTVALUE;
}

[ \t\r\n]+   ; 
%%

int yywrap() { return 1; }