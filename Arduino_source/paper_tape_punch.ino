// name: paper_tape_punch
// Arduino IDE version 2.3.3, should work on both older and newer IDE versions.
// Driver code for a simple 8-bit paper tape punch using 9 small rc-servos.
// Because the servos are used only in two positions punch or unpunched the
// PWM handling is very simple when using the library <Servo.h>
// An interrupt is used to control the PWM (pulse width).
// For RC-servos the repetition frequency is typically 50 Hz.
// The delays needed to punch and retract have to be determined experimentally
// for maximum speed.
// The speed of the paper tape punch will be very low. My guess is that
// will be able to punch at most a few characters per second. We are talking about
// say 10-50 bits per second. Punching a loader of a few hundred bytes will run
// in a reasonable few minutes. Punching a long 15 m long tape holding for example
// a 6 kByte basic interpreter will take perhaps an hour.
//
// Notice that the IO-pins selected on the M2560 may seem illogical. The reason is
// that I have been designing a "shield" for the Mega2560. The way the IO-pins were 
// selected simplifies the routing on the Mega2560 shield board.
//
// This is absolutely free software. Feel free to use and modify. 
// Lars Silen 2024

#include <Servo.h>
#include <A4988.h>

// We define the exact servo positions of the punches here
// Allowing calibration of small build errors.
#define iBit0  0
#define iBit1  0
#define iBit2  0
#define iBitPA 0
#define iBit3  0
#define iBit4  0
#define iBit5  0
#define iBit6  0
#define iBit7  0

#define pBit0  45
#define pBit1  45
#define pBit2  45
#define pBitPA 45
#define pBit3  45
#define pBit4  45
#define pBit5  45
#define pBit6  45
#define pBit7  45
 
// One character step is 2.5 mm. We need to calibrate the constant below to
// generate the correct movement between punched characters.
#define one_position 15  

// using a NEMA-17 200-step motor (most common)
#define MOTOR_STEPS 200
// configure the pins connected
#define DIR 9
#define STEP 8
#define MS1 10
#define MS2 11
#define MS3 12

#define Bit0 52
#define Bit1 50
#define Bit2 48
#define PaperAdvance 46
#define Bit3 44
#define Bit4 42
#define Bit5 40
#define Bit6 38
#define Bit7 36

A4988 stepper(MOTOR_STEPS, DIR, STEP, MS1, MS2, MS3);

// Define servos for the IO-pins 44-52.
Servo servoB0;
Servo servoB1;
Servo servoB2;
Servo servoPA;
Servo servoB3;
Servo servoB4;
Servo servoB5;
Servo servoB6;
Servo servoB7;

short punch_char;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println('Setting up servos');
  servoB0.attach(52);  // Bit 0
  servoB1.attach(50);  // Bit 1
  servoB2.attach(48);  // Bit 2
  servoPA.attach(46);  // Paper advance
  servoB3.attach(44);  // Bit 3
  servoB4.attach(42);  // Bit 4
  servoB5.attach(40);  // Bit 5
  servoB6.attach(38);  // Bit 6
  servoB7.attach(36);  // Bit 7
  // Set all servos to no punch (idle)
  PWM_idle();
  // Set up the stepper motor
  stepper.begin(120,1);
}

void PWM_idle() {
  servoB0.write(iBit0);
  servoB1.write(iBit1);
  servoB2.write(iBit2);
  servoPA.write(iBitPA);
  servoB3.write(iBit3);
  servoB4.write(iBit4);
  servoB5.write(iBit5);
  servoB6.write(iBit6);
  servoB7.write(iBit7);
  // Time to retract all punches
  delay(300);
}

// Punch one character
void PWM_punch(char pChar) {
  Serial.println("Punch: ");
  Serial.println(pChar);
  if(pChar & 1) servoB0.write(pBit0);
  if(pChar & 2) servoB1.write(pBit1);
  if(pChar & 4) servoB2.write(pBit2);
  servoPA.write(pBitPA);  // Paper movement always punched
  if(pChar & 8) servoB3.write(pBit3);
  if(pChar & 16) servoB4.write(pBit4);
  if(pChar & 32) servoB5.write(pBit5);
  if(pChar & 64) servoB6.write(pBit6);
  if(pChar & 128) servoB7.write(pBit7);
  // Make sure there is enough time to punch
  delay(200);
  // Retract all needles.
  PWM_idle();  
}

// Move the tape to the next position using the stepper driver.
void move_to_next_pos(){
  Serial.println("Moving to next punch position");
  stepper.rotate(one_position);
  delay(200);
}

void loop() {
  short myByte=0;
  char c;
  String s;
  // The buffer is very small 64 bytes. Feed data really slowly
  // if no hand shake is used. Perhaps best to slow down on the
  // sender side. 
  if (Serial.available() > 0){
    c = Serial.read();
    //Serial.println("Read: ");
    // Serial.println(s);
    Serial.println(c);
    PWM_punch(c);
    move_to_next_pos();
  }
}

