### 💻 Fie următoarea definiție de structură:

```c
typedef struct {
    char c1, c2;
    int r1, r2;
} move;
```
### care reprezintă o mișcare (mutare sau captură) de la pătratul (c1, r1) la cel (c2, r2).

Scrieți funcția all_moves cu antetul dat mai jos în sah.c/h. Ea primește tabla și care jucător urmează. Caracterul tomove este w dacă urmează alb, și b dacă urmează negru. Se returnează toate mișcările corecte posibile pentru piesele acelui jucător. În această temă trebuie tratate mișcările doar pentru piesele nebun, turn și regină și puteți ignora starea regelui (vezi regulile jocului). Șirul de structuri se termină cu o structură adițională care are toate câmpurile egale cu 0.

move* all_moves(char table[][8], char tomove)

Exemplu, pentru tabla cu FEN rnbqkbnr/pp1pppp1/8/8/8/7b/PPPPPPPP/RNBQKBNR:

    dacă urmează negru se returnează șirul de structuri care reprezintă mișcările corecte: 
 
    d8-c7, d8-b6, d8-a5, 		//regina neagra 
    h8-h7, h8-h6, h8-h5, h8-h4, 	//turn negru
    h3-g2, h3-g4, h3-f5, h3-e6,	//nebun negru
    00-00
Piesele nu pot să sară peste alte piese sau să captureze o piesă de aceeași culoare.
