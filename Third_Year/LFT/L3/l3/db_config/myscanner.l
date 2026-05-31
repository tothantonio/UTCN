%{
#include <stdio.h>
#include "myscanner.h"
%}

%%

db_type         { return TYPE; }
db_name         { return NAME; }
db_table_prefix { return TABLE_PREFIX; }
db_port         { return PORT; }

:               { return COLON; }

[0-9]+          { return INTEGER; }

[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }

[ \t\n]+        ;

.               { printf("unexpected character\n"); }

%%

int yywrap(){
    return 1;
}