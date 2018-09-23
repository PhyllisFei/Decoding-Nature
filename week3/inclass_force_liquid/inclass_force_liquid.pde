Mover[] movers = new Mover[10];
Liquid liq;
Mover airplane;

void setup() {
  size(640, 480);
  noStroke();

  for (int i=0; i<movers.length; i++) {
    movers[i] = new Mover(random(0, width), 40+i*height/10, random(10, 30));
  }
  liq = new Liquid(0, height/2, width, height, .1);
  airplane = new Mover(0, height, 30);
}

void draw() {
  background(0);
  liq.display();

  for (Mover m : movers) {
    PVector gravity = new PVector(0, .1*m.mass);
    m.applyForce(gravity);

    if (liq.contains(m)) {
      m.applyForce( liq.dragForce(m) );
    }
    m.update();
    m.checkEdges();
    m.display();
  }

  PVector jetForce = new PVector (5, 0);
  airplane.applyForce(jetForce);

  float c = .05;
  PVector force = airplane.vel.copy();
  force.rotate(HALF_PI);
  float speed = force.mag();
  force.normalize();
  speed *= speed;
  force.mult(-1);
  force.mult(c);
  force.mult(speed);
  airplane.applyForce(force);
  airplane.update();
  airplane.checkEdges();
  airplane.display();
}
