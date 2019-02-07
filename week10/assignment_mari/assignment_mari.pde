// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

import processing.sound.*;
SoundFile sample;
Amplitude rms;
float scale=5;
float smooth_factor=0.25;
float sum;

Flock flock;

void setup() {
  size(1280, 960);
  background(0);
  flock = new Flock();
  for (int i = 0; i < 300; i++) {
    Boid b = new Boid(random(width), random(height), false, 0, 3, 1.5);
    flock.addBoid(b);
  }
  sample = new SoundFile(this, "song.wav");
  sample.play();
  rms = new Amplitude(this);
  rms.input(sample);
}

void draw() {
  //smoothing the rms 
  sum += (rms.analyze() - sum) * smooth_factor; 
  // scaled to height/2 and then multiplied by a scale factor
  float rmsValue=sum*scale;
  //println(rmsValue);

  //TIMER
  int m = millis(); 
  println(m); 

  //CHANGING BETWEEN BACKGROUND MODES 
  if (m < 10000) {
  } else if (m > 10000 && m < 42000) {
    fill(0, 5);
    rect(0, 0, width, height);
  } else if (m > 42000 && m < 45000) {
    fill(0, 50);
    rect(0, 0, width, height);
  } else if (m > 45000 && m < 75000) {
    rect(0, 0, width, height);
  }  else {
    fill(0, 50);
    rect(0, 0, width, height);
  }
  flock.run(m, rmsValue);
}
