int latchPin = 4;
int clockPin = 7;
int dataPin = 8; // Pinii SSD

int buttonUp = A1;
int buttonDown = A2;

const unsigned char ssdlut[] = {
    0b00111111,  // 0: segments A,B,C,D,E,F
    0b00000110,  // 1: segments B,C
    0b01011011,  // 2: segments A,B,D,E,G
    0b01001111,  // 3: segments A,B,C,D,G
    0b01100110,  // 4: segments B,C,F,G
    0b01101101,  // 5: segments A,C,D,F,G
    0b01111101,  // 6: segments A,C,D,E,F,G
    0b00000111,  // 7: segments A,B,C
    0b01111111,  // 8: segments A,B,C,D,E,F,G
    0b01101111   // 9: segments A,B,C,D,F,G
};

const unsigned char anodelut[] = {
  0b00000001, // mii
  0b00000010, // sute
  0b00000100, // zeci
  0b00001000 // unitati
};

// const unsigned char digits[] = {1,2,3,4}; // Numărul afişat va fi 1234. ModificaŃi aici pt alt număr

int number = 100;
void setup ()
{
  pinMode(latchPin,OUTPUT);
  pinMode(clockPin,OUTPUT);
  pinMode(dataPin,OUTPUT); // Cei trei pini pentru registrii de deplasare, configuraŃi ca iesire
  pinMode(buttonUp, INPUT);
  pinMode(buttonDown, INPUT);
}
// 5.
void displayNumber(int num) {
  int mii = (num / 1000) % 10;
  int sute = (num / 100) % 10;
  int zeci = (num / 10) % 10;
  int unit = num % 10;

  int digits[4] = {mii, sute, zeci, unit};
  for(char i=0; i<=3; i++) // pentru fiecare din cele 4 cifre
  {
    unsigned char digit = digits[i]; // cifra curentă
    unsigned char cathodes = ~ssdlut[digit]; // catozii cifrei curente, vom nega valoarea din LUT
    digitalWrite(latchPin,LOW); // vom activa semnalul latch pentru a permite scrierea
    shiftOut(dataPin,clockPin,MSBFIRST, cathodes); // serializam octetul anozilor
    shiftOut(dataPin,clockPin,MSBFIRST, anodelut [i] ); // serializam octetul anozilor
    digitalWrite(latchPin,HIGH); // dezactivam semnalul latch
    delay(2); // asteptare
  }
}

void loop()
{
  // int num = 1000;
  // displayNumber(num);
  // for(int i = num; i <= 9999; i++) {
  //       displayNumber(i);
  // }

  // for(char i=0; i<=3; i++) // pentru fiecare din cele 4 cifre
  // {
  //   unsigned char digit = digits[i]; // cifra curentă
  //   unsigned char cathodes = ~ssdlut[digit]; // catozii cifrei curente, vom nega valoarea din LUT
  //   digitalWrite(latchPin,LOW); // vom activa semnalul latch pentru a permite scrierea
  //   shiftOut(dataPin,clockPin,MSBFIRST, cathodes); // serializam octetul anozilor
  //   shiftOut(dataPin,clockPin,MSBFIRST, anodelut [i] ); // serializam octetul anozilor
  //   digitalWrite(latchPin,HIGH); // dezactivam semnalul latch
  //   delay(2); // asteptare
  // }

  // 6.
  if(digitalRead(buttonUp) == LOW) {
    number++;
    if(number > 9999) number = 0;
    delay(200);
  }

  if(digitalRead(buttonDown) == LOW) {
    number--;
    if(number < 0) number = 9999;
    delay(200);
  }

  for(int i = 0; i < 100; i++) {
    displayNumber(number);
  }
}

  