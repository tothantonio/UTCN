/* Cautare binara: se da un sir ordonat, de numere si lungimea acestuia.
 Sa se scrie o functie bsearch(sir, lungime, x) care veri ca daca parametrul
 x primit apare in sir. Pentru punctaj complet, cautarea se va face n mod binar:
 la ecare pas comparam cu x elementul de la jumatatea sirului curent, iar daca nu
 l-am gasit cautam n subsirul drept sau stang, n functie de rezultatul comparatiei.
 Vreau functie recursiva.
*/

#include <stdio.h>
int bsearch(int sir[], int lungime, int x) {
    
    int mijloc = lungime / 2;
    
    if (sir[mijloc] == x) {
        return 1; // element found
    } 
    else if (sir[mijloc] > x) {
        return bsearch(sir, mijloc, x); // search in the left subarray
    } 
    else {
        return bsearch(sir + mijloc + 1, lungime - mijloc - 1, x); // search in the right subarray
    }
}

int main() {
    int sir[] = {1, 2, 3, 4, 5};
    int lungime = sizeof(sir) / sizeof(sir[0]);
    int x = 4;
    
    if (bsearch(sir, lungime, x)) {
        printf("Element found\n");
    } else {
        printf("Element not found\n");
    }
    
    return 0;
}