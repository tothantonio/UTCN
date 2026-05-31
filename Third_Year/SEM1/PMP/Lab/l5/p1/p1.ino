#include <LiquidCrystal.h>
// Includem biblioteca necesara pentru I2C
#include <Wire.h>

int x = 0;
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);

void setup(){
// Pornim busul I2C ca si slave la adresa 9
Wire.begin(9);
// Atasam o functie care sa se declanseze atunci cand primim ceva
Wire.onReceive(receiveEvent);
lcd.begin(16,2);
lcd.print("Slave");
}
void receiveEvent(int bytes) {
x = Wire.read(); // citim un character din I2C
}

void loop() {
lcd.setCursor(0,1); // afisare caracter receptionat
lcd.print(x);
}
