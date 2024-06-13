### 💻 Implementați următoarele funcții într-un singur fișier sursă. Apelați și testați funcțiile în main. Fiecare funcție este responsabilă de tratarea erorilor cum ar fi parametri greșiți sau alocare imposibilă. La finalul programului să dezalocați toate zonele create.

### a) O funcție create care crează și returnează o matrice de n rânduri și m coloane de numere întregi aleatoare din intervalul [L, R] utilizând funcția rand din stdlib. 
Constrângeri: 0 < n, m <= 100, -1000 <= L <= R <= 1000.

### b) O funcție print care primește o matrice și dimensiunile ei și care o afișează.

    Exemplu, print apelat pe rezultatul lui create cu n = 3, m = 4, L = -1, R = 3 poate fi:
    2	-1	2	0
    1	0	3	3
    2	0	3	-1

### c) O funcție select_rows care primește o matrice și dimensiunile ei și care returnează matricea formată doar din rândurile l, l+1, …, r ale matricii originale (l și r sunt parametri de intrare). Restul rândurilor sunt dezalocate.

    Exemplu, select_rows apelat pe rezultatul lui create de mai sus cu l = 1 și r = 2 este:
    1	0	3	3
    2	0	3	-1

### d) O funcție add_cols care primește o matrice, dimensiunile ei, numerele L și R, un parametru k, și care adaugă k coloane de numere aleatoare la matrice (în partea dreaptă) și returnează rezultatul.

    Exemplu, add_cols apelat pe rezultatul de la c) cu k = 2 și aceleași capete L și R poate fi:
    1	0	3	3	2	3
    2	0	3	-1	1	0
