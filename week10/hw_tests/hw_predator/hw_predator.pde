Flock flock;
//PVector predator;
Predator predator;

void setup() {
  size(960, 640);
  background(0);

  flock = new Flock();

  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2, height/2);
    flock.addBoid(b);
  }
  predator = new Predator(width/2, height/2);
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);

  //predator = new PVector(mouseX, mouseY);

  PVector predatorMovement = new PVector((noise(frameCount*.01)-.5), (noise(frameCount*.03)-.5));
  predator.applyForce(predatorMovement);
  predator.predate(flock.boids); 

  flock.run();

  fill(0);
  text("Drag the mouse to generate new boids.", 10, height-16);
}

//void mouseDragged() {
//  flock.addBoid(new Boid(mouseX,mouseY));
//}
