%option noyywrap
%{
int findword(char*);
%}
%%
"<"[a-z A-Z]+">"["-" "+" "#" " " "(" ")" ":" 0-9 a-z A-Z]+"<""/"[a-z A-Z]+">" {yylval = findword(yytext);
		return Word;
	}
.     printf("Input Eronat");
%%

