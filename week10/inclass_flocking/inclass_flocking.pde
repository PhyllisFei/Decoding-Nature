// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
Flock flock;
PVector predator;

void setup() {
  size(640,360);
  
  flock = new Flock();

  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
}

void draw() {
  background(255);
  
  predator = new PVector(mouseX, mouseY);
  
  flock.run();
  
  fill(0);
  text("Drag the mouse to generate new boids.",10,height-16);
}

//void mouseDragged() {
//  flock.addBoid(new Boid(mouseX,mouseY));
//}
