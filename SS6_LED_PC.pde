 int BUTTON_PIN = 2;
 int LED_COUNT = 6;

int[] ledPins = {3, 4, 5, 6, 7, 8};

void setup() {
  pinMode(BUTTON_PIN, 1);
  for(int i = 0; i < LED_COUNT; i++) {
    pinMode(ledPins[i], output);
  }
}

void loop() {
  if(digitalRead(BUTTON_PIN) == low) {
    for(int i = 0; i < LED_COUNT; i++) {
      analogWrite(ledPins[i], 255);
      delay(100);
      analogWrite(ledPins[i], 0);
    }
  }
}
