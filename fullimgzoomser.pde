
import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

float scaler = 1;
int val=0;
int inpin =0;
void setup() {
  size(1000,1000);
  smooth();
  noStroke();
    println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
}

void draw() {
  val = arduino.analogRead(inpin);
  if(val<510&&val>300) { scaler -=0.1;}
  if(val<300&&val>150) { scaler +=0.1;}
  
  translate(width/2,height/2); // use translate around scale
  scale(scaler);
  translate(-width/2,-height/2); // to scale from the center

  background(255,0,0);
  fill(0);
  ellipse(140,140,140,140);

  fill(255,0,55);
  ellipse(width/2,height/2,30,30);
  fill(255,0,200);
  ellipse(width/2,height/2,1,1);
  delay(100);
}


