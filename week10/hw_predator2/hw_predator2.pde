Flock flock;
Predator predator1;
Predator predator2;

void setup() {
  size(960, 640);
  background(0);

  flock = new Flock();

  for (int i = 0; i < 100; i++) {
    Boid b = new Boid(width/2-20, height/2-20);
    flock.addBoid(b);
  }
  
  predator1 = new Predator(width/2, height/2);
  predator2 = new Predator(width, height/3*2);
  
  smooth();
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);

  PVector predatorMovement1 = new PVector((noise(frameCount*.33)-10.5), (noise(frameCount*.03)-1.5));
  predator1.applyForce(predatorMovement1);
  predator1.predate1(flock.boids); 

  PVector predatorMovement2 = new PVector((noise(frameCount*.01)-.5), (noise(frameCount*.03)-.5));
  predator2.applyForce(predatorMovement2);
  predator2.predate1(flock.boids); 

  flock.run();
}
