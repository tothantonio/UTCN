int latchPin = 4;
int clockPin = 7;
int dataPin  = 8;

int btnStart = 2;
int btnStop  = 3;
int btnReset = 5;

bool running = false;
unsigned long lastTime = 0;
int centisec = 0; // sutimi de secunda (0-99)
int secunde = 0;  // secunde (0-99)

const unsigned char ssdlut[] = {
  0b00111111,0b00000110,0b01011011,0b01001111,
  0b01100110,0b01101101,0b01111101,0b00000111,
  0b01111111,0b01101111
};

const unsigned char anodelut[] = {
  0b00001000,0b00000100,0b00000010,0b00000001
};

void setup() {
  pinMode(latchPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin,  OUTPUT);

  pinMode(btnStart, INPUT_PULLUP);
  pinMode(btnStop,  INPUT_PULLUP);
  pinMode(btnReset, INPUT_PULLUP);
}

void displayNumber(int s, int c) {
  int d1 = (s / 10) % 10;
  int d2 = s % 10;
  int d3 = (c / 10) % 10;
  int d4 = c % 10;
  int digits[4] = {d1, d2, d3, d4};

  for (int i = 0; i < 4; i++) {
    unsigned char cathodes = ~ssdlut[digits[i]];
    digitalWrite(latchPin, LOW);
    shiftOut(dataPin, clockPin, MSBFIRST, cathodes);
    shiftOut(dataPin, clockPin, MSBFIRST, anodelut[i]);
    digitalWrite(latchPin, HIGH);
    delay(2);
  }
}

void loop() {
  // butoane
  if (digitalRead(btnStart) == LOW) { running = true; delay(200); }
  if (digitalRead(btnStop)  == LOW) { running = false; delay(200); }
  if (digitalRead(btnReset) == LOW) { running = false; secunde = 0; centisec = 0; delay(200); }

  if (running && millis() - lastTime >= 10) { // 10 ms = o sutime
    lastTime = millis();
    centisec++;
    if (centisec >= 100) {
      centisec = 0;
      secunde++;
      if (secunde >= 100) secunde = 0;
    }
  }

  for (int i = 0; i < 50; i++) {
    displayNumber(secunde, centisec);
  }
}
