#include <Servo.h>

Servo mi_servo;
void setup() {
  Serial.begin(9600);

  mi_servo.attach(8);
}
void loop() {
  if (Serial.available()){

    char angulo = Serial.read();

    if (angulo >= 0 && angulo <= 180){
      mi_servo.write(angulo);
      delay(10);      
      }
   }
}

