
#include <Arduino.h>

#include "configuration.h" // sets all variables
#include "maths.h"         // calculations
#include "printOLED.h"     // prints on OLED screen
#include "buttons.h"       // handle button presses
#include "LEDs.h"          // lights up a LED corresponding to X-angle

void setup()
{
  /*******************************
    Wire
  *******************************/
  Wire.begin();

  /*******************************
    OLED
  *******************************/
  Wire.setClock(400000L);

  oled.begin(&Adafruit128x64, I2C_ADDRESS);

  // oled.setFont(Adafruit5x7);
  oled.setFont(System5x7);

  oled.clear();
  oled.println("ardInclinometer");

  /*******************************
    Start serial
  *******************************/
  if (DEBUG || INFO)
  {
    oled.println("Starting serial ...");

    Serial.begin(serialSpeed);
  }
  else
  {
    oled.println();
  }

  /*******************************
    Print start information
  *******************************/
  infoMessln(programName); // print information
  infoMessln(date);
  infoMess("by ");
  infoMessln(author);
  infoMessln(email);
  infoMessln();

  /*******************************
    MPU
  *******************************/
  oled.println("Starting MPU ...");

  infoMessln("=====================================");
  infoMessln("Starting MPU ...");

  mpu6050.begin();

  oled.println("Calibrating ...");

  infoMessln("Starting calibration ...");

  mpu6050.calcGyroOffsets(true);

  oled.println("Calibrating ...");

  infoMessln();

  /*******************************
    In- and outputs
  *******************************/
  oled.println("Starting in-, outputs ...");

  infoMessln("Starting in-, outputs ...");

  pinMode(levelLED_neg1, OUTPUT); // set level LEDs as outputs
  pinMode(levelLED_neg0, OUTPUT);
  pinMode(levelLED_level, OUTPUT);
  pinMode(levelLED_pos0, OUTPUT);
  pinMode(levelLED_pos1, OUTPUT);

  /*******************************
    Setup FTDebouncer pins
  *******************************/
  oled.print("Start debouncer ...");

  infoMessln("Starting debouncer ...");

  pinDebouncer.addPin(lockXButton, LOW, onPinActivated, onPinDeactivated); // pin has external pull-down resistor
  pinDebouncer.addPin(lockYButton, LOW, onPinActivated, onPinDeactivated);
  pinDebouncer.addPin(lockZButton, LOW, onPinActivated, onPinDeactivated);
  pinDebouncer.addPin(lockAllButton, LOW, onPinActivated, onPinDeactivated);
  pinDebouncer.addPin(button5, LOW, onPinActivated, onPinDeactivated);

  pinDebouncer.begin();

  oled.clear();

  infoMessln("Started!");
  infoMessln();

  startMillis = millis();
}

void loop()
{
  pinDebouncer.update(); // reads and handles all buttons

  if (millis() - startMillis < measureTime)
  {
    /*******************************
        Measure angles
    *******************************/
    values++;

    mpu6050.update(); // read values

    angleXAcc += mpu6050.getAngleX();
    angleYAcc += mpu6050.getAngleY();
    angleZAcc += mpu6050.getAngleZ();
  }
  else
  {
    /*******************************
      Calculate angles
    *******************************/
    angleX = round1dec(angleXAcc / values); // calculate averages and round
    angleY = round1dec(angleYAcc / values);
    angleZ = round1dec(angleZAcc / values);

    lightLED(angleX, angleXLock); // light the LED

    if (angleX != oldAngleX)
    {
      printActualAng(0, angleX, angleXLock); // prints the actual values on screen
      oldAngleX = angleX;
    }
    if (angleY != oldAngleY)
    {
      printActualAng(2, angleY, angleYLock);
      oldAngleY = angleY;
    }
    if (angleZ != oldAngleZ)
    {
      printActualAng(4, angleZ, angleZLock);
      oldAngleZ = angleZ;
    }

    angleXAcc = 0; // reset all accumulated values
    angleYAcc = 0;
    angleZAcc = 0;

    values = 0;

    startMillis = millis();
  }

  debugMess("\tAngles, X: ");
  debugMess(angleX);
  debugMess("\tY: ");
  debugMess(angleY);
  debugMess("\tZ: ");
  debugMess(angleZ);

  debugMess("\t");
  debugMess(values);
  debugMess(" values");
  debugMess();

  /*******************************
    Messages
  *******************************/
  if (millis() - messMillis >= messTime)
  {
    mess = "";
  }

  if (mess != oldMess)
  {
    printMess(mess);
    oldMess = mess;
  }
}
