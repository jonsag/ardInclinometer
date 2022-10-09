/*******************************
  Lock X angle
*******************************/
void button1Action()
{
  if (angleXLocked)
  { // unlock X
    angleXLock = 0;

    angleXLocked = false;

    mess = "X unlocked";

    infoMessln("Angle X unlocked");
    infoMessln();
  }
  else
  {
    angleXLock = angleX;

    angleXLocked = true;

    mess = "X locked";

    infoMessln("Angle X locked");
    infoMess("X: ");
    infoMess(angleXLock);
    infoMessln();
  }

  printAxisLocked("X", angleXLocked);

  messMillis = millis();
}

/*******************************
  Lock Y angle
*******************************/
void button2Action()
{
  if (angleYLocked)
  { // unlock Y
    angleYLock = 0;

    angleYLocked = false;

    mess = "Y unlocked";

    infoMessln("Angle Y unlocked");
    infoMessln();
  }
  else
  {
    angleYLock = angleY;

    angleYLocked = true;

    mess = "Y locked";

    infoMessln("Angle Y locked");
    infoMess("Y: ");
    infoMess(angleYLock);
    infoMessln();
  }

  printAxisLocked("Y", angleYLocked);

  messMillis = millis();
}

/*******************************
  Lock Z angle
*******************************/
void button3Action()
{
  if (angleZLocked)
  { // unlock Z
    angleZLock = 0;

    angleZLocked = false;

    mess = "Z unlocked";

    infoMessln("Angle Z unlocked");
    infoMessln();
  }
  else
  {
    angleZLock = angleZ;

    angleZLocked = true;

    mess = "Z locked";

    infoMessln("Angle Z locked");
    infoMess("Z: ");
    infoMess(angleZLock);
    infoMessln();
  }

  printAxisLocked("Z", angleZLocked);

  messMillis = millis();
}

/*******************************
  Lock all angles
*******************************/
void button4Action()
{
  if (anglesLocked)
  { // unlock all
    angleXLock = 0;
    angleYLock = 0;
    angleZLock = 0;

    angleXLocked = false;
    angleYLocked = false;
    angleZLocked = false;
    anglesLocked = false;

    mess = "All unlocked";

    infoMessln("All angles unlocked");
    infoMessln();
  }
  else
  {
    angleXLock = angleX;
    angleYLock = angleY;
    angleZLock = angleZ;

    angleXLocked = true;
    angleYLocked = true;
    angleZLocked = true;
    anglesLocked = true;

    mess = "All locked";

    infoMessln("Angle X locked");
    infoMess("X: ");
    infoMess(angleXLock);
    infoMess("\tY: ");
    infoMess(angleYLock);
    infoMess("\tZ: ");
    infoMess(angleZLock);
    infoMessln();
  }

  printAxisLocked("X", angleXLocked);
  printAxisLocked("Y", angleYLocked);
  printAxisLocked("Z", angleZLocked);

  messMillis = millis();
}

/*******************************
  NA
*******************************/
void button5Action()
{
}
