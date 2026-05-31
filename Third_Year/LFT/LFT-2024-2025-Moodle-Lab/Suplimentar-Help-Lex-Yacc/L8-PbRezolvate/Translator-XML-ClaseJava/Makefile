translatat-clase.java: a.out ex.xml 
	./a.out <ex.xml >translatat-clase.java
a.out:  y.tab.c
	gcc y.tab.c
y.tab.c: umltocs.y lex.yy.c
	yacc umltocs.y 
lex.yy.c: umltocs.l 
	lex umltocs.l


