# Murano Steering Wheel Bluetooth Keyboard

Adafruit Feather board for interfacing with the Murano computer to convert steering wheel button presses into Bluetooth key strokes to control media on phone.

## Notes

SIG_YELLOW = Wire #6 - Steering Wheel Signal A
SIG_BLUE = Wire #16 - Steering Wheel Signal B
SIG_GND = Wire #15 - Steering Wheel Signal GND

Buttons produce a 1-5V which is level-converted with resistor divider and connected to two analog inputs on the Feather. 
