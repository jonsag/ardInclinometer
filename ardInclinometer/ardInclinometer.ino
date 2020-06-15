#include "configuration.h" // sets all variables
#include "maths.h" // calculations
#include "printOLED.h" // prints on OLED screen
#include "buttons.h" // handle button presses
#include "LEDs.h" // lights up a LED corresponding to X-angle


void setup() {
  /*******************************
    Wire
  *******************************/
  Wire.begin();

  /*******************************
    OLED
  *******************************/
  Wire.setClock(400000L);

  oled.begin(&Adafruit128x64, I2C_ADDRESS);

  //oled.setFont(Adafruit5x7);
  oled.setFont(System5x7);

  oled.clear();
  oled.println("ardInclinometer");


  /*******************************
    Start serial
  *******************************/
  if (debug) {
    oled.println("Starting serial ...");

    Serial.begin(serialSpeed);

    /*******************************
      Print start information
    *******************************/
    Serial.println(programName); // print information
    Serial.println(date);
    Serial.print("by ");
    Serial.println(author);
    Serial.println(email);
    Serial.println();
  } else {
    oled.println();
  }

  /*******************************
    MPU
  *******************************/
  oled.println("Starting MPU ...");

  if (debug) {
    Serial.println("=====================================");
    Serial.println("Starting MPU ...");
  }

  mpu6050.begin();

  oled.println("Calibrating ...");

  if (debug) {
    Serial.println("Starting calibration ...");
  }

  mpu6050.calcGyroOffsets(true);

  oled.println("Calibrating ...");

  if (debug) {
    Serial.println();
  }

  /*******************************
    In- and outputs
  *******************************/
  oled.println("Starting in-, outputs ...");

  if (debug) {
    Serial.println("Starting in-, outputs ...");
  }

  pinMode(levelLED_neg1, OUTPUT); // set level LEDs as outputs
  pinMode(levelLED_neg0, OUTPUT);
  pinMode(levelLED_level, OUTPUT);
  pinMode(levelLED_pos0, OUTPUT);
  pinMode(levelLED_pos1, OUTPUT);

  /*******************************
    Setup FTDebouncer pins
  *******************************/
  oled.print("Start debouncer ...");

  if (debug) {
    Serial.println("Starting debouncer ...");
  }

  pinDebouncer.addPin(2, LOW); // pin has external pull-down resistor
  pinDebouncer.addPin(3, LOW);
  pinDebouncer.addPin(4, LOW);
  pinDebouncer.addPin(5, LOW);
  pinDebouncer.addPin(6, LOW);

  pinDebouncer.begin();

  oled.clear();

  if (debug) {
    Serial.println("Started!");
    Serial.println();
  }

  startMillis = millis();
}

void loop() {
  pinDebouncer.update(); // reads and handles all buttons

  if (millis() - startMillis < measureTime) {
    /*******************************
        Measure angles
    *******************************/
    values++;

    mpu6050.update(); // read values

    angleXAcc += mpu6050.getAngleX();
    angleYAcc += mpu6050.getAngleY();
    angleZAcc += mpu6050.getAngleZ();
  } else {
    /*******************************
      Calculate angles
    *******************************/
    angleX = round1dec(angleXAcc / values); // calculate averages and round
    angleY = round1dec(angleYAcc / values);
    angleZ = round1dec(angleZAcc / values);

    lightLED(angleX, angleXLock); // light the LED

    if (angleX != oldAngleX) {
      printActualAng(0, angleX, angleXLock); // prints the actual values on screen
      oldAngleX = angleX;
    }
    if (angleY != oldAngleY) {
      printActualAng(2, angleY, angleYLock);
      oldAngleY = angleY;
    }
    if (angleZ != oldAngleZ) {
      printActualAng(4, angleZ, angleZLock);
      oldAngleZ = angleZ;
    }

    angleXAcc = 0; // reset all accumulated values
    angleYAcc = 0;
    angleZAcc = 0;

    values = 0;

    startMillis = millis();
  }

  if (false) {
    Serial.print("\tAngles, X: ");
    Serial.print(angleX);
    Serial.print("\tY: ");
    Serial.print(angleY);
    Serial.print("\tZ: ");
    Serial.print(angleZ);

    Serial.print("\t");
    Serial.print(values);
    Serial.print(" values");
    Serial.println();
  }

  /*******************************
    Messages
  *******************************/
  if (millis() - messMillis >= messTime) {
    mess = "";
  }

  if (mess != oldMess) {
    printMess(mess);
    oldMess = mess;
  }
}
