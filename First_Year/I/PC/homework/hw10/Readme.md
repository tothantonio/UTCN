### 💻 Determinați câte numere strict pozitive există până la N (inclusiv) care sunt divizibile cu a[0] sau a[1] sau … a[k-1], cu alte cuvinte, care sunt divizibile cu orice număr dintr-un șir de k elemente. Va trebui să răspundeți la mai multe astfel de întrebări.

Programul vostru să citească de la intrare numărul T, care reprezintă numărul de teste. Apoi pentru fiecare test să citească N, k și numerele a[0], …, a[k-1]. După calcule să se afișeze răspunsul pentru fiecare test ca un număr pe un singur rând.

Constrângeri: 0 < T <= 100
categoria 1: 0 < N <= 107
categoria 2: 0 < N <= 1018
categoria 3: 0 < N <= 101000000 (10 la puterea un milion)  
0 < k <= 6, 0 < a[i] <= 1000, nu apar duplicate în șirul a

| Date de intrare (tastatură)  | Iesire (ecran) | Explicatii |
| ---------------------------- | -------------- | ---------------------------------------|
| T = 4                        |     
| 7 2 2 3                      | 4              | sunt 4 astfel de numere: 2, 3, 4, 6
| 123 3 4 2 8                  | 61             | se reduce la câte numere pare sunt <= N
| 321 1 567                    | 0              | nu există niciun astfel de număr
| 9988776655 3 6 21 49         | 2038525848     | pentru verificare calcule



