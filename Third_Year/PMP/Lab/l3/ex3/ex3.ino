//includem headerul responsabil pentru operatii cu intreruperi pentru avr
#include "avr/interrupt.h"
//include biblioteca de manipulat LCD
#include <LiquidCrystal.h>
//initializeaza lcd-ul la valorile stabilite ale pinilor
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);
volatile int buttonVariable; //variabila publica ce poate fi modificata de o intrerupere
void setup(void)
{
buttonVariable = 0; //initializam variabila shared intre ISR si programul principal
//seteaza numarul de randuri si coloane ale LCD-ului
lcd.begin(16, 2);
lcd.print("Incepe experimentul");
delay(1000);//facem o scurta pauza pentru a vizualiza mesajul de pe ecran
//setam pinul 21 ca si pin de intrare; pinul pe care se afla intreruperea INT0
pinMode(21 ,INPUT_PULLUP);
//setam pinul 20 ca si pin de intrare; pinul pe care se afla intreruperea INT1
pinMode(20, INPUT);
pinMode(13, OUTPUT); //setam pinul 13 ca si iesire
digitalWrite(13, HIGH); //aprindem led-ul ataşat la pinul 13
delay(1000);
EIMSK |= (1 << INT0); //activam punctual intreruperea INT0
EIMSK |= (1 << INT1); //activam punctual intreruperea INT1
EICRA |= (1 << ISC01); //activam intreruperea 0 pentru front descrescător.
EICRA |= (1 << ISC11); //ca si mai sus, pentru intreruperea 1
sei(); //activam intreruperile la nivel global
digitalWrite(13, LOW); // stingem led-ul ataşat la pinul 13
lcd.clear(); //stergem ecranul LCD
}

void loop()
{
//daca a fost executata o ISR trebuie sa stergem ecranul si sa afisam iar mesajul
// principal
if(buttonVariable == 1)
{
lcd.clear(); //se sterge ecranul LCD
buttonVariable = 0; // variabila este re-initializata
}
delay(1000);
lcd.setCursor(0,0); //setam cursorul
lcd.print("Liniste…"); //afisam un mesaj
}
//Rutina pentru tratarea intreruperii atasata la INT0
ISR(INT0_vect)
{
  digitalWrite(13, !digitalRead(13)); //schimba starea pin 13
lcd.setCursor(0,0); //pozitionam cursorul stanga sus
lcd.print("Intrerupem");//afisam mesaj
lcd.setCursor(0,1);
lcd.print("ptr stirea zilei");
buttonVariable = 1;
}
//Rutina pentru tratarea intreruperii atasata la INT0
ISR(INT1_vect)
{
digitalWrite(13, !digitalRead(13));
lcd.clear();
lcd.setCursor(0,0);
lcd.print("Stirea Doi");
buttonVariable = 1;
}