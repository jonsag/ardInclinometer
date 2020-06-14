void printActualAng(byte posY, double ang, double angLock) {
  /*******************************
    Print the deviation from the locked angles
  *******************************/
  oled.set2X();

  double angDev = ang - angLock;

  String angDevStr = String(angDev);

  int angDevLength = angDevStr.length();
  angDevStr[angDevLength - 1] = '\0';

  oled.setCursor(0, posY);

  if (angDev >= 0) {
    oled.print(" ");
    oled.setCursor(oled.col(), posY);
  }

  oled.print(angDevStr);

  for (byte i = angDevStr.length(); i < 7; i++) {
    oled.setCursor(oled.col(), posY);
    oled.print(" ");
  }

  /*******************************
      Print the real angles
    *******************************/
  oled.set1X();

  String angStr = String(ang);

  int angLength = angStr.length(); // strip the last decimal
  angStr[angLength - 1] = '\0';

  oled.setCursor(80, posY);

  if (ang >= 0) {
    oled.print(" ");
    oled.setCursor(oled.col(), posY);
  }

  oled.print(angStr);

  for (byte i = angStr.length(); i < 7; i++) {
    oled.setCursor(oled.col(), posY);
    oled.print(" ");
  }
  /*
    oled.setCursor(posX + oled.col(), posY);
    oled.print(oled.col());

    oled.setCursor(posX + oled.col(), posY);
    oled.print("*");
  */
  /*
    oled.setCursor(posX + angStr.length() * 10 - 2, posY);
    oled.print(" ");
  */

}

void printXLocked() {
  oled.set2X();

  oled.setCursor(0, 6);

  if (angleXLocked) {
    oled.print("X");
  } else {
    oled.print(" ");
  }
}

void printYLocked() {
  oled.set2X();

  oled.setCursor(30, 6);

  if (angleYLocked) {
    oled.print("Y");
  } else {
    oled.print(" ");
  }
}

void printZLocked() {
  oled.set2X();

  oled.setCursor(60, 6);

  if (angleZLocked) {
    oled.print("Z");
  } else {
    oled.print(" ");
  }
}

void printMisc(byte posX, byte posY, double val) {
  oled.set2X();

  oled.setCursor(posX, posY);
  //oled.print(val);
  oled.print("0123456789012");
}
