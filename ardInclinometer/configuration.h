String programName = "ardInclinometer";
String date = "20200613";
String author = "Jon Sagebrand";
String email = "jonsagebrand@gmail.com";

/*******************************
  Serial
*******************************/
const int serialSpeed = 9600;

/*******************************
  Debugging
*******************************/
const boolean debug = false;

/*******************************
  Mire
*******************************/
#include <Wire.h> // load the wire library

/*******************************
  MPU-6050
*******************************/
// MPU6050 I2C address: 0x68

#include <MPU6050_tockn.h>

MPU6050 mpu6050(Wire); // start mpu instance

double angleX; // holds the accumulated readings
double angleY;
double angleZ;

double oldAngleX; // holds the old values
double oldAngleY;
double oldAngleZ;

const int values = 200; // how many values should be rerad and averaged

/*******************************
  OLED
*******************************/
// OLED screens I2C address: 0x3c

#include "SSD1306Ascii.h"
#include "SSD1306AsciiWire.h"

#define I2C_ADDRESS 0x3C

SSD1306AsciiWire oled; // start oled instance

/*******************************
  In- and outputs
*******************************/
int levelLED_neg1 = 9; // Level LEDs
int levelLED_neg0 = 10;
int levelLED_level = 11; // at zero
int levelLED_pos0 = 12;
int levelLED_pos1 = 13;

/*******************************
  Misc
*******************************/
byte i;

double startMillis;
double endMillis;
