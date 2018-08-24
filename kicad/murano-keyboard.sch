EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Feather
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Murano Bluetooth Steering Wheel Keyboard"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FEATHER_32U4_BLE U1
U 1 1 59488187
P 5550 2850
F 0 "U1" H 5550 3993 60  0000 C CNN
F 1 "FEATHER_32U4_BLE" H 5550 3887 60  0000 C CNN
F 2 "Feather:FEATHER32U4BLE" H 5550 3781 60  0000 C CNN
F 3 "" H 5550 2850 60  0000 C CNN
	1    5550 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 594895F9
P 3500 1600
F 0 "#PWR3" H 3500 1350 50  0001 C CNN
F 1 "GND" H 3508 1426 50  0000 C CNN
F 2 "" H 3500 1600 50  0000 C CNN
F 3 "" H 3500 1600 50  0000 C CNN
	1    3500 1600
	1    0    0    -1  
$EndComp
Text GLabel 3350 1300 0    60   Input ~ 0
SIG_YELLOW
Text GLabel 3350 1400 0    60   Input ~ 0
SIG_BLUE
Wire Wire Line
	3350 1300 3500 1300
Wire Wire Line
	3350 1400 3500 1400
Wire Wire Line
	3500 1500 3500 1600
Text GLabel 1950 4700 0    60   Input ~ 0
SIG_YELLOW
$Comp
L R R1
U 1 1 59489725
P 1950 4950
F 0 "R1" H 1880 4858 50  0000 R CNN
F 1 "R" H 1880 4950 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 1880 5042 50  0000 R CNN
F 3 "" H 1950 4950 50  0000 C CNN
	1    1950 4950
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 594897A1
P 1950 5450
F 0 "R2" H 2020 5542 50  0000 L CNN
F 1 "R" H 2020 5450 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2020 5358 50  0000 L CNN
F 3 "" H 1950 5450 50  0000 C CNN
	1    1950 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 59489809
P 1950 5750
F 0 "#PWR1" H 1950 5500 50  0001 C CNN
F 1 "GND" H 1958 5576 50  0000 C CNN
F 2 "" H 1950 5750 50  0000 C CNN
F 3 "" H 1950 5750 50  0000 C CNN
	1    1950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5100 1950 5300
Connection ~ 1950 5200
Wire Wire Line
	1950 5600 1950 5750
Wire Wire Line
	1950 4700 1950 4800
Text GLabel 2050 5200 2    60   Input ~ 0
INPUT_YELLOW
Wire Wire Line
	1950 5200 2050 5200
Text GLabel 5400 4650 0    60   Input ~ 0
SIG_BLUE
$Comp
L R R3
U 1 1 5949BBA9
P 5400 4900
F 0 "R3" H 5330 4808 50  0000 R CNN
F 1 "R" H 5330 4900 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 5330 4992 50  0000 R CNN
F 3 "" H 5400 4900 50  0000 C CNN
	1    5400 4900
	-1   0    0    1   
$EndComp
$Comp
L R R4
U 1 1 5949BBAF
P 5400 5400
F 0 "R4" H 5470 5492 50  0000 L CNN
F 1 "R" H 5470 5400 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 5470 5308 50  0000 L CNN
F 3 "" H 5400 5400 50  0000 C CNN
	1    5400 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 5949BBB5
P 5400 5700
F 0 "#PWR2" H 5400 5450 50  0001 C CNN
F 1 "GND" H 5408 5526 50  0000 C CNN
F 2 "" H 5400 5700 50  0000 C CNN
F 3 "" H 5400 5700 50  0000 C CNN
	1    5400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5050 5400 5250
Connection ~ 5400 5150
Wire Wire Line
	5400 5550 5400 5700
Wire Wire Line
	5400 4650 5400 4750
Text GLabel 5500 5150 2    60   Input ~ 0
INPUT_BLUE
Wire Wire Line
	5400 5150 5500 5150
Text GLabel 4400 2600 0    60   Input ~ 0
INPUT_YELLOW
Text GLabel 4400 2800 0    60   Input ~ 0
INPUT_BLUE
Wire Wire Line
	4400 2600 4550 2600
Wire Wire Line
	4400 2800 4550 2800
$Comp
L GND #PWR4
U 1 1 5949BE54
P 4450 3700
F 0 "#PWR4" H 4450 3450 50  0001 C CNN
F 1 "GND" H 4458 3526 50  0000 C CNN
F 2 "" H 4450 3700 50  0000 C CNN
F 3 "" H 4450 3700 50  0000 C CNN
	1    4450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2400 4450 2400
Wire Wire Line
	4450 2400 4450 3700
$Comp
L CONN_01X04 P1
U 1 1 5949C02D
P 3700 1350
F 0 "P1" H 3777 1434 50  0000 L CNN
F 1 "CONN_01X04" H 3777 1342 50  0000 L CNN
F 2 "w_conn_screw:mstba_2,5%2f4-g-5,08" H 3777 1250 50  0000 L CNN
F 3 "" H 3700 1350 50  0000 C CNN
	1    3700 1350
	1    0    0    -1  
$EndComp
Text Notes 1900 6600 0    60   ~ 0
SIG_YELLOW = Wire #6 - Steering Wheel Signal A\nSIG_BLUE = Wire #16 - Steering Wheel Signal B\nSIG_GND = Wire #15 - Steering Wheel Signal Gnd
Text GLabel 3350 1500 0    60   Input ~ 0
SIG_GND
Wire Wire Line
	3350 1500 3500 1500
$EndSCHEMATC
