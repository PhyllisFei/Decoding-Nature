// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Stay Within Circle
// "Made-up" Steering behavior to stay within walls

Vehicle v;
boolean debug = true;

PVector circleposition;
float circleRadius;
float angle;
float x, y;


void setup() {
  size(640, 480);
  circleRadius = 200;
  angle = radians(80);

  v = new Vehicle(random(width), random(height));
  circleposition = new PVector(x, y);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  pushMatrix();
  x = circleRadius * cos(angle);
  y = circleRadius * sin(angle);

  if (debug) {
    stroke(175);
    noFill();
    ellipse(circleposition.x, circleposition.y, circleRadius, circleRadius);
  }
  popMatrix();
  
  if (circleRadius!=0 && angle != 0) { 
    circleRadius -= .3;
    angle -= .01;
  } else{
    circleRadius = 0;
    angle = 0;
  }

  v.boundaries();
  v.run();
}

void mousePressed() {
  debug = !debug;
}
