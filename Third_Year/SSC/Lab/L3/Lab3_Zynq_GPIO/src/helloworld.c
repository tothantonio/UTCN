#include <stdio.h> //Include biblioteca standard pentru input/output
//Include definiții și funcții pentru inițializarea și curățarea
//platformei
#include "platform.h"
//Include funcții pentru gestionarea GPIO-urilor
#include <xgpio.h>
#include <xil_printf.h>
//Include adrese de bază și alte setări pentru periferice
#include "xparameters.h"
//Include funcția usleep pentru a întârzia execuția
#include "sleep.h"
int main()
{
//Declară două structuri XGpio pentru pinii de intrare și ieșire
XGpio input, output;
int button_data = 0;//Variabilă pentru stocarea stării butoanelor
int switch_data = 0; //Variabilă pentru stocarea stării switch-urilor
// Inițializează pinii de intrare (GPIO0) cu adresa de bază
//specificată în xparameters.h
XGpio_Initialize(&input, XPAR_AXI_GPIO_0_BASEADDR);
// Inițializează pinii de ieșire (GPIO1) cu adresa de bază specificată
//în xparameters.h
XGpio_Initialize(&output, XPAR_AXI_GPIO_1_BASEADDR);
// Setează canalul 1 al primului GPIO ca intrare (tristate buffer
//pentru citire)
XGpio_SetDataDirection(&input, 1, 0xF);
// Setează canalul 2 al primului GPIO ca intrare (tristate buffer
//pentru citire)
XGpio_SetDataDirection(&input, 2, 0xF);
// Setează unicul canal al GPIO-ului de ieșire (tristate buffer pentru
//scriere)
XGpio_SetDataDirection(&output, 1, 0x0);
init_platform();//Inițializează platforma hardware
//Afișează un mesaj la începutul execuției
print("Incepem procesarea \r\n");
// Buclează infinit pentru a citi și scrie date in continuu

// while(1){
// // Citește datele de la switch-uri de pe canalul 2 al GPIO-ului de
// //intrare
// switch_data = XGpio_DiscreteRead(&input, 2);
// // Citește datele de la butoane de pe canalul 1 al GPIO-ului de
// //intrare
// button_data = XGpio_DiscreteRead(&input, 1);
// //Scrie datele de la butoane pe canalul 1 al GPIO-ului de ieșire
// //(LED-uri)
// XGpio_DiscreteWrite(&output, 1, button_data);
// //Mai jos sunt condiții pentru a afișa mesajul corespunzător în
// //funcție de switch-ul acționat
// // Dacă niciun switch nu este apăsat, nu face nimic
// if(switch_data == 0b00000){}
// //Dacă switch-ul 0 este apăsat afizeaza mesajul corespunzator
// else if(switch_data == 0b00001)
// print("switchul 0 a fost actionat \r\n");
// //Dacă switch-ul 1 este apăsat afiseaza mesajul
// else if(switch_data == 0b00010)
// print("switchul 1 a fost actionat \r\n");
// //Dacă switch-ul 2 este apăsat afiseaza mesajul si asa mai departe
// else if(switch_data == 0b00100)
// print("switchul 2 a fost actionat \r\n");
// else if(switch_data == 0b01000)
// print("switchul 3 a fost actionat \r\n");
// //Daca sunt mai multe switchuri apasate mentioneaza acest lucru
// else
// print("mai multe switchuri au fost actionate \r\n");
// //Întârzie execuția buclei pentru 200 de milisecunde
// usleep(200000); //delay
// }


// Ex. 2
/*
Modificați aplicația embedded din Vitis astfel încât daca se apăsa pe butonul 1 sa se
aprindă ledurile 0 si 2 si restul ledurilor sa se stingă iar daca se apăsa pe butonul 2 se
aprind ledurile 1 si 3.
*/

// while(1) {
//     button_data = XGpio_DiscreteRead(&input, 1);
//     switch (button_data) {
//         case 0b00001:
//             XGpio_DiscreteWrite(&output, 1, 0b00101);
//             break;
//         case 0b00010:
//             XGpio_DiscreteWrite(&output, 1, 0b01010);
//             break;        
//         default:
//             XGpio_DiscreteWrite(&output, 1, 0b00000);
//             break;
//     }
//     usleep(200000); //delay
// }

// Ex. 3
/*
Modificați aplicația embedded astfel încât daca întrerupătorul 1 are valoarea ‚1’ logic sa
se aprindă pe rând ledurile având o pauza de o secunda intre aprinderea fiecărui led. (Se
aprinde ledul 0 apoi după o secunda se închide si se aprinde ledul 1 care va sta o secunda
aprins si apoi se va închide si el urmând sa se aprindă ledul 2 s.a.)
*/

// while(1) {
//     switch_data = XGpio_DiscreteRead(&input, 2);
//     if (switch_data == 0b00000) {}
//     else if (switch_data == 0b00001) {
//         for(int i = 0; i < 4; i++) {
//             XGpio_DiscreteWrite(&output, 1, 1 << i);
//             usleep(1000);
//             XGpio_DiscreteWrite(&output, 1, 0b00000);            
//         }
//     }
//     usleep(1000);
// }

// Ex. 4
/*
Creați un meniu cu 6 opțiuni si afișați-l la consola. Folosiți butoanele pentru a naviga
printre opțiunile din meniu punând in fata opțiunii curente semnul „>”. Afișați numărul
opțiunii curente(un număr de la 1 la 6) si pe leduri in binar.
*/

int curr_option = 1;
int prev_option = 0;

while (1) {
    button_data = XGpio_DiscreteRead(&input, 1);
    if (button_data == 0b00001) {
        if (curr_option > 1) curr_option --;
    } else if (button_data == 0b00010) {
        if (curr_option < 6) curr_option ++;
    }

    if(curr_option != prev_option) {
        //meniu
        print("===MENIU===\n");
        for(int i = 1; i <= 6; i++) {
            if(i == curr_option) {
                xil_printf("> Optiunea %d\n", i);
            } else xil_printf(" Optiunea %d\n", i);
        }
        XGpio_DiscreteWrite(&output, 1, curr_option);
        prev_option = curr_option;
    }
    usleep(200000);
}

//Curăță resursele platformei hardware înainte de ieșirea din program
cleanup_platform();
//Returnează 0 pentru a indica execuția finalizata cu succes
return 0;
}