#include <LiquidCrystal.h>
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);
// Masca pentru primul caracter, fiecare linie de biţi reprezintă o linie a caracterului
byte happy[8] = {
B00000,
B11011,
B11011,
B00000,
B00000,
B10001,
B01110,
};
// Masca pentru al doilea caracter
byte sad[8] = {
B00000,
B11011,
B11011,
B00000,
B00000,
B01110,
B10001,
};
void setup() {
  lcd.begin(16, 2);
// cele două caractere sunt stocate în CGROM, zona utilizator, poziţiile 0 şi 1
lcd.createChar(0, happy);
lcd.createChar(1, sad);
// Afişare prima linie, un text standard urmat de primul caracter utilizator
lcd.setCursor(0, 0);
lcd.print("Happy ");
lcd.write(byte(0)); // Observaţi diferenta dintre print şi write
/* cand referiti caracterul „0” trebuie sa faceti un cast la byte. Altfel compilatorul va
semnala o eroare. Exceptie este cazul in care referii o variabila:
byte zero = 0;
lcd.write(zero);
*/
// Afisare pe a doua linie
lcd.setCursor(0, 1);
lcd.print("Sad ");
lcd.write(1); // cand referiti caractere diferite de „0” nu mai este necesar cast-ul;
}
// Funcţia loop ramane nefolosita, puteti să o folositi pentru a extinde funcționalitatea
void loop()
{
}