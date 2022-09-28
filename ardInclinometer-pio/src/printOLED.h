void printActualAng(byte posY, double ang, double angLock)
{
  /*******************************
    Print the deviation from the locked angles
  *******************************/
  oled.set2X();

  double angDev = ang - angLock;

  String angDevStr = String(angDev);

  int angDevLength = angDevStr.length();
  angDevStr[angDevLength - 1] = '\0';

  oled.setCursor(0, posY); // print the deviation at the start of the line

  if (angDev >= 0)
  {
    oled.print(" ");
    oled.setCursor(oled.col(), posY);
  }

  oled.print(angDevStr);

  for (byte i = angDevStr.length(); i < 7; i++)
  {
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

  oled.setCursor(75, posY + 1); // print the real angle after the deviation

  if (ang >= 0)
  {
    oled.print(" ");
    oled.setCursor(oled.col(), posY + 1);
  }

  oled.print(angStr);

  for (byte i = angStr.length(); i < 7; i++)
  {
    oled.setCursor(oled.col(), posY + 1);
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

void printAxisLocked(String axis, boolean lock)
{
  oled.set2X();

  if (axis == "X")
  {
    oled.setCursor(116, 0);
  }
  else if (axis == "Y")
  {
    oled.setCursor(116, 2);
  }
  else if (axis == "Z")
  {
    oled.setCursor(116, 4);
  }

  if (lock)
  {
    oled.print(axis);
  }
  else
  {
    oled.print(" ");
  }
}

void printMess(String message)
{
  oled.set2X();

  oled.setCursor(0, 6);

  if (message == "")
  {
    oled.clearToEOL();
  }
  else
  {
    oled.print(message);
  }
}
