EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ardInclinometer-rescue:MPU-6050-My_Parts U3
U 1 1 5E6C47C3
P 8450 3550
F 0 "U3" H 8928 3246 50  0000 L CNN
F 1 "MPU-6050" H 8928 3155 50  0000 L CNN
F 2 "My_Headers:8-pin_GY-521,_MPU-6050_header_larger_pads" H 8700 3700 50  0001 C CNN
F 3 "" H 8700 3700 50  0001 C CNN
	1    8450 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5EEE9C55
P 6600 4750
F 0 "#PWR05" H 6600 4500 50  0001 C CNN
F 1 "GND" H 6605 4577 50  0000 C CNN
F 2 "" H 6600 4750 50  0001 C CNN
F 3 "" H 6600 4750 50  0001 C CNN
	1    6600 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EEE9DA8
P 8350 4450
F 0 "#PWR09" H 8350 4200 50  0001 C CNN
F 1 "GND" H 8355 4277 50  0000 C CNN
F 2 "" H 8350 4450 50  0001 C CNN
F 3 "" H 8350 4450 50  0001 C CNN
	1    8350 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4450 6600 4550
Wire Wire Line
	8450 3650 8350 3650
Wire Wire Line
	8350 3650 8350 4450
$Comp
L power:+5V #PWR08
U 1 1 5EEEA830
P 8350 3350
F 0 "#PWR08" H 8350 3200 50  0001 C CNN
F 1 "+5V" H 8365 3523 50  0000 C CNN
F 2 "" H 8350 3350 50  0001 C CNN
F 3 "" H 8350 3350 50  0001 C CNN
	1    8350 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5EEEA9AF
P 6700 2350
F 0 "#PWR06" H 6700 2200 50  0001 C CNN
F 1 "+5V" H 6715 2523 50  0000 C CNN
F 2 "" H 6700 2350 50  0001 C CNN
F 3 "" H 6700 2350 50  0001 C CNN
	1    6700 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3550 8350 3550
Wire Wire Line
	8350 3550 8350 3350
Wire Wire Line
	6700 2350 6700 2450
$Comp
L My_Headers:2-pin_power_input_header J1
U 1 1 5EEEAF00
P 7800 1650
F 0 "J1" H 7969 1615 50  0000 L CNN
F 1 "2-pin_power_input_header" H 7800 1450 50  0001 C CNN
F 2 "My_Headers:2-pin_power_input_header_larger_pads" H 7850 1350 50  0001 C CNN
F 3 "~" H 7800 1650 50  0001 C CNN
	1    7800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1650 6400 1650
Wire Wire Line
	6400 1650 6400 2450
$Comp
L power:+9V #PWR04
U 1 1 5EEEB9DE
P 6400 1550
F 0 "#PWR04" H 6400 1400 50  0001 C CNN
F 1 "+9V" H 6415 1723 50  0000 C CNN
F 2 "" H 6400 1550 50  0001 C CNN
F 3 "" H 6400 1550 50  0001 C CNN
	1    6400 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1550 6400 1650
Connection ~ 6400 1650
$Comp
L power:GND #PWR07
U 1 1 5EEEBD84
P 7500 1850
F 0 "#PWR07" H 7500 1600 50  0001 C CNN
F 1 "GND" H 7505 1677 50  0000 C CNN
F 2 "" H 7500 1850 50  0001 C CNN
F 3 "" H 7500 1850 50  0001 C CNN
	1    7500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1750 7500 1750
Wire Wire Line
	7500 1750 7500 1850
$Comp
L My_Headers:4-pin_I2C_LCD_header J2
U 1 1 5EEEC988
P 8650 5250
F 0 "J2" H 8878 5246 50  0000 L CNN
F 1 "4-pin_I2C_LCD_header" H 8878 5155 50  0000 L CNN
F 2 "My_Headers:4-pin_I2C_LCD_header_larger" H 8850 4850 50  0001 C CNN
F 3 "~" H 8650 5250 50  0001 C CNN
	1    8650 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 5EEEE331
P 8350 5000
F 0 "#PWR010" H 8350 4850 50  0001 C CNN
F 1 "+5V" H 8365 5173 50  0000 C CNN
F 2 "" H 8350 5000 50  0001 C CNN
F 3 "" H 8350 5000 50  0001 C CNN
	1    8350 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5150 8350 5150
Wire Wire Line
	8350 5150 8350 5000
$Comp
L power:GND #PWR011
U 1 1 5EEEE7BF
P 8350 5600
F 0 "#PWR011" H 8350 5350 50  0001 C CNN
F 1 "GND" H 8355 5427 50  0000 C CNN
F 2 "" H 8350 5600 50  0001 C CNN
F 3 "" H 8350 5600 50  0001 C CNN
	1    8350 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5250 8350 5250
Wire Wire Line
	8350 5250 8350 5600
