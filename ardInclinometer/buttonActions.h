/*******************************
  Lock X angle
*******************************/
void button1Action() {
  if (angleXLocked) { // unlock X
    angleXLock = 0;

    angleXLocked = false;

    printXLocked();

    if (debug) {
      Serial.println("Angle X unlocked");
      Serial.println();
    }
  } else {
    angleXLock = angleX;

    angleXLocked = true;

    printXLocked();

    if (debug) {
      Serial.println("Angle X locked");
      Serial.print("X: ");
      Serial.print(angleXLock);
      Serial.println();
    }
  }
}

/*******************************
  Lock Y angle
*******************************/
void button2Action() {
  if (angleYLocked) { // unlock Y
    angleYLock = 0;

    angleYLocked = false;

    printYLocked();

    if (debug) {
      Serial.println("Angle Y unlocked");
      Serial.println();
    }
  } else {
    angleYLock = angleY;

    angleYLocked = true;

    printYLocked();

    if (debug) {
      Serial.println("Angle Y locked");
      Serial.print("Y: ");
      Serial.print(angleYLock);
      Serial.println();
    }
  }
}

/*******************************
  Lock Z angle
*******************************/
void button3Action() {
  if (angleZLocked) { // unlock Z
    angleZLock = 0;

    angleZLocked = false;

    printZLocked();

    if (debug) {
      Serial.println("Angle Z unlocked");
      Serial.println();
    }
  } else {
    angleZLock = angleZ;

    angleZLocked = true;

    printZLocked();

    if (debug) {
      Serial.println("Angle Z locked");
      Serial.print("Z: ");
      Serial.print(angleZLock);
      Serial.println();
    }
  }
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

    printXLocked();
    printYLocked();
    printZLocked();

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

    printXLocked();
    printYLocked();
    printZLocked();

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
}

/*******************************
  NA
*******************************/
void button5Action() {

}
