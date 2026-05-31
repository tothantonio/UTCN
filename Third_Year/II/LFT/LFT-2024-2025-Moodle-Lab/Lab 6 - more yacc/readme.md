## Debug:
### LEX:
La generarea analizorului lexical din specificatia lex, adaugati -d:

lex -d first.l

### YACC

- Adaugati in specificatia .y : int yydebug=1; in prima sectiune in codul C.   
- La generarea parserului, adaugati
  - -t - la rularea, se vor afisa mesaje de intrare in stari, 
  - -v - se va generae fisierul cu descrierea automatului y.output
  - -g - se va genera fisierul y.dot din care se poate genera vizualizarea automatului folosind _dot -Tpdf file.pdf_ (e necesar sa fie instalat graphviz).


## Observatii generale
  


La aplicare scanner/parser pe test.in, aveti agrija la modul de tratare a caracterului \n:
- se transmite de catre lex say se ignora?
- se foloseste in productii in fisierului .y?
- exista \n la finalul fisierului test.in?
