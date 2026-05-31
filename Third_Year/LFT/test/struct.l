%{
#include "y.tab.h"
#include <string.h>
%}

%%
"\"struct\""            { return STRUCT_KEY; }
"\"members\""           { return MEMBERS_KEY; }
"\"type\""              { return TYPE_KEY; }
"\"name\""              { return NAME_KEY; }

"\"int\""|"\"float\""|"\"char\""|"\"double\"" { 
    yylval.str = strndup(yytext + 1, strlen(yytext) - 2); 
    return VALID_TYPE; 
}

\"[a-zA-Z_][a-zA-Z0-9_]*\" { 
    yylval.str = strndup(yytext + 1, strlen(yytext) - 2); 
    return IDENTIFIER; 
}

\"\" { 
    yylval.str = strdup(""); 
    return IDENTIFIER; 
}

":"                     { return COLON; }
","                     { return COMMA; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
"["                     { return LBRACKET; }
"]"                     { return RBRACKET; }

[ \t\n\r\xa0]+          { /* ignore whitespace */ }

.                       { printf("Lexical Error: Illegal character '%s'\n", yytext); return ERROR; }
%%

int yywrap() { return 1; }