Wire Wire Line
	8450 3850 7700 3850
Wire Wire Line
	8450 3750 7600 3750
Wire Wire Line
	7600 3750 7600 3950
Wire Wire Line
	7600 3950 7000 3950
Wire Wire Line
	8450 5350 7700 5350
Wire Wire Line
	7700 5350 7700 3850
Connection ~ 7700 3850
Wire Wire Line
	7700 3850 7000 3850
Wire Wire Line
	8450 5450 7600 5450
Wire Wire Line
	7600 5450 7600 3950
Connection ~ 7600 3950
$Comp
L My_Headers:6-pin_5_button_header U1
U 1 1 5EEFE39C
P 1900 2950
F 0 "U1" H 2142 3175 50  0000 C CNN
F 1 "6-pin_5_button_header" H 2142 3084 50  0000 C CNN
F 2 "My_Headers:6-pin_5_switch_header_large" H 2125 3050 50  0001 C CNN
F 3 "" H 2125 3050 50  0001 C CNN
	1    1900 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1900 3150 2300 3150
Wire Wire Line
	1900 3050 2000 3050
Wire Wire Line
	1900 3250 2600 3250
Wire Wire Line
	1900 3450 3200 3450
$Comp
L power:+5V #PWR01
U 1 1 5EF01F47
P 2000 2650
F 0 "#PWR01" H 2000 2500 50  0001 C CNN
F 1 "+5V" H 2015 2823 50  0000 C CNN
F 2 "" H 2000 2650 50  0001 C CNN
F 3 "" H 2000 2650 50  0001 C CNN
	1    2000 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2950 2000 2950
Wire Wire Line
	2000 2950 2000 2650
$Comp
L Device:R R1
U 1 1 5EF082BA
P 2000 3750
F 0 "R1" H 2070 3796 50  0000 L CNN
F 1 "10k" H 2070 3705 50  0000 L CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 1930 3750 50  0001 C CNN
F 3 "~" H 2000 3750 50  0001 C CNN
	1    2000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3600 2000 3050
Connection ~ 2000 3050
Wire Wire Line
	2000 3050 6000 3050
$Comp
L Device:R R2
U 1 1 5EF11A1E
P 2300 3750
F 0 "R2" H 2370 3796 50  0000 L CNN
F 1 "10k" H 2370 3705 50  0000 L CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 2230 3750 50  0001 C CNN
F 3 "~" H 2300 3750 50  0001 C CNN
	1    2300 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5EF1236C
P 2600 3750
F 0 "R3" H 2670 3796 50  0000 L CNN
F 1 "10k" H 2670 3705 50  0000 L CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 2530 3750 50  0001 C CNN
F 3 "~" H 2600 3750 50  0001 C CNN
	1    2600 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5EF12DF3
P 2900 3750
F 0 "R4" H 2970 3796 50  0000 L CNN
F 1 "10k" H 2970 3705 50  0000 L CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 2830 3750 50  0001 C CNN
F 3 "~" H 2900 3750 50  0001 C CNN
	1    2900 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5EF138D6
P 3200 3750
F 0 "R5" H 3270 3796 50  0000 L CNN
F 1 "10k" H 3270 3705 50  0000 L CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 3130 3750 50  0001 C CNN
F 3 "~" H 3200 3750 50  0001 C CNN
	1    3200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3600 2300 3150
Connection ~ 2300 3150
Wire Wire Line
	2300 3150 6000 3150
Wire Wire Line
	2600 3600 2600 3250
Connection ~ 2600 3250
Wire Wire Line
	2600 3250 6000 3250
Wire Wire Line
	2900 3600 2900 3350
Connection ~ 2900 3350
Wire Wire Line
	2900 3350 1900 3350
Wire Wire Line
	2000 3900 2000 4000
Wire Wire Line
	2000 4000 2300 4000
Wire Wire Line
	3200 4000 3200 3900
Connection ~ 2900 4000
Wire Wire Line
	2900 4000 3200 4000
Wire Wire Line
	2600 3900 2600 4000
Connection ~ 2600 4000
Wire Wire Line
	2600 4000 2900 4000
Wire Wire Line
	2300 3900 2300 4000
Connection ~ 2300 4000
Wire Wire Line
	2300 4000 2600 4000
$Comp
L power:GND #PWR02
U 1 1 5EF19BEA
P 3200 4100
F 0 "#PWR02" H 3200 3850 50  0001 C CNN
F 1 "GND" H 3205 3927 50  0000 C CNN
F 2 "" H 3200 4100 50  0001 C CNN
F 3 "" H 3200 4100 50  0001 C CNN
	1    3200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4000 3200 4100
