EESchema Schematic File Version 4
LIBS:pwm_tiny_trigger-cache
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
L MCU_Microchip_ATtiny:ATtiny85-20SU U2
U 1 1 5D608152
P 5700 2750
F 0 "U2" V 5050 3200 50  0000 C CNN
F 1 "ATtiny85-20SU" V 5150 2950 50  0000 C CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 5700 2750 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 5700 2750 50  0001 C CNN
	1    5700 2750
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5D60D28D
P 4550 4950
F 0 "SW1" V 4650 5050 50  0000 L CNN
F 1 "SW_Push" H 4595 5098 50  0001 L CNN
F 2 "" H 4550 5150 50  0001 C CNN
F 3 "~" H 4550 5150 50  0001 C CNN
	1    4550 4950
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_SP3T SW2
U 1 1 5D60E3FB
P 5400 5550
F 0 "SW2" H 5300 5700 50  0000 C CNN
F 1 "SW_SP3T" H 5400 5742 50  0001 C CNN
F 2 "" H 4775 5725 50  0001 C CNN
F 3 "~" H 4775 5725 50  0001 C CNN
	1    5400 5550
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5D611A23
P 4950 4700
F 0 "D1" H 4950 4550 50  0000 C CNN
F 1 "LED" H 4943 4825 50  0001 C CNN
F 2 "" H 4950 4700 50  0001 C CNN
F 3 "~" H 4950 4700 50  0001 C CNN
	1    4950 4700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 5D613341
P 5400 4700
F 0 "R4" V 5193 4700 50  0000 C CNN
F 1 "2KΩ" V 5284 4700 50  0000 C CNN
F 2 "" V 5330 4700 50  0001 C CNN
F 3 "~" H 5400 4700 50  0001 C CNN
	1    5400 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5D61B56E
P 4550 5300
F 0 "R1" H 4620 5346 50  0000 L CNN
F 1 "2KΩ" H 4620 5255 50  0000 L CNN
F 2 "" V 4480 5300 50  0001 C CNN
F 3 "~" H 4550 5300 50  0001 C CNN
	1    4550 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5D61C762
P 4550 5600
F 0 "R2" H 4620 5646 50  0000 L CNN
F 1 "2KΩ" H 4620 5555 50  0000 L CNN
F 2 "" V 4480 5600 50  0001 C CNN
F 3 "~" H 4550 5600 50  0001 C CNN
	1    4550 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D61CC25
P 4550 5900
F 0 "R3" H 4620 5946 50  0000 L CNN
F 1 "2KΩ" H 4620 5855 50  0000 L CNN
F 2 "" V 4480 5900 50  0001 C CNN
F 3 "~" H 4550 5900 50  0001 C CNN
	1    4550 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5D62246E
P 4550 6100
F 0 "#PWR04" H 4550 5850 50  0001 C CNN
F 1 "GND" H 4555 5927 50  0000 C CNN
F 2 "" H 4550 6100 50  0001 C CNN
F 3 "" H 4550 6100 50  0001 C CNN
	1    4550 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5D63A4A4
P 3600 2750
F 0 "J1" H 3600 2950 50  0000 C CNN
F 1 "Conn_01x03" H 3518 2976 50  0001 C CNN
F 2 "" H 3600 2750 50  0001 C CNN
F 3 "~" H 3600 2750 50  0001 C CNN
	1    3600 2750
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L78L05_SO8 U1
U 1 1 5D6357AC
P 4500 2750
F 0 "U1" V 4546 2855 50  0000 L CNN
F 1 "L78L05_SO8" V 4750 2250 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4600 2950 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4700 2750 50  0001 C CNN
	1    4500 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4250 2750 4250 3250
Wire Wire Line
	4500 2250 4500 2450
Wire Wire Line
	5100 2750 5000 2750
Wire Wire Line
	3800 2750 4250 2750
Wire Wire Line
	3800 2650 4150 2650
Wire Wire Line
	4150 2650 4150 2250
Wire Wire Line
	4150 2250 4500 2250
Wire Wire Line
	4500 2250 4500 1900
Wire Wire Line
	4500 1900 6400 1900
Wire Wire Line
	6400 1900 6400 2750
Wire Wire Line
	6400 2750 6300 2750
Connection ~ 4500 2250
Wire Wire Line
	5000 3250 5000 2750
Connection ~ 5000 2750
Wire Wire Line
	5000 2750 4800 2750
Wire Wire Line
	3800 2850 4050 2850
Wire Wire Line
	4050 2850 4050 3100
Wire Wire Line
	4050 3100 4500 3100
Wire Wire Line
	4500 3100 4500 3050
Wire Notes Line
	6500 1800 6500 4000
Wire Notes Line
	3550 1800 6500 1800
Text Label 3850 2650 0    50   ~ 0
5V
Text Label 3850 2750 0    50   ~ 0
GND
Text Label 3850 2850 0    50   ~ 0
VIN
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5D65E5BB
P 5050 3950
F 0 "J2" V 5050 4350 50  0000 R CNN
F 1 "Conn_01x06" V 5013 3562 50  0001 R CNN
F 2 "" H 5050 3950 50  0001 C CNN
F 3 "~" H 5050 3950 50  0001 C CNN
	1    5050 3950
	0    -1   1    0   
