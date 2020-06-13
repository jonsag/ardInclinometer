void lightLED() {
    if (angleX < -2.01) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, HIGH);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);

  } else if ((angleX > -2.00) && (angleX < -1.01)) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, HIGH);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);

  } else if ((angleX < 1.00) && (angleX > -1.00)) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, HIGH);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);

  } else if ((angleX > 1.01) && (angleX < 2.00)) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, HIGH);
    digitalWrite(levelLED_pos1, LOW);

  } else if (angleX > 2.01) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, HIGH);
  }
}
