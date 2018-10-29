PVector origin;
PVector pos;
float angle, aAcc, aVel;
float g = .4;
float r;
float damping = .01;

void setup() {
  size(640, 480);
  
  r = height/3;
  origin = new PVector(width/2, r);
  pos = new PVector(width/2, 2*r);
  aAcc = aVel = 0;
  angle = 120;
}

void draw() {
  background(255);
  //sin(angle) = pendulumForce/g
  //
  aAcc += (-g/r) * sin(angle);
  aVel += aAcc;
  angle += aVel;
  aVel *= damping;
  
  pos.set( sin(angle)*r, cos(angle)*r, 0);
  pos.add(origin);
  
  line(0, height/3, width, height/3);
  line(origin.x, origin.y, pos.x, pos.y);
  ellipse(pos.x, pos.y, 30, 30);
  
}
