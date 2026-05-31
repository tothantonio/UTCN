all:
	yacc -d parser.y
	lex lexer.l
	gcc lex.yy.c y.tab.c -o translator -ll

run:
	./translator < test1.xml

clean:
	rm -f lex.yy.c y.tab.c y.tab.h translator