$EndComp
Wire Notes Line
	6500 4000 3550 4000
Wire Wire Line
	6000 3350 6000 3400
Wire Wire Line
	6000 3400 4850 3400
Wire Wire Line
	4850 3400 4850 3750
Wire Wire Line
	5900 3350 5900 3450
Wire Wire Line
	5900 3450 4950 3450
Wire Wire Line
	4950 3450 4950 3750
Wire Wire Line
	5800 3350 5800 3500
Wire Wire Line
	5800 3500 5050 3500
Wire Wire Line
	5050 3500 5050 3750
Wire Wire Line
	5700 3350 5700 3550
Wire Wire Line
	5700 3550 5150 3550
Wire Wire Line
	5150 3550 5150 3750
Wire Wire Line
	5600 3350 5600 3600
Wire Wire Line
	5600 3600 5250 3600
Wire Wire Line
	5250 3600 5250 3750
Wire Wire Line
	5500 3350 5500 3650
Wire Wire Line
	5500 3650 5350 3650
Wire Wire Line
	5350 3650 5350 3750
Text Label 4850 3750 1    39   ~ 8
PWM1
Text Label 4950 3750 1    39   ~ 8
PWM2
Text Label 5250 3750 1    39   ~ 8
PWM3
$Comp
L power:+5V #PWR01
U 1 1 5D6B9E99
P 4150 2250
F 0 "#PWR01" H 4150 2100 50  0001 C CNN
F 1 "+5V" H 4165 2423 50  0000 C CNN
F 2 "" H 4150 2250 50  0001 C CNN
F 3 "" H 4150 2250 50  0001 C CNN
	1    4150 2250
	1    0    0    -1  
$EndComp
Connection ~ 4150 2250
$Comp
L power:GND #PWR02
U 1 1 5D6C1713
P 4250 3250
F 0 "#PWR02" H 4250 3000 50  0001 C CNN
F 1 "GND" H 4255 3077 50  0000 C CNN
F 2 "" H 4250 3250 50  0001 C CNN
F 3 "" H 4250 3250 50  0001 C CNN
	1    4250 3250
	1    0    0    -1  
$EndComp
Connection ~ 4250 3250
$Comp
L power:+5V #PWR03
U 1 1 5D6D1BBB
P 4550 4700
F 0 "#PWR03" H 4550 4550 50  0001 C CNN
F 1 "+5V" H 4565 4873 50  0000 C CNN
F 2 "" H 4550 4700 50  0001 C CNN
F 3 "" H 4550 4700 50  0001 C CNN
	1    4550 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4700 5100 4700
Wire Wire Line
	5150 3750 5150 4350
Wire Wire Line
	5150 4350 5600 4350
Wire Wire Line
	5600 4350 5600 4700
Wire Wire Line
	5600 4700 5550 4700
Connection ~ 5150 3750
Wire Wire Line
	4550 5150 5200 5150
Wire Wire Line
	5200 5150 5200 5450
Connection ~ 4550 5150
Wire Wire Line
	4550 5450 5050 5450
Wire Wire Line
	5050 5450 5050 5550
Wire Wire Line
	5050 5550 5200 5550
Connection ~ 4550 5450
Wire Wire Line
	4550 5750 5050 5750
Wire Wire Line
	5050 5750 5050 5650
Wire Wire Line
	5050 5650 5200 5650
Connection ~ 4550 5750
Wire Wire Line
	5600 5550 5750 5550
Wire Wire Line
	5750 5550 5750 4150
Wire Notes Line
	3550 4000 3550 1800
Wire Wire Line
	5750 4150 5350 4150
Wire Wire Line
	4800 4700 4550 4700
Wire Wire Line
	4550 4750 4550 4700
Connection ~ 4550 4700
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5D788714
P 6300 3900
F 0 "#FLG0101" H 6300 3975 50  0001 C CNN
F 1 "PWR_FLAG" V 6300 4027 50  0001 L CNN
F 2 "" H 6300 3900 50  0001 C CNN
F 3 "~" H 6300 3900 50  0001 C CNN
	1    6300 3900
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5D78AE50
P 6300 3800
F 0 "#FLG0102" H 6300 3875 50  0001 C CNN
F 1 "PWR_FLAG" V 6300 3927 50  0001 L CNN
F 2 "" H 6300 3800 50  0001 C CNN
F 3 "~" H 6300 3800 50  0001 C CNN
	1    6300 3800
	0    -1   -1   0   
$EndComp
Text Label 5350 3750 1    39   ~ 8
BTN
Text Label 5150 3750 1    39   ~ 8
LED
Wire Wire Line
	4250 3250 5000 3250
Text Label 6300 3800 0    50   ~ 0
VIN
Text Label 6300 3900 0    50   ~ 0
GND
Wire Wire Line
	4550 6100 4550 6050
Wire Wire Line
	5350 3750 5350 4150
Connection ~ 5350 3750
Text Notes 5350 4050 0    20   ~ 0
P5
Text Notes 5250 4050 0    20   ~ 0
P4
Text Notes 5150 4050 0    20   ~ 0
P3
Text Notes 5050 4050 0    20   ~ 0
P2
Text Notes 4950 4050 0    20   ~ 0
P1
Text Notes 4850 4050 0    20   ~ 0
P0
$EndSCHEMATC
