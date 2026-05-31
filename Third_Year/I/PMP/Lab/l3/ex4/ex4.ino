#include <LiquidCrystal.h>
LiquidCrystal lcd(7,6,5,4,3,2);
volatile int buttonVariable;
void setup()
{
buttonVariable = 0;
lcd.begin(16,2);
lcd.print("A inceput");
lcd.setCursor(0,1);
lcd.print("din nou");
delay(1000);
// cei doi pini de intrerupere, 21 si 20, declarati ca intrare si rezistente pull up active
pinMode(20 ,INPUT);
pinMode(21 ,INPUT);
digitalWrite(20, HIGH);
digitalWrite(21, HIGH);
// atasam pinilor 21 si 21, corespunzatori INT1 si INT0, funcţii ISR
attachInterrupt(digitalPinToInterrupt(20), functieUnu, RISING);
attachInterrupt(digitalPinToInterrupt(21), functieDoi, CHANGE);
}
void loop()
{
//aici sunt taskuri care se executa in mod normal cand se ruleaza programul
lcd.print("Programul principal");
delay(1000);
}
//prima procedură ISR
void functieDoi()
{
lcd.clear();
lcd.setCursor(0,0);
lcd.print("Functia Doi");
}
//a doua procedură ISR
void functieUnu()
{
lcd.clear();
lcd.setCursor(0,0);
lcd.print("Functia Unu");
}