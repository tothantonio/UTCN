#include <LiquidCrystal.h>
#include "avr/interrupt.h"

LiquidCrystal lcd(7, 6, 5, 4, 3, 2);

volatile boolean running = false;
volatile boolean reset_flag = false;
unsigned long startTime = 0;
unsigned long pausedTime = 0;

int clockFrame = 0;
unsigned long lastFrameTime = 0;

byte clockFrames[3][8] = {
  { B11111,
    B01110,
    B00100,
    B00000,
    B00000,
    B00100,
    B01110,
    B11111 },

  { B11111,
    B01110,
    B00000,
    B00100,
    B00100,
    B00100,
    B01110,
    B11111 },

  { B11111,
    B01110,
    B00000,
    B00100,
    B00100,
    B00000,
    B01110,
    B11111 }
};

void setup() {
  lcd.begin(16, 2);

  pinMode(20, INPUT_PULLUP);
  pinMode(21, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(20), toggleStopwatch, FALLING);
  attachInterrupt(digitalPinToInterrupt(21), resetStopwatch, FALLING);

  for (int i = 0; i < 3; i++) {
    lcd.createChar(i, clockFrames[i]);
  }

  lcd.print("Stopwatch Ready");
  delay(1000);
  lcd.clear();
}

void loop() {
  if (reset_flag) {
    running = false;
    startTime = 0;
    pausedTime = 0;
    reset_flag = false;
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Reset: 00:00:000");
    delay(500);
  }

  unsigned long elapsedMillis;
  if (running) {
    elapsedMillis = (millis() - startTime + pausedTime);
  } else {
    elapsedMillis = pausedTime;
  }

  int minutes = (elapsedMillis / 60000);
  int seconds = (elapsedMillis % 60000) / 1000;
  int milliseconds = elapsedMillis % 1000;

  lcd.setCursor(0, 0);
  lcd.print("Time: ");
  printTime(minutes, seconds, milliseconds);

  lcd.setCursor(0, 1);
  lcd.print("Status: ");
  lcd.print(running ? "RUN " : "STOP");

  if (running) {
    if (millis() - lastFrameTime >= 200) {
      lastFrameTime = millis();
      clockFrame = (clockFrame + 1) % 3;
      lcd.setCursor(14, 1);
      lcd.write(byte(clockFrame));
    }
  } else {
    lcd.setCursor(14, 1);
    lcd.write(byte(0));
  }

  delay(50);
}

void toggleStopwatch() {
  delay(20);
  running = !running;

  if (running) {
    startTime = millis();
  } else {
    pausedTime += (millis() - startTime);
  }
}

void resetStopwatch() {
  delay(20);
  reset_flag = true;
}

void printTime(int m, int s, int ms) {
  if (m < 10) lcd.print("0");
  lcd.print(m);
  lcd.print(":");

  if (s < 10) lcd.print("0");
  lcd.print(s);
  lcd.print(":");

  if (ms < 100) lcd.print("0");
  if (ms < 10) lcd.print("0");
  lcd.print(ms);
}
