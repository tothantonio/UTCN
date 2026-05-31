//include biblioteca pentru lucrul cu LCD
#include <LiquidCrystal.h>
/* LCD RS pinul digital 7
* LCD Enable pinul 6
* LCD D4 pinul 5
* LCD D5 pinul 4
* LCD D6 pinul 3
* LCD D7 pinul 2
Al șaptelea pin este pinul de la potentiometrul de reglare a iluminarii */
//inițializează lcd-ul la valorile stabilite ale pinilor
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);
unsigned long time;
void setup()
{
//seteaza numarul de randuri si coloane ale LCD-ului
lcd.begin(16, 2);
}
void loop()
{
//luam numarul de secunde trecute de la reset (sau pornirea programului)
time = millis() / 1000;
//setam cursorul la coloana 0 randul 1
lcd.setCursor(0, 0);
//scriem un text
lcd.print("Hello Children");
//setam cursorul la mijlocul liniei a doua
lcd.setCursor(7, 1);
//scriem timpul
lcd.print(time);
}