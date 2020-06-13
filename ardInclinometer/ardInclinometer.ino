#include "configuration.h" // sets all variables
#include "LEDs.h" // lights up a LED corresponding to X-angle
#include "printOLED.h" // prints on OLED screen
#include "maths.h" // calculations

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

  oled.setFont(Adafruit5x7);

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

  mpu6050.begin();

  oled.println("Calibrating ...");

  mpu6050.calcGyroOffsets(true); // calculate the gyro offsets, takes a couple of seconds

  if (debug) {
    Serial.println();
  }

  /*******************************
    In- and outputs
  *******************************/
  oled.println("Starting in-, outputs ...");

  pinMode(levelLED_neg1, OUTPUT); // set level LEDs as outputs
  pinMode(levelLED_neg0, OUTPUT);
  pinMode(levelLED_level, OUTPUT);
  pinMode(levelLED_pos0, OUTPUT);
  pinMode(levelLED_pos1, OUTPUT);
  
  oled.clear();
}

void loop() {

  angleX = 0; // reset all accumulated values
  angleY = 0;
  angleZ = 0;

  startMillis = millis();
  for (i = 0; i < values; i++) {
    mpu6050.update(); // read values

    angleX += mpu6050.getAngleX();
    angleY += mpu6050.getAngleY();
    angleZ += mpu6050.getAngleZ();
  }
  endMillis = millis();

  angleX = round1dec(angleX / values); // calculate averages and round
  angleY = round1dec(angleY / values);
  angleZ = round1dec(angleZ / values);

  if (debug) {
    Serial.print("\tAngles, X: ");
    Serial.print(angleX);
    Serial.print("\tY: ");
    Serial.print(angleY);
    Serial.print("\tZ: ");
    Serial.print(angleZ);

    Serial.print("\t");
    Serial.print(values);
    Serial.print(" values in ");
    Serial.print(endMillis - startMillis);
    Serial.println(" ms");
  }

  lightLED(); // light the LED

  if (angleX != oldAngleX) {
    printActualX(); // prints the actual values on screen
    oldAngleX = angleX;
  }
  if (angleY != oldAngleY) {
    printActualY();
    oldAngleY = angleY;
  }
  if (angleZ != oldAngleZ) {
    printActualZ();
    oldAngleZ = angleZ;
  }
}