Connection ~ 3200 4000
$Comp
L My_Headers:6-pin_5_LED_header U2
U 1 1 5EF2BC55
P 3450 5650
F 0 "U2" H 3692 5875 50  0000 C CNN
F 1 "6-pin_5_LED_header" H 3692 5784 50  0000 C CNN
F 2 "My_Headers:6-pin_5_LED_header_large" H 3675 5750 50  0001 C CNN
F 3 "" H 3675 5750 50  0001 C CNN
	1    3450 5650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 5650 3600 5650
Wire Wire Line
	3600 5650 3600 6250
$Comp
L power:GND #PWR03
U 1 1 5EF2F8C6
P 3600 6250
F 0 "#PWR03" H 3600 6000 50  0001 C CNN
F 1 "GND" H 3605 6077 50  0000 C CNN
F 2 "" H 3600 6250 50  0001 C CNN
F 3 "" H 3600 6250 50  0001 C CNN
	1    3600 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EF31830
P 4900 4950
F 0 "R6" V 4693 4950 50  0000 C CNN
F 1 "220R" V 4784 4950 50  0000 C CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 4830 4950 50  0001 C CNN
F 3 "~" H 4900 4950 50  0001 C CNN
	1    4900 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5EF332EE
P 4900 5250
F 0 "R7" V 4693 5250 50  0000 C CNN
F 1 "220R" V 4784 5250 50  0000 C CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 4830 5250 50  0001 C CNN
F 3 "~" H 4900 5250 50  0001 C CNN
	1    4900 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5EF3435E
P 4900 5550
F 0 "R8" V 4693 5550 50  0000 C CNN
F 1 "220R" V 4784 5550 50  0000 C CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 4830 5550 50  0001 C CNN
F 3 "~" H 4900 5550 50  0001 C CNN
	1    4900 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5EF3549E
P 4900 5850
F 0 "R9" V 4693 5850 50  0000 C CNN
F 1 "220R" V 4784 5850 50  0000 C CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 4830 5850 50  0001 C CNN
F 3 "~" H 4900 5850 50  0001 C CNN
	1    4900 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5EF364C3
P 4900 6150
F 0 "R10" V 4693 6150 50  0000 C CNN
F 1 "220R" V 4784 6150 50  0000 C CNN
F 2 "My_Misc:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal_larger_pads" V 4830 6150 50  0001 C CNN
F 3 "~" H 4900 6150 50  0001 C CNN
	1    4900 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 4950 5150 4950
Wire Wire Line
	5150 4950 5150 3750
Wire Wire Line
	5150 3750 6000 3750
Wire Wire Line
	5050 5250 5300 5250
Wire Wire Line
	5300 5250 5300 3850
Wire Wire Line
	5300 3850 6000 3850
Wire Wire Line
	5400 5550 5400 3950
Wire Wire Line
	5400 3950 6000 3950
Wire Wire Line
	5050 5550 5400 5550
Wire Wire Line
	5050 5850 5500 5850
Wire Wire Line
	5500 5850 5500 4050
Wire Wire Line
	5500 4050 6000 4050
Wire Wire Line
	5050 6150 5650 6150
Wire Wire Line
	5650 6150 5650 4150
Wire Wire Line
	5650 4150 6000 4150
Wire Wire Line
	4750 6150 3450 6150
Wire Wire Line
	3450 6050 4650 6050
Wire Wire Line
	4650 6050 4650 5850
Wire Wire Line
	4650 5850 4750 5850
Wire Wire Line
	3450 5950 4550 5950
Wire Wire Line
	4550 5950 4550 5550
Wire Wire Line
	4550 5550 4750 5550
Wire Wire Line
	3450 5850 4450 5850
Wire Wire Line
	4450 5850 4450 5250
Wire Wire Line
	4450 5250 4750 5250
Wire Wire Line
	3450 5750 4350 5750
Wire Wire Line
	4350 5750 4350 4950
Wire Wire Line
	4350 4950 4750 4950
Wire Wire Line
	2900 3900 2900 4000
Wire Wire Line
	2900 3350 6000 3350
Wire Wire Line
	3200 3600 3200 3450
Connection ~ 3200 3450
Wire Wire Line
	3200 3450 6000 3450
Wire Wire Line
	6500 4450 6500 4550
Wire Wire Line
	6500 4700 6600 4700
Connection ~ 6600 4700
Wire Wire Line
	6600 4700 6600 4750
$Comp
L MCU_Module:Arduino_UNO_R3 A1
U 1 1 5EF52634
P 6500 3450
F 0 "A1" H 6500 4631 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 6500 4540 50  0000 C CNN
F 2 "My_Arduino:Arduino_UNO_R3_shield_larger_pads" H 6500 3450 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 6500 3450 50  0001 C CNN
	1    6500 3450
	1    0    0    -1  
$EndComp
Connection ~ 6500 4550
Wire Wire Line
	6500 4550 6500 4700
Connection ~ 6600 4550
Wire Wire Line
	6600 4550 6600 4700
$EndSCHEMATC
