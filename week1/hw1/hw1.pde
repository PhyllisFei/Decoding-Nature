import processing.sound.*;

Walker w;
SinOsc sine;

float freq=400;
float amp=0.5;
float pos;

void setup() {
  size(640, 480);
  background(100);
  noStroke();
  w = new Walker();

  sine = new SinOsc(this);
  sine.play();
}

void draw() {
  fill(0, 6);
  rect(0, 0, width, height);
  
  w.step();
  w.display();

  // Map mouseY from 0.0 to 1.0 for amplitude
  amp=map(mouseY, 0, height, 1.0, 0.0);
  sine.amp(amp);

  // Map mouseX from 20Hz to 1000Hz for frequency  
  freq=map(mouseX, 0, width, 80.0, 1000.0);
  sine.freq(freq);

  // Map mouseX from -1.0 to 1.0 for left to right 
  pos=map(mouseX, 0, width, -1.0, 1.0);
  sine.pan(pos);
}
