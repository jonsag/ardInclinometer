#include <MPU6050_tockn.h>
#include <Wire.h>

MPU6050 mpu6050(Wire);

// Level LEDs
int levelLED_neg1 = 9;
int levelLED_neg0 = 10;
int levelLED_level = 11;
int levelLED_pos0 = 12;
int levelLED_pos1 = 13;

// MPU
const boolean tempEn = false;
double tempAcc;

const boolean angleEn = true;
double angleXacc;
double angleYacc;
double angleZacc;

const boolean accEn = false;
double accXacc;
double accYacc;
double accZacc;

const boolean gyroEn = false;
double gyroXacc;
double gyroYacc;
double gyroZacc;

const boolean accAngleEn = false;
double accAngleXacc;
double accAngleYacc;
double accAngleZacc;

// Misc
byte i;

const int values = 100;

double startMillis;
double endMillis;

void setup() {
  Serial.begin(9600);
  Wire.begin();
  mpu6050.begin();
  mpu6050.calcGyroOffsets(true);

  // Set Level LEDs as outputs
  pinMode(levelLED_neg1, OUTPUT);
  pinMode(levelLED_neg0, OUTPUT);
  pinMode(levelLED_level, OUTPUT);
  pinMode(levelLED_pos0, OUTPUT);
  pinMode(levelLED_pos1, OUTPUT);

  Serial.println();
}

void loop() {
  if (tempEn) {
    tempAcc = 0;
  }

  if (angleEn) {
    angleXacc = 0;
    angleYacc = 0;
    angleZacc = 0;
  }

  if (accEn) {
    accXacc = 0;
    accYacc = 0;
    accZacc = 0;
  }

  if (gyroEn) {
    gyroXacc = 0;
    gyroYacc = 0;
    gyroZacc = 0;
  }

  if (accAngleEn) {
    accAngleXacc = 0;
    accAngleYacc = 0;
    accAngleZacc = 0;
  }

  startMillis = millis();
  for (i = 0; i < values; i++) {
    if (tempEn || angleEn || accEn || gyroEn || accAngleEn) {
      mpu6050.update();
    }

    // temp
    if (tempEn) {
      tempAcc = mpu6050.getTemp();
    }

    // angles
    if (angleEn) {
      angleXacc += mpu6050.getAngleX();
      angleYacc += mpu6050.getAngleY();
      angleZacc += mpu6050.getAngleZ();
    }

    // acceleration
    if (accEn) {
      accXacc += mpu6050.getAccX();
      accYacc += mpu6050.getAccY();
      accZacc += mpu6050.getAccZ();
    }

    // gyro angels
    if (gyroEn) {
      gyroXacc = mpu6050.getGyroAngleX();
      gyroYacc = mpu6050.getGyroAngleY();
      gyroZacc = mpu6050.getGyroAngleZ();
    }

    // accelleration angels
    if (accAngleEn) {
      accAngleXacc = mpu6050.getAccAngleX();
      accAngleYacc = mpu6050.getAccAngleY();
      accAngleYacc = mpu6050.getAccAngleY();
    }
  }
  endMillis = millis();

  if (tempEn) {
    Serial.print("Temp: ");
    Serial.print(tempAcc / values);
  }

  if (angleEn) {
    Serial.print("\tAngles, X: ");
    Serial.print(angleXacc / values);
    Serial.print("\tY: ");
    Serial.print(angleYacc / values);
    Serial.print("\tZ: ");
    Serial.print(angleZacc / values);
  }

  if (accEn) {
    Serial.print("\tAccelleration, X: ");
    Serial.print(accXacc / values);
    Serial.print("\tY: ");
    Serial.print(accYacc / values);
    Serial.print("\tZ: ");
    Serial.print(accZacc / values);
  }

  if (gyroEn) {
    Serial.print("\tGyro angles, X: ");
    Serial.print(gyroXacc / values);
    Serial.print("\tY: ");
    Serial.print(gyroYacc / values);
    Serial.print("\tZ: ");
    Serial.print(gyroZacc / values);
  }

  if (accAngleEn) {
    Serial.print("\tAccelleration angles, X: ");
    Serial.print(accAngleXacc / values);
    Serial.print("\tY: ");
    Serial.print(accAngleYacc / values);
    Serial.print("\tZ: ");
    Serial.print(accAngleZacc / values);
  }

  Serial.print("\t");
  Serial.print(values);
  Serial.print(" values in ");
  Serial.print(endMillis - startMillis);
  Serial.println(" ms");

  if (angleXacc / values < -2.01) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, HIGH);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);
    
    } else if ((angleXacc / values > -2.00) && (angleXacc / values < -1.01)) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, HIGH);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);
    
    } else if ((angleXacc / values < 1.00) && (angleXacc / values > -1.00)) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, HIGH);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, LOW);
    
    } else if ((angleXacc / values > 1.01) && (angleXacc / values < 2.00)) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, HIGH);
    digitalWrite(levelLED_pos1, LOW);
    
    } else if (angleXacc / values > 2.01) {
    // Turn on Level LED
    digitalWrite(levelLED_neg1, LOW);
    digitalWrite(levelLED_neg0, LOW);
    digitalWrite(levelLED_level, LOW);
    digitalWrite(levelLED_pos0, LOW);
    digitalWrite(levelLED_pos1, HIGH);
    
    }

}
