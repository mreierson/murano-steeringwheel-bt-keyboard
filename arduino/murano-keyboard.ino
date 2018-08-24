#include <Adafruit_BluefruitLE_UART.h>
#include <Adafruit_BLE.h>
#include <Adafruit_BLEGatt.h>
#include <Adafruit_ATParser.h>
#include <Adafruit_BluefruitLE_SPI.h>
#include <Adafruit_BLEEddystone.h>
#include <Adafruit_BLEMIDI.h>
#include <Adafruit_BLEBattery.h>

#define VERBOSE_MODE                   true

#define BLUEFRUIT_SPI_CS               8
#define BLUEFRUIT_SPI_IRQ              7
#define BLUEFRUIT_SPI_RST              4    // Optional but recommended, set to -1 if unused

// SOFTWARE SPI SETTINGS
// ----------------------------------------------------------------------------------------------
// The following macros declare the pins to use for SW SPI communication.
// This should be used with nRF51822 based Bluefruit LE modules that use SPI
// (Bluefruit LE SPI Friend).
// ----------------------------------------------------------------------------------------------
#define BLUEFRUIT_SPI_SCK              13
#define BLUEFRUIT_SPI_MISO             12
#define BLUEFRUIT_SPI_MOSI             11

#define PIN_AIN1 19
#define PIN_AIN3 21

Adafruit_BluefruitLE_SPI ble(BLUEFRUIT_SPI_CS, BLUEFRUIT_SPI_IRQ, BLUEFRUIT_SPI_RST);

// 5 buttons come in on AIN1, and the other half on AIN3
int BTN_NONE = 0;
int BTN_SOURCE = 1;
int BTN_MENUUP = 2;
int BTN_MENUDN = 3;
int BTN_ENTER = 4;
int BTN_BACK = 5;
int BTN_VOLDN = 6;
int BTN_VOLUP = 7;
int BTN_VOICE = 8;
int BTN_PHONE = 9;

int counter = 0;
int buttonPressed = BTN_NONE;
int lastPressedIndex = -1;

void setup() {
  pinMode(5, INPUT);
  ble.sendCommandCheckOK("AT+BLEHIDEN=ON");
  ble.sendCommandCheckOK("AT+BLEKEYBOARDEN=ON");
  ble.reset();
}

void loop()
{
  buttonPressed = BTN_NONE;

  int ain1 = analogRead(PIN_AIN1);
  int ain3 = analogRead(PIN_AIN3);

  // check the analog bands on either analog input 1 or 3 to determine which button was pressed
  if ((ain1 > 0) && (ain1 < 15)) {

    buttonPressed = BTN_VOLDN;

  } else if ((ain1 > 195) && (ain1 < 215)) {

    buttonPressed = BTN_VOLUP;

  } else if ((ain1 > 390) && (ain1 < 410)) {

    buttonPressed = BTN_PHONE;

  } else if ((ain1 > 575) && (ain1 < 595)) {

    buttonPressed = BTN_BACK;

  } else if ((ain3 > 0) && (ain3 < 20)) {

    buttonPressed = BTN_SOURCE;

  } else if ((ain3 > 195) && (ain3 < 220)) {

    buttonPressed = BTN_MENUUP;

  } else if ((ain3 > 390) && (ain3 < 410)) {

    buttonPressed = BTN_MENUDN;

  } else if ((ain3 > 570) && (ain3 < 595)) {

    buttonPressed = BTN_VOICE;

  } else if ((ain3 > 755) && (ain3 < 780)) {

    buttonPressed = BTN_ENTER;

  }

  // send out the button press via Bluetooth, along with some debouncing logic
  // the debounce values vary by button, the timings were determine by messing around until each felt right
  if (buttonPressed != BTN_NONE) {
    
    if (buttonPressed == BTN_SOURCE) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 10)) {
        ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=04-00-2B"); // alt + tab        
        ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=00-00");
        lastPressedIndex = counter;
      }
     
    } else if (buttonPressed == BTN_MENUUP) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 10)) {
        ble.sendCommandCheckOK("AT+BLEHIDCONTROLKEY=MEDIAPREVIOUS");
        lastPressedIndex = counter;
      }

    } else if (buttonPressed == BTN_MENUDN) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 3)) {      
        ble.sendCommandCheckOK("AT+BLEHIDCONTROLKEY=MEDIANEXT");
        lastPressedIndex = counter;
      }

    } else if (buttonPressed == BTN_ENTER) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 10)) {
        ble.sendCommandCheckOK("AT+BLEHIDCONTROLKEY=PLAYPAUSE");
        lastPressedIndex = counter;
      }

    } else if (buttonPressed == BTN_BACK) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 50)) {
        ble.sendCommandCheckOK("AT+BLEHIDCONTROLKEY=HOME");
        lastPressedIndex = counter;        
      }

    } else if (buttonPressed == BTN_VOLDN) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 2)) {
        ble.sendCommandCheckOK("AT+BLEHIDCONTROLKEY=VOLUME-");
        lastPressedIndex = counter;
      }

    } else if (buttonPressed == BTN_VOLUP) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 2)) {
        ble.sendCommandCheckOK("AT+BLEHIDCONTROLKEY=VOLUME+");
        lastPressedIndex = counter;
      }

    } else if (buttonPressed == BTN_VOICE) {

      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 10)) {
        // ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=04-00-2C"); // alt + space
        
        ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=01-00-2C"); // ctrl + space - seems useful
        // ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=08-00-2C"); // gui + space - nothing
        // ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=01-00-29"); // ctrl + esc - workspace switcher
        // ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=04-00-29"); // alt + esc - goes to home screen

        // ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=04-00-2B"); // alt + tab

        
        ble.sendCommandCheckOK("AT+BLEKEYBOARDCODE=00-00");
        lastPressedIndex = counter;
      }

    } else if (buttonPressed == BTN_PHONE) {
      
      if ((lastPressedIndex == -1) || ((counter - lastPressedIndex) > 10)) {
        ble.sendCommandCheckOK("AT+BLEHIDCONTROLKEY=SEARCH");
        lastPressedIndex = counter;        
      }
      
    }
  }

  delay(100);
  counter = counter + 1;
}

