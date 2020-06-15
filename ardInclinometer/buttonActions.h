/*******************************
  Lock X angle
*******************************/
void button1Action() {
  if (angleXLocked) { // unlock X
    angleXLock = 0;

    angleXLocked = false;

    mess = "X unlocked";

    if (debug) {
      Serial.println("Angle X unlocked");
      Serial.println();
    }
  } else {
    angleXLock = angleX;

    angleXLocked = true;

    mess = "X locked";

    if (debug) {
      Serial.println("Angle X locked");
      Serial.print("X: ");
      Serial.print(angleXLock);
      Serial.println();
    }
  }

  printAxisLocked("X", angleXLocked);
  
  messMillis = millis();
}

/*******************************
  Lock Y angle
*******************************/
void button2Action() {
  if (angleYLocked) { // unlock Y
    angleYLock = 0;

    angleYLocked = false;

    mess = "Y unlocked";

    if (debug) {
      Serial.println("Angle Y unlocked");
      Serial.println();
    }
  } else {
    angleYLock = angleY;

    angleYLocked = true;

    mess = "Y locked";
    if (debug) {
      Serial.println("Angle Y locked");
      Serial.print("Y: ");
      Serial.print(angleYLock);
      Serial.println();
    }
  }

  printAxisLocked("Y", angleYLocked);

  messMillis = millis();
}

/*******************************
  Lock Z angle
*******************************/
void button3Action() {
  if (angleZLocked) { // unlock Z
    angleZLock = 0;

    angleZLocked = false;

    mess = "Z unlocked";

    if (debug) {
      Serial.println("Angle Z unlocked");
      Serial.println();
    }
  } else {
    angleZLock = angleZ;

    angleZLocked = true;

    mess = "Z locked";

    if (debug) {
      Serial.println("Angle Z locked");
      Serial.print("Z: ");
      Serial.print(angleZLock);
      Serial.println();
    }
  }

  printAxisLocked("Z", angleZLocked);

  messMillis = millis();
}

/*******************************
  Lock all angles
*******************************/
void button4Action() {
  if (anglesLocked) { // unlock all
    angleXLock = 0;
    angleYLock = 0;
    angleZLock = 0;

    angleXLocked = false;
    angleYLocked = false;
    angleZLocked = false;
    anglesLocked = false;

    mess = "All unlocked";

    if (debug) {
      Serial.println("All angles unlocked");
      Serial.println();
    }
  } else {
    angleXLock = angleX;
    angleYLock = angleY;
    angleZLock = angleZ;

    angleXLocked = true;
    angleYLocked = true;
    angleZLocked = true;
    anglesLocked = true;

    mess = "All locked";

    if (debug) {
      Serial.println("Angle X locked");
      Serial.print("X: ");
      Serial.print(angleXLock);
      Serial.print("\tY: ");
      Serial.print(angleYLock);
      Serial.print("\tZ: ");
      Serial.print(angleZLock);
      Serial.println();
    }
  }

  printAxisLocked("X", angleXLocked);
  printAxisLocked("Y", angleYLocked);
  printAxisLocked("Z", angleZLocked);

  messMillis = millis();
}

/*******************************
  NA
*******************************/
void button5Action() {

}
