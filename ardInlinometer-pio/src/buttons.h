#include "buttonActions.h" // makes buttons do something

void onPinActivated(int pinNr)
{
  if (debug)
  {
    Serial.println();
    Serial.print("Pin activated: ");
    Serial.println(pinNr);
  }

  switch (pinNr)
  {
  case 2:
    button1Action();
    break;
  case 3:
    button2Action();
    break;
  case 4:
    button3Action();
    break;
  case 5:
    button4Action();
    break;
  case 6:
    button5Action();
    break;
  }
}

void onPinDeactivated(int pinNr)
{
  /*Serial.println();
    Serial.print("Pin deactivated: ");
    Serial.println(pinNr);
  */
}
