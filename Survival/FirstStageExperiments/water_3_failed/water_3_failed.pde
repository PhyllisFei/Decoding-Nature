Flock flock;
//Predator predator;
Attractor attractor;

void setup() {
  size(960,640);
  background(0);
  flock = new Flock();

  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(0, random(height/4*3, height));
    flock.addBoid(b);
  }
  //predator = new Predator(width/3, height/2);
  attractor = new Attractor(0, height/4*3);
}

void draw() {
  //background(0);
  //predator moves via perlin noise
  //PVector predatorMovement = new PVector((noise(frameCount*.01)-.5),(noise(frameCount*.03)-.5));
  //predator.applyForce(predatorMovement);
  ////pass in all the boids to the predator
  //predator.predate(flock.boids);
  
  PVector attractorMovement = new PVector((sin(frameCount*.01+.7)+.4),(cos(frameCount*.08)));
  attractor.applyForce(attractorMovement);
  attractor.attract(flock.boids);
  
  flock.run();
}

void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
