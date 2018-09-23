Mover[] movers = new Mover[10];

void setup() {
  size(640, 480);
  noStroke();
  //m = new Mover(width/2, 0, 30);

  for (int i=0; i<movers.length; i++) {
    //movers[i] = new Mover(10+i*width/10, height/2, random(10, 40));
    movers[i] = new Mover(0, 40+i*height/10, random(10, 30));
  }
}

void draw() {
  background(0);

  for (Mover m : movers) {
    //PVector gravity = new PVector(0, .1*m.mass);
    //m.applyForce(gravity);
    PVector wind = new PVector(.1, 0);
    m.applyForce(wind);
    PVector friction = m.vel.copy();
    float c = .08;
    friction.mult(-1);
    friction.normalize();

    if (m.pos.x<width/3 && m.pos.x>0) {
      friction.mult(c/3);
    } else if (m.pos.x<width/3*2 && m.pos.x>width/3) {
      friction.mult(-c);
    } else {
      friction.mult(c*4);
    }
    m.applyForce(friction);

    m.update();
    m.checkEdges();
    m.display();
  }
}
