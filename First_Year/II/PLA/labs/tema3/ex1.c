/* Sa se scrie o functie care inlocuieste caracterele speciale dintr-un sir s de caractere
 cu caracterul ’-’. Se va folosi conventia cdecl. Se va apela functia in
 programul principal, intr-o bucla, pe textul citit dintr-un fisier linie cu linie.
 Rezultatul se va afisa pe ecran. Prin caracter special intelegem orice caracter
 care nu e cifra, litera mare, litera mica sau spatiu.*/

 #include <stdlib.h>
 #include <stdio.h>

 int main(){
    
        FILE *f;
        f = fopen("text.txt", "r");
        if(f == NULL){
            printf("Eroare la deschiderea fisierului");
            exit(1);
        }
        char c;
        while((c = fgetc(f)) != EOF){
            if(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' || c == ' '){
                printf("%c", c);
            }
            else{
                printf("-");
            }
        }
        fclose(f);
    return 0;
 }