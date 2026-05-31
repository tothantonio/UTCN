#include <LiquidCrystal.h>

LiquidCrystal lcd(7, 6, 5, 4, 3, 2);

byte hourglassUp[8] = {
  B11111,
  B10001,
  B01010,
  B00100,
  B00100,
  B01010,
  B10001,
  B11111
};

byte hourglassDown[8] = {
  B11111,
  B10001,
  B01010,
  B00100,
  B00100,
  B01010,
  B10001,
  B11111
};

void setup() {
  lcd.begin(16, 2);
  
  lcd.createChar(0, hourglassUp);
  lcd.createChar(1, hourglassDown);
  
  lcd.print("  Hourglass  ");
  delay(1000);
  lcd.clear();
}

void loop() {
  static int frame = 0;
  
  lcd.setCursor(7, 0);
  lcd.write(byte(frame % 8));  
  
  unsigned long seconds = millis() / 1000;
  int mins = seconds / 60;
  int secs = seconds % 60;
  
  lcd.setCursor(0, 1);
  lcd.print("Time: ");
  if (mins < 10) lcd.print("0");
  lcd.print(mins);
  lcd.print(":");
  if (secs < 10) lcd.print("0");
  lcd.print(secs);
  
  frame++;
  delay(300); 
}

