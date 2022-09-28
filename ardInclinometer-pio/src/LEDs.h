void lightLED(double ang, double angLock)
{
  if (ang - angLock < -2.01)
  {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, HIGH);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);
  }
  else if ((ang - angLock > -2.00) && (ang - angLock < -1.01))
  {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, HIGH);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);
  }
  else if ((ang - angLock < 1.00) && (ang - angLock > -1.00))
  {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, HIGH);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);
  }
  else if ((ang - angLock > 1.01) && (ang - angLock < 2.00))
  {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, HIGH);
    digitalWrite(levelLED_pos1, LOW);
  }
  else if (ang - angLock > 2.01)
  {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, HIGH);
  }
}
