### 💻 Studiați notatia Forsyth–Edwards (FEN) folosită pentru reprezentarea unei table de șah.
Deocamdată ne interesează doar partea până la primul spațiu, care descrie efectiv pozițiile pieselor. Completați fișierele sah.h și sah.c și testați în main.

### 💻 1. Implementați funcția encode în sah.c care primește o tablă de șah generală și corectă și un pointer la o zonă alocată și care determină notația FEN pentru tabla dată și o salvează la zona indicată de pointer. Tabla este parametrul de intrare și string-ul este ieșirea.

    void encode(char table[][8], char* fen);

    Exemplu, encode pe tabla inițială produce următorul string:
    rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR


### 💻 2. Implementați funcția decode în sah.c care primește o tablă și un string și care modifică configurația tablei conform notației FEN furnizate. String-ul reprezintă o notație FEN corectă. String-ul este parametrul de intrare și tabla este ieșirea. 

    void decode(char table[][8], char* fen);

    Exemplu, următorul string reprezintă o tablă cu un pion alb în colțul a1 și o regină neagră în colțul opus:
    7q/8/8/8/8/8/8/P7
