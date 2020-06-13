void printActualX() {
  oled.set2X();

  oled.setCursor(0, 0);
  oled.print(angleX);
}

void printActualY() {
  oled.set2X();

  oled.setCursor(0, 2);
  oled.print(angleY);
}

void printActualZ() {
  oled.set2X();

  oled.setCursor(0, 4);
  oled.print(angleZ);
}
