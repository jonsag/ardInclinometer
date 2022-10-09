String programName = "ardInclinometer";
String date = "20221009";
String author = "Jon Sagebrand";
String email = "jonsagebrand@gmail.com";

/*******************************
  Serial
*******************************/
#define serialSpeed 9600

/*******************************
  Debugging
*******************************/
#define DEBUG 0 // debugMess is off when 0
#define INFO 1

#if DEBUG
#define debugMess(x) Serial.print(x)
#define debugMessln(x) Serial.println(x)
#else
#define debugMess(x)
#define debugMessln(x)
#endif

#if INFO || DEBUG
#define infoMess(x) Serial.print(x)
#define infoMessln(x) Serial.println(x)
#else
#define infoMess(x)
#define infoMessln(x)
#endif

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

double angleXAcc = 0; // holds the accumulated readings
double angleYAcc = 0;
double angleZAcc = 0;

double angleX = 0; // holds the averaged angles
double angleY = 0;
double angleZ = 0;

double oldAngleX = 0; // holds the old values
double oldAngleY = 0;
double oldAngleZ = 0;

double angleXLock = 0; // stores the locked angles
double angleYLock = 0;
double angleZLock = 0;

boolean angleXLocked = false;
boolean angleYLocked = false;
boolean angleZLocked = false;
boolean anglesLocked = false;

double measureTime = 282; // for how long should values be read before averaged, ms
int values = 0;           // counting values read

/*******************************
  OLED
*******************************/
// OLED screens I2C address: 0x3c

#include "SSD1306Ascii.h"
#include "SSD1306AsciiWire.h"

#define I2C_ADDRESS 0x3C

SSD1306AsciiWire oled; // start oled instance

/*******************************
  FTDebouncer setup
*******************************/
const byte debounceTime = 15;

#if !defined(nullptr)
#define nullptr NULL
#endif

#include "FTDebouncer.h" // load library for debouncing buttons
FTDebouncer pinDebouncer(debounceTime);

/*******************************
  In- and outputs
*******************************/
#define lockXButton 2
#define lockYButton 3
#define lockZButton 4
#define lockAllButton 5
#define button5 6

#define levelLED_neg1 9 // Level LEDs
#define levelLED_neg0 10
#define levelLED_level 11 // at zero
#define levelLED_pos0 12
#define levelLED_pos1 13

/*******************************
  Misc
*******************************/
double startMillis;

String mess = ""; // holds the message
String oldMess = "";

double messMillis;
#define messTime 2000 // how long to show a message, ms
