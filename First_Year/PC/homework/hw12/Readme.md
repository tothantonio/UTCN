

## 💻 Se trimite doar un singur fișier `Nume_Prenume_s12_sah.c` care trebuie să conțină funcția `void run_tests()` care face toate operațiile de mai jos (citire, procesare și afișare). În fișierul sursă puteți avea oricâte alte funcții dar să NU apară funcția `main()`.

Fie structurile `move` și `config`, să le folosiți exact așa:

```c
typedef struct {
    char c1, c2;
    int r1, r2;
} move;

typedef struct {
    char table[8][8];
    move mv;
} config;
```
### 💻 Citiți lista de configurații din fișierul binar chess_in.bin. Acesta conține un număr întreg n, de tip int (4 bytes), care indică numărul de configurații stocate, apoi n structuri de tip config. Implementați o funcție care determină dacă mișcarea descrisă de câmpul mv din configurația dată este validă sau nu pentru tabla din structură. Se scrie răspunsul 1 sau 0 pentru fiecare caz, pe câte un rând, în fișierul text chess_out.txt.

    Exemplu:
    Prima tablă arată în următorul mod (spațiile au fost schimbate cu _ doar pentru vizualizare):

    8 ________
    7 ________
    6 ___R___p
    5 ___r____
    4 ________
    3 ________
    2 ________
    1 ________
     abcdefgh
Mișcarea cerută este d6 d7, care este corectă.
