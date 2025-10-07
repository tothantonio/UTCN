// Afisare pe SSD
// conectat la PORTA
// Tabelă de valori (LUT) cu codurile pentru fiecare cifră de la 0 la 9. Fiecare bit corespunde unui LED
// 1 înseamnă LED aprins, 0 înseamnă LED stins.
const unsigned char ssdlut[] = {
   0b00111111, // 0
   0b00000110, // 1
   0b01011011, // 2
   0b01001111, // 3
   0b01100110, // 4
   0b01101101, // 5
   0b01111101, // 6
   0b00000111, // 7
   0b01111111, // 8
   0b01101111  // 9
   // extindere cu literele A, B, C, D, E, F
  //  0b01110111, // A
  //  0b01111100, // b
  //  0b00111001, // C
  //  0b01011110, // d
  //  0b01111001, // E
  //  0b01110001  // F
};

// dimensiunea LUT-ului
const int lutsize = 10; // cu 16 pt extindere

int cpos = 0; // pozitia curenta
int cdigit = 0; // prima cifra din cele doua
unsigned char outvalue = 0;

// int numar = 0;

void setup() {
  // activare PORTA ca iesire
  DDRA = 0b11111111;
}
void loop() {
  outvalue = cdigit>0 ? 0x80 : 0; // care catod il aprindem ? (00000000 sau 10000000)

  // catodul este legat la bitul 7 din portul A, prin această operatie punem
  // bitul 7 pe 1 sau pe 0, alternativ, urmand ca ceilalti biti sa fie atasati
  // prin OR logic, in linia de cod urmatoare
  PORTA = (ssdlut[cpos] | outvalue); // facem OR intre valoarea din LUT si catodul selectat
  cpos++; // incrementam pozitia curenta
  if (cpos>=lutsize) { // daca am ajuns la capat
    cpos = 0; // revenim la zero
    cdigit^=1; // daca cifra anterioara a fost 0, acum e 1, daca a fost 1, acum e zero (^ = XOR)
  }
  // asteptare 0.5 sec
  delay(500);

  // afisarea numerelor de la 0 la 99 in format zecimal
  // for(numar = 0; numar < 100; numar++) {
  //   int CZ = numar / 10;
  //   int CU = numar % 10;

  //   for(int i = 0; i < 50; i++) {
  //     PORTA = ssdlut[CU];
  //     delay(5);
  //     PORTA = ssdlut[CZ] | 0x80;
  //     delay(5);
  //   }
  // }